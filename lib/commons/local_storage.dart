import 'dart:convert';

import 'package:demo/Models/AuthModel/auth_model.dart';
import 'package:get_storage/get_storage.dart';

class LocalStorage {
  static String userData = "user";
  static String token = "token";

  static final box = GetStorage();

  static User getUserCredential() {
    String value = jsonEncode(box.read(LocalStorage.userData));

    return userModelFromJson(value);
  }

  static String getToken() {
    return box.read(token);
  }
}
