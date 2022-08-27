import 'package:demo/Services/api_service.dart';
import 'package:demo/Services/api_url.dart';
import 'package:demo/commons/widgets.dart';
import 'package:flutter/material.dart';

class AddDisplayProvider extends ChangeNotifier {
  Future<bool> addDisplay() async {
    Map<String, dynamic> body = {
      "businessName": "name Test",
      "businessLocation": "location",
      "businessCatagory": "catgagory",
      "advertisementType": "any type string",
      "displayType": "static",
      "displayImage": "url",
      "displayStatus": "connected",
      "status": "pending",
      "specifications": "set specifications",
      "userId": "6307c8a79d8036cd17a09f3f"
    };

    String response =
        await ApiServices.simplePostWithBody(feedUrl: ApiUrls.ADD_DISPLAY, body: body);
    if (response.isEmpty) return false;

    AppWidgets.successfullySnackBar(msg: "Display Added");
    return true;
  }
}
