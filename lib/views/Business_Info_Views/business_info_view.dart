import 'package:demo/commons/app_text_styles.dart';
import 'package:demo/commons/constant.dart';
import 'package:demo/commons/widgets.dart';
import 'package:demo/components/app_extended_button.dart';
import 'package:demo/components/app_extended_button_rounded.dart';
import 'package:demo/components/app_form_field.dart';
import 'package:demo/controllers/business_info/business_info.dart';
import 'package:demo/views/GreetingView/greeting_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BusinessInfoView extends StatefulWidget {
  const BusinessInfoView({Key? key}) : super(key: key);

  @override
  State<BusinessInfoView> createState() => _BusinessInfoViewState();
}

class _BusinessInfoViewState extends State<BusinessInfoView> {
  late BusinessInfoProvider busInfoCtrl;

  @override
  void initState() {
    busInfoCtrl = Provider.of<BusinessInfoProvider>(context, listen: false);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: AppConst.screenHeight(context),
        width: AppConst.screenWidth(context),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              Expanded(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  AppWidgets.spacer(verticalSpace: 100),
                  Text(
                    "map",
                    style: AppTextStyles.font22WithBold,
                  ),
                  const Icon(
                    Icons.location_pin,
                    size: 40,
                  )
                ],
              )),
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        blueBar,
                        AppWidgets.spacer(horizontalSpace: 10),
                        Text(
                          "Business location",
                          style: AppTextStyles.subTitleStyle,
                        ),
                      ],
                    ),
                    AppFormField(
                        hintLabel: "Name",
                        textEditingController: busInfoCtrl.nameTextCtrl),
                    AppFormField(
                        hintLabel: "Category",
                        textEditingController: busInfoCtrl.categoryTextCtrl),
                    AppFormField(
                        hintLabel: "Address",
                        textEditingController: busInfoCtrl.addressTextCtrl),
                    AppFormField(
                        hintLabel: "LOCATION details",
                        textEditingController: busInfoCtrl.locationTextCtrl),
                    AppWidgets.spacer(verticalSpace: 20),
                    Row(
                      children: [
                        Expanded(
                            child: AppExtendedButtonRounded(
                          onTap: () {},
                          title: "Skip",
                        )),
                        AppWidgets.spacer(horizontalSpace: 30),
                        Expanded(
                            child: AppExtendedButtonFilled(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(
                                builder: (BuildContext context) {
                              return const GreetingView();
                            }));
                          },
                          title: "Next",
                        )),
                      ],
                    )
                  ],
                ),
              )),
            ],
          ),
        ),
      ),
    );
  }

  final Widget blueBar = Container(
    width: 5,
    height: 30,
    decoration: BoxDecoration(
        color: Colors.blue, borderRadius: BorderRadius.circular(100)),
  );
}
