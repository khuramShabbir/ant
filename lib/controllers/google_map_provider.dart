import 'package:demo/commons/widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

class GoogleMapProvider extends ChangeNotifier {
  CameraPosition? initCameraPosition;
  Position? position;
  bool isCurrentPositionLoaded = false;
  bool? serviceEnabled;
  String locationName = "";
  LatLng? latLng;

  Future<bool> determinePosition() async {
    isCurrentPositionLoaded = false;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled!) {
      AppWidgets.unsuccessfullySnackBar(msg: 'Location services are disabled.');
      return false;
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        AppWidgets.unsuccessfullySnackBar(msg: 'Location permissions are denied');

        return false;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      AppWidgets.unsuccessfullySnackBar(
          msg: 'Location permissions are permanently denied, we cannot request permissions.');
      return false;
    }

    position = await Geolocator.getCurrentPosition();
    if (position != null) {
      initCameraPosition = CameraPosition(
        target: LatLng(position!.latitude, position!.longitude),
        zoom: 14.4746,
      );
    }
    isCurrentPositionLoaded = true;
    notifyListeners();
    return true;
  }
}
