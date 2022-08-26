import 'dart:convert';

import 'package:demo/commons/constant.dart';
import 'package:demo/models/auth_model/auth.dart';
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
