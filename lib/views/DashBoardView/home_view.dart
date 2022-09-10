import 'package:demo/commons/app_text_styles.dart';
import 'package:demo/commons/constant.dart';
import 'package:demo/commons/widgets.dart';
import 'package:demo/components/add_display_button.dart';
import 'package:demo/components/app_extended_button.dart';
import 'package:demo/components/app_extended_button_rounded.dart';
import 'package:demo/components/choice_button.dart';
import 'package:demo/components/earning_detail_card.dart';
import 'package:demo/components/forecast_card.dart';
import 'package:demo/views/AddDisplay/display_location_and_strategy.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          width: AppConst.screenWidth(context),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppWidgets.spacer(verticalSpace: 10),
                foreCast,
                AppWidgets.spacer(verticalSpace: 10),
                const ForeCastCard(),
                AppWidgets.spacer(verticalSpace: 20),
                availability,
                AppWidgets.spacer(verticalSpace: 10),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  decoration: AppConst.boxDecoration10Radius,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Text(
                          "January",
                          style: AppTextStyles.font15Bold,
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  decoration: AppConst.boxDecoration10Radius,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Text(
                          "FEB",
                          style: AppTextStyles.font15Bold,
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  decoration: AppConst.boxDecoration10Radius,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Text(
                          "MAR",
                          style: AppTextStyles.font15Bold,
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  decoration: AppConst.boxDecoration10Radius,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Text(
                          "APR",
                          style: AppTextStyles.font15Bold,
                        )
                      ],
                    ),
                  ),
                ),
                AppWidgets.spacer(verticalSpace: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppExtendedButtonRounded(onTap: () {}, title: "2012", padding: 15),
                    AppExtendedButtonRounded(onTap: () {}, title: "2012", padding: 15),
                    AppExtendedButtonRounded(onTap: () {}, title: "2012", padding: 15),
                    AppExtendedButtonFilled(onTap: () {}, title: "2012", padding: 15),
                  ],
                ),
                AppWidgets.spacer(verticalSpace: 20),
                display,
                AppWidgets.spacer(verticalSpace: 10),
                Text(
                  "Stuart St Mac's Brew Bar",
                  style: AppTextStyles.font15Bold,
                ),
                AppWidgets.spacer(verticalSpace: 10),
                AddDisplayButton(onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
                    return LocationAndStrategy();

                    // AddDisplay();
                  }));
                }),
                TextButton(
                  onPressed: () {},
                  child: Text("Add a New Location", style: AppTextStyles.font15BoldPrimary),
                ),
                AppWidgets.spacer(verticalSpace: 20),
                ChoiceButton(
                  button1Text: "Combine",
                  button2Text: "Individual",
                  valueChanged: (String value) {},
                ),
                AppWidgets.spacer(verticalSpace: 20),
                const EarningDetailCard(),
                AppWidgets.spacer(verticalSpace: 200)
              ],
            ),
          ),
        ),
      ),
    );
  }

  final Widget foreCast = Row(
    children: [
      AppWidgets.blueBar(),
      Text(
        "ForeCast",
        style: AppTextStyles.subTitleStyle,
      )
    ],
  );
  final Widget availability = Row(
    children: [
      AppWidgets.blueBar(),
      Text(
        "Availability",
        style: AppTextStyles.subTitleStyle,
      )
    ],
  );
  final Widget display = Row(
    children: [
      AppWidgets.blueBar(),
      Text(
        "Display",
        style: AppTextStyles.subTitleStyle,
      )
    ],
  );
}
