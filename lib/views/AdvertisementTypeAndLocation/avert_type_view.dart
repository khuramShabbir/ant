import 'package:demo/commons/app_assets.dart';
import 'package:demo/commons/app_text_styles.dart';
import 'package:demo/commons/widgets.dart';
import 'package:demo/components/app_extended_button.dart';
import 'package:demo/components/app_extended_button_rounded.dart';
import 'package:demo/views/AdvertisementTypeAndLocation/location_type_view.dart';
import 'package:flutter/material.dart';

class AdvertisementTypeView extends StatefulWidget {
  const AdvertisementTypeView({Key? key}) : super(key: key);

  @override
  State<AdvertisementTypeView> createState() => _AdvertisementTypeViewState();
}

class _AdvertisementTypeViewState extends State<AdvertisementTypeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(AppAssets.mainBG), fit: BoxFit.fill)),
            ),
          ),
          SizedBox(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  AppWidgets.spacer(verticalSpace: 20),
                  Row(
                    children: [
                      AppWidgets.blueBar(),
                      Text(
                        "What Would like to do?",
                        style: AppTextStyles.subTitleStyle,
                      )
                    ],
                  ),
                  AppWidgets.spacer(verticalSpace: 20),
                  AppExtendedButtonFilled(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (BuildContext context) {
                        return const LocationTypeView();
                      }));
                    },
                    title: "Sell advertisement",
                  ),
                  AppWidgets.spacer(verticalSpace: 10),
                  AppExtendedButtonRounded(
                    onTap: () {},
                    title: "Advertise my Business",
                  ),
                  AppWidgets.spacer(verticalSpace: 20),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
