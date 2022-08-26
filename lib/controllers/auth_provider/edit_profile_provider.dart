import 'package:demo/Services/api_service.dart';
import 'package:demo/Services/api_url.dart';
import 'package:demo/commons/constant.dart';
import 'package:demo/commons/local_storage.dart';
import 'package:demo/models/auth_model/auth.dart';
import 'package:flutter/material.dart';

class EditProfileProvider extends ChangeNotifier {
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

    LocalStorage.box.write(LocalStorage.userData, userAuthModel.user);

    notifyListeners();

    return true;
  }
}
