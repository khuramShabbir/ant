import 'package:demo/Models/AuthModel/auth_model.dart'as auth;
import 'package:demo/Services/api_service.dart';
import 'package:demo/Services/api_url.dart';
import 'package:demo/commons/constant.dart';
import 'package:demo/commons/local_storage.dart';
import 'package:demo/commons/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class UserCredentialProvider extends ChangeNotifier {
  UserCredential? userCredential;
  String verificationId = '';
  String otpCode = "";

  FirebaseAuth fireAuth = FirebaseAuth.instance;

  Future<bool> signInWithGoogle(BuildContext context) async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    userCredential = await FirebaseAuth.instance.signInWithCredential(credential);

    if (userCredential == null) return false;

    User? user = userCredential!.user;
    Map<String, dynamic> body = {
      "userName": user!.displayName,
      "email": user.email,
      "googleId": googleUser!.id,
      "contactNumber": user.phoneNumber,
      "profileUrl": user.photoURL,
      "dateOfBirth": null,
      "address": null,
      "archived": false
    };

    bool status = await getUser(body);
    if (status) return true;
    return false;
  }

  Future<bool> signIn() async {
    Map<String, dynamic> body = {"googleId": LocalStorage.getUserCredential().googleId};

    String response = await ApiServices.simplePostWithBody(feedUrl: ApiUrls.SIGN_IN, body: body);
    if (response.isEmpty) return false;
    auth.UserAuthModel userAuthModel = auth.userAuthModelFromJson(response);
    await LocalStorage.box.write(LocalStorage.userData, userAuthModel.user);
    await LocalStorage.box.write(LocalStorage.token, userAuthModel.user.token);

    logger.wtf(LocalStorage.box.read(LocalStorage.token));

    notifyListeners();

    return true;
  }

  Future<bool> getUser(Map<String, dynamic> body) async {
    if (body.isEmpty) return false;
    String response = await ApiServices.simplePostWithBody(feedUrl: ApiUrls.SIGN_UP, body: body);

    if (response.isEmpty) return false;

    auth.UserAuthModel userAuthModel = auth.userAuthModelFromJson(response);

    await LocalStorage.box.write(LocalStorage.userData, userAuthModel.user);
    // await LocalStorage.box.write(LocalStorage.token, userAuthModel.token);
    notifyListeners();

    return await signIn();
  }

  Future<bool> logOut() async {
    await FirebaseAuth.instance.signOut();
    await LocalStorage.box.remove(LocalStorage.userData);
    await LocalStorage.box.remove(LocalStorage.token);
    notifyListeners();

    if (!LocalStorage.box.hasData(LocalStorage.userData)) return true;

    return false;
  }

  Future<bool> deleteAccount() async {
    String response = await ApiServices.simpleDelete(
        feedUrl: ApiUrls.DELETE_ACCOUNT, googleId: LocalStorage.getUserCredential().googleId);
    if (response.isEmpty) return false;
    logger.i(response);
    AppWidgets.successfullySnackBar(msg: "Account Deleted");

    await logOut();

    return true;
  }

  Future<void> otpSend({
    required phoneNumber,
    required String otpPin,
  }) async {
    await fireAuth.verifyPhoneNumber(
        timeout: const Duration(seconds: 60),
        phoneNumber: phoneNumber,
        verificationCompleted: (PhoneAuthCredential credential) async {},
        verificationFailed: (FirebaseAuthException exception) async {
          if (exception.code == 'invalid-phone-number') {
            AppWidgets.unsuccessfullySnackBar(msg: exception.message ?? "some thing went wrong");

            return;
          }
        },
        codeSent: (String verificationId, int? resendToken) async {
          AppWidgets.infoSnackBar(msg: "Code Sent");

          this.verificationId = verificationId;
          await verifyPhone(verificationId: verificationId, otpCode: otpPin);
        },
        codeAutoRetrievalTimeout: (String verificationId) async {});
  }

  Future<void> verifyPhone({
    required String verificationId,
    required String otpCode,
  }) async {
    PhoneAuthCredential credential =
        PhoneAuthProvider.credential(verificationId: verificationId, smsCode: otpCode);

    await fireAuth.signInWithCredential(credential);

    if (credential.verificationId!.isEmpty) {
    } else {
      AppWidgets.successfullySnackBar(msg: "Phone Number Verified");
    }
  }
}
