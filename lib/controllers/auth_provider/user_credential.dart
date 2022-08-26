import 'package:demo/Services/api_service.dart';
import 'package:demo/Services/api_url.dart';
import 'package:demo/commons/local_storage.dart';
import 'package:demo/models/auth_model/auth.dart' as auth;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class UserCredentialProvider extends ChangeNotifier {
  UserCredential? userCredential;

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

  Future<bool> getUser(Map<String, dynamic> body) async {
    if (body.isEmpty) return false;
    String response = await ApiServices.simplePostWithBody(feedUrl: ApiUrls.SIGN_UP, body: body);

    if (response.isEmpty) return false;

    auth.UserAuthModel userAuthModel = auth.userAuthModelFromJson(response);

    LocalStorage.box.write(LocalStorage.userData, userAuthModel.user);
    LocalStorage.box.write(LocalStorage.token, userAuthModel.token);

    return true;
  }

  Future<bool> logOut() async {
    await FirebaseAuth.instance.signOut();
    LocalStorage.box.erase();

    if (!LocalStorage.box.hasData(LocalStorage.userData)) return true;

    return false;
  }
}
