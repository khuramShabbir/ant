import 'package:demo/Models/add_location_model.dart';
import 'package:demo/Services/api_service.dart';
import 'package:demo/Services/api_url.dart';
import 'package:demo/commons/constant.dart';
import 'package:demo/commons/local_storage.dart';
import 'package:demo/commons/widgets.dart';
import 'package:demo/controllers/google_map_provider.dart';
import 'package:flutter/widgets.dart';
import 'package:place_picker/place_picker.dart';
import 'package:provider/provider.dart';

class StrategyProvider extends ChangeNotifier {
  String strategy = "";
  TextEditingController strategyCtrl = TextEditingController();
  TextEditingController displayLocationCtrl = TextEditingController();
  LatLng? latLng;

  AddLocationModel? addLocationModel;

  Future<bool> submitLocation({
    required String lat,
    required String lng,
    required String address,
  }) async {
    Map<String, String> body = {
      "lat": lat,
      "lng": lng,
      "address": address,
      "isShown": true.toString(),
      "userId": LocalStorage.getUserCredential().id
    };

    String result =
        await ApiServices.simplePostWithBody(feedUrl: ApiUrls.ADD_DISPLAY_LOCATION, body: body);
    logger.i(result);
    if (result.isEmpty) return false;
    addLocationModel = addLocationModelFromJson(result);

    notifyListeners();
    return true;
  }

  Future<bool> submitStrategy({
    required String lat,
    required String lng,
    required String address,
  }) async {
    bool status = await submitLocation(lat: lat, lng: lng, address: address);
    if (!status) return AppWidgets.unsuccessfullySnackBar(msg: "Something Went Wrong");

    Map<String, String> body = {
      "strategy": strategy,
      "ratePerMinute": strategyCtrl.text,
      "userId": LocalStorage.getUserCredential().id,
      "displayLocationId": addLocationModel!.displayLocation.id
    };

    String result = await ApiServices.simplePostWithBody(feedUrl: ApiUrls.NEW_STRATEGY, body: body);
    logger.i(result);
    if (result.isEmpty) {
      AppWidgets.unsuccessfullySnackBar(msg: "Something Went Wrong");
      return false;
    }
    AppWidgets.successfullySnackBar(msg: "Strategy Added Successfully");
    disposeCtrl();
    notifyListeners();
    return true;
  }

  bool formValidator(context) {
    if (strategy.isEmpty) {
      AppWidgets.unsuccessfullySnackBar(msg: "Please Select Strategy");
      return false;
    }

    if (latLng == null) {
      AppWidgets.infoSnackBar(msg: 'Please Add Location From Google Map');

      return false;
    }
    return true;
  }

  void disposeCtrl() {
    strategy = "";
    strategyCtrl.clear();
    displayLocationCtrl.clear();
  }
}
