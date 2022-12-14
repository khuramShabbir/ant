import 'dart:async';

import 'package:demo/commons/constant.dart';
import 'package:demo/components/app_extended_button.dart';
import 'package:demo/components/loading_widget.dart';
import 'package:demo/controllers/google_map_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:place_picker/entities/location_result.dart';
import 'package:place_picker/place_picker.dart';
import 'package:provider/provider.dart';

class GoogleMapView extends StatefulWidget {
  const GoogleMapView({Key? key}) : super(key: key);

  @override
  State<GoogleMapView> createState() => GoogleMapViewState();
}

class GoogleMapViewState extends State<GoogleMapView> {
  final Completer<GoogleMapController> _controller = Completer();

  final CameraPosition _kGooglePlex = const CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  final String googleApikey = "AIzaSyBjkb5F8ZFs_xRjyUSAq-yj3cuR0eeZYNE";
  late GoogleMapController? mapController;
  String location = "Search Location";
  @override
  void initState() {
    Provider.of<GoogleMapProvider>(context, listen: false).determinePosition();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<GoogleMapProvider>(
        builder: (BuildContext context, mapProv, Widget? child) {
          return mapProv.isCurrentPositionLoaded
              ? Stack(
                  children: [
                    GoogleMap(
                      mapType: MapType.normal,
                      initialCameraPosition: mapProv.initCameraPosition ?? _kGooglePlex,
                      onMapCreated: (GoogleMapController controller) {
                        _controller.complete(controller);
                        mapController = controller;
                        setState(() {});
                      },
                      onTap: (latLng) async {},
                    ),
                    Positioned(
                        //search input bar
                        top: 10,
                        child: InkWell(
                            onTap: () async {
                              // var place = await PlacesAutocomplete.show(
                              //     context: context,
                              //     apiKey: googleApikey,
                              //     mode: Mode.overlay,
                              //     types: [],
                              //     strictbounds: false,
                              //     components: [
                              //       Component(Component.country, 'pk'),
                              //     ],
                              //     // google_map_webservice package
                              //     onError: (err) {});
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(15),
                              child: Card(
                                child: Container(
                                    padding: const EdgeInsets.all(0),
                                    width: MediaQuery.of(context).size.width - 40,
                                    child: ListTile(
                                      title: Text(
                                        location,
                                        style: const TextStyle(fontSize: 18),
                                      ),
                                      trailing: const Icon(Icons.search),
                                      dense: true,
                                    )),
                              ),
                            ))),
                    Positioned(
                        bottom: 10,
                        left: 10,
                        child: SizedBox(
                          height: 50,
                          width: 150,
                          child: AppExtendedButtonFilled(
                            onTap: () {
                              Navigator.pop(context, mapProv.locationName);
                            },
                            title: "Add Location",
                          ),
                        ))
                  ],
                )
              : const AppLoadingWidget();
        },
      ),
    );
  }
}
