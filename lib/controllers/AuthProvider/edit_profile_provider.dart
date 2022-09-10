import 'package:demo/Models/AuthModel/auth_model.dart';
import 'package:demo/Services/api_service.dart';
import 'package:demo/Services/api_url.dart';
import 'package:demo/commons/constant.dart';
import 'package:demo/commons/local_storage.dart';
import 'package:demo/commons/widgets.dart';
import 'package:demo/controllers/AuthProvider/user_credential_provider.dart';
import 'package:demo/views/Auth_Views/sign_in_with_google_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class EditProfileProvider extends ChangeNotifier {
  XFile? xFile;

  Future<bool> updateProfile({
    required String name,
    required String email,
    required String contactNumber,
  }) async {
    Map<String, String> body = {
      "userName": name,
      "email": email,
      "googleId": LocalStorage.getUserCredential().googleId,
      "contactNumber": contactNumber,
      // "file": base64Encode(file.readAsBytesSync()),
    };

    Map<String, String> files = {};
    if (xFile != null) {
      files.addAll({"file": xFile!.path});
    }

    String response = await ApiServices.putFormData(
        feedUrl: ApiUrls.EDIT_PROFILE, fields: body, files: xFile == null ? null : xFile!.path);

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
    String choice = await AppWidgets.chooseImageSource();
    if (choice.isEmpty) {
      return;
    } else if (choice == "Camera") {
      xFile = await picker.pickImage(source: ImageSource.camera, imageQuality: 50);
    } else if (choice == "Gallery") {
      xFile = await picker.pickImage(source: ImageSource.gallery, imageQuality: 50);
    }
    notifyListeners();
  }
}
