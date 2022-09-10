import 'package:demo/commons/app_colors.dart';
import 'package:demo/commons/app_text_styles.dart';
import 'package:demo/commons/constant.dart';
import 'package:demo/components/app_extended_button.dart';
import 'package:demo/components/app_form_field.dart';
import 'package:demo/components/single_selection_chip.dart';
import 'package:demo/controllers/AddDisplayProvider/strategy_prov.dart';
import 'package:demo/controllers/AddDisplayProvider/strategy_prov.dart';
import 'package:demo/controllers/google_map_provider.dart';
import 'package:flutter/material.dart';
import 'package:place_picker/entities/entities.dart';
import 'package:place_picker/place_picker.dart';
import 'package:provider/provider.dart';

class LocationAndStrategy extends StatefulWidget {
  LocationAndStrategy({Key? key}) : super(key: key);

  @override
  State<LocationAndStrategy> createState() => _LocationAndStrategyState();
}

class _LocationAndStrategyState extends State<LocationAndStrategy> {
  final String googleApikey = "AIzaSyBjkb5F8ZFs_xRjyUSAq-yj3cuR0eeZYNE";
  late StrategyProvider stProvider;

  final formKey = GlobalKey<FormState>();
  @override
  void initState() {
    stProvider = Provider.of<StrategyProvider>(context, listen: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<StrategyProvider>(
      builder: (BuildContext context, value, Widget? child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Add Display"),
            leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back, color: AppColors.primary)),
          ),
          bottomSheet: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: AppExtendedButtonFilled(
              onTap: () async {
                if (formKey.currentState!.validate()) {
                  bool result = value.formValidator(context);
                  if (result) {
                    value.submitStrategy(
                      lat: stProvider.latLng!.latitude.toString(),
                      lng: stProvider.latLng!.longitude.toString(),
                      address: stProvider.displayLocationCtrl.text,
                    );
                  }
                }
              },
              title: "Add",
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    titleText("Display Location"),
                    AppFormField(
                      onTap: () async {
                        // value.displayLocationCtrl.text = await Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (BuildContext co) {
                        //       return const GoogleMapView();
                        //     },
                        //   ),
                        // );
                        LocationResult result = await Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => PlacePicker(googleApikey),
                          ),
                        );
                        if (result.latLng != null) {
                          stProvider.latLng = result.latLng;
                          value.displayLocationCtrl.text = result.formattedAddress;
                          setState(() {});
                        }
                      },
                      validator: (v) {
                        if (v!.isEmpty) return "field required";
                        return null;
                      },
                      enabled: true,
                      hintLabel: "Add Display Location",
                      outlinedBorderd: true,
                      textEditingController: value.displayLocationCtrl,
                    ),
                    titleText("Add Strategy"),
                    SingleSelectionChip(
                        valueChanged: (v) {
                          value.strategy = v;
                        },
                        chipsDataList: const ["Low Pricing", "Average", "High Cost"]),
                    AppFormField(
                      validator: (v) {
                        if (v!.isEmpty) return "field required";
                        return null;
                      },
                      outlinedBorderd: true,
                      textEditingController: value.strategyCtrl,
                      hintLabel: " Rate per minutes",
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget titleText(String title) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Text(title, style: AppTextStyles.font15BoldPrimary),
    );
  }
}
