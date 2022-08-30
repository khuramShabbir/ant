import 'package:demo/Services/api_service.dart';
import 'package:demo/Services/api_url.dart';
import 'package:demo/commons/local_storage.dart';
import 'package:demo/commons/widgets.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddDisplayProvider extends ChangeNotifier {
  XFile? xFile;
  String businessType = "";
  String displayType = "";
  String displayStatus = "";
  // String status = "";
  TextEditingController businessNameCtrl = TextEditingController();
  TextEditingController businessLocationCtrl = TextEditingController();
  TextEditingController businessCategoryCtrl = TextEditingController();
  TextEditingController specificationCtrl = TextEditingController();

  Future<bool> addDisplay() async {
    Map<String, dynamic> body = {
      "businessName": businessNameCtrl.text,
      "businessLocation": businessLocationCtrl.text,
      "businessCatagory": businessCategoryCtrl.text,
      "advertisementType": businessType,
      "displayType": displayType,
      "displayImage": xFile!.path,
      "displayStatus": displayStatus,
      // "status": status,
      "specifications": specificationCtrl.text,
      "userId": LocalStorage.getUserCredential().id
    };

    String response = await ApiServices.simplePostWithBody(
        feedUrl: ApiUrls.ADD_DISPLAY, body: body, headerWithToken: true);
    if (response.isEmpty) return false;

    AppWidgets.successfullySnackBar(msg: "Display Added");
    businessNameCtrl.clear();
    businessLocationCtrl.clear();
    businessCategoryCtrl.clear();
    specificationCtrl.clear();

    return true;
  }

  void getDisplayImage() async {
    ImagePicker picker = ImagePicker();

    xFile == null;

    String choice = await AppWidgets.chooseImageSource();
    if (choice == "Camera") {
      xFile = await picker.pickImage(source: ImageSource.camera, imageQuality: 50);
      notifyListeners();
    } else if (choice == "Gallery") {
      xFile = await picker.pickImage(source: ImageSource.gallery, imageQuality: 50);
      notifyListeners();
    }
  }

  bool formValidations() {
    if (xFile == null) {
      AppWidgets.infoSnackBar(msg: 'Please add image');
      return false;
    }
    if (businessType.isEmpty) {
      AppWidgets.infoSnackBar(msg: 'Please Select Business Type');
      return false;
    }
    if (displayType.isEmpty) {
      AppWidgets.infoSnackBar(msg: 'Please Select Display Type');
      return false;
    }
    if (displayStatus.isEmpty) {
      AppWidgets.infoSnackBar(msg: 'Please Select Display Status');
      return false;
    }
    // if (status.isEmpty) {
    //   AppWidgets.infoSnackBar(msg: 'Please Select Status');
    //   return false;
    // }

    return true;
  }
}
