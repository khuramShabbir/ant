import 'package:demo/Services/api_service.dart';
import 'package:demo/Services/api_url.dart';
import 'package:demo/commons/constant.dart';
import 'package:demo/commons/local_storage.dart';
import 'package:demo/commons/widgets.dart';
import 'package:demo/models/auth_model/auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class EditProfileProvider extends ChangeNotifier {
  XFile? xFile;
  bool isPhoneVerified = false;

  Future<bool> updateProfile({
    required String name,
    required String email,
    required String contactNumber,
    required String profileUrl,
  }) async {
    Map<String, dynamic> body = {
      "userName": name,
      "email": email,
      "googleId": LocalStorage.getUserCredential().googleId,
      "contactNumber": contactNumber,
      "profileUrl": profileUrl,
    };

    String response =
        await ApiServices.simplePutWithBody(feedUrl: ApiUrls.EDIT_PROFILE, body: body);

    if (response.isEmpty) return false;
    logger.i(response);

    LocalStorage.box.remove(LocalStorage.userData);
    UserAuthModel userAuthModel = userAuthModelFromJson(response);

    await LocalStorage.box.write(LocalStorage.userData, userAuthModel.user);

    notifyListeners();
    AppWidgets.successfullySnackBar(title: "", msg: "Profile Updated Successfully");
    return true;
  }

  final ImagePicker picker = ImagePicker();

  Future<void> getImages() async {
    xFile = null;
    String choice = await AppWidgets.chooseImageSource();
    if (choice.isEmpty) {
      return;
    } else if (choice == "Camera") {
      xFile = (await picker.pickImage(source: ImageSource.camera, imageQuality: 50));
      notifyListeners();

      if (xFile != null) {}
    } else if (choice == "Gallery") {
      xFile = (await picker.pickImage(source: ImageSource.gallery, imageQuality: 50));
      notifyListeners();
    }
  }
}
