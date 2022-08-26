import 'package:demo/commons/app_text_styles.dart';
import 'package:demo/commons/constant.dart';
import 'package:demo/commons/widgets.dart';
import 'package:demo/components/choice_button.dart';
import 'package:demo/components/multi_selection_chip.dart';
import 'package:flutter/material.dart';

class PaymentsView extends StatefulWidget {
  const PaymentsView({Key? key}) : super(key: key);

  @override
  State<PaymentsView> createState() => _PaymentsViewState();
}

class _PaymentsViewState extends State<PaymentsView> {
  bool filterSwitch = false;
  bool rejectSwitch = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              AppWidgets.spacer(verticalSpace: 10),
              filter,
              AppWidgets.spacer(verticalSpace: 10),

              /// filters
              Container(
                decoration: AppConst.boxDecoration20Radius,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: AppConst.screenWidth(context) * .7,
                            child: Text(
                              "Accept adverts from the same business category as yours?",
                              style: AppTextStyles.regularStyle,
                              overflow: TextOverflow.clip,
                            ),
                          ),
                          Switch(
                            onChanged: (v) {
                              setState(() {
                                filterSwitch = !filterSwitch;
                              });
                            },
                            value: filterSwitch,
                            activeColor: Colors.green,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              AppWidgets.spacer(verticalSpace: 10),

              /// Auto Reject Offers from
              Container(
                decoration: AppConst.boxDecoration20Radius,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: AppConst.screenWidth(context) * .7,
                            child: Text(
                              "Auto Reject Offers from",
                              style: AppTextStyles.regularStyle,
                              overflow: TextOverflow.clip,
                            ),
                          ),
                          Switch(
                            onChanged: (v) {
                              setState(() {
                                rejectSwitch = !rejectSwitch;
                              });
                            },
                            value: filterSwitch,
                            activeColor: Colors.green,
                          )
                        ],
                      ),
                      AppWidgets.spacer(verticalSpace: 20),
                      MultiSelectChip(
                        chipsDataList: const ["Alcohol", "Tobacco"],
                        onSelectionChanged: (value) {},
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: TextButton(
                          onPressed: () async {
                            await showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return Container(
                                  height: 500,
                                  color: Colors.red,
                                );
                              },
                              barrierDismissible: false,
                            );
                          },
                          child: const Text(
                            "View all",
                            style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              AppWidgets.spacer(verticalSpace: 10),

              acceptance,
              AppWidgets.spacer(verticalSpace: 10),
              ChoiceButton(
                  valueChanged: (String value) {},
                  button1Text: "Automatic",
                  button2Text: "Manual"),
              AppWidgets.spacer(verticalSpace: 10),

              /// item Description
              AppWidgets.spacer(verticalSpace: 10),
              Container(
                decoration: AppConst.boxDecoration20Radius,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Sweet wines", style: AppTextStyles.font15),
                          Text("\$100", style: AppTextStyles.subTitleStyle),
                        ],
                      ),
                      AppWidgets.spacer(verticalSpace: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Alcohol", style: AppTextStyles.regularStyle),
                          Text("Total Daily",
                              style: AppTextStyles.regularStyle),
                        ],
                      ),
                      AppWidgets.spacer(verticalSpace: 5),
                      Container(
                        height: AppConst.screenHeight(context) * .25,
                        decoration: BoxDecoration(
                            border:
                                Border.all(color: Colors.grey.withOpacity(.5))),
                        child: Center(
                          child: Text(
                            "Advert preview loading...",
                            style: AppTextStyles.font15WithGrey,
                          ),
                        ),
                      ),
                      AppWidgets.spacer(verticalSpace: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                              onPressed: () {},
                              child: const Text(
                                "REJECT",
                                style: TextStyle(
                                    color: Colors.red,
                                    fontWeight: FontWeight.w400),
                              )),
                          TextButton(
                              onPressed: () {},
                              child: const Text(
                                "ACCEPT",
                                style: TextStyle(
                                    color: Colors.green,
                                    fontWeight: FontWeight.w400),
                              )),
                        ],
                      )
                    ],
                  ),
                ),
              ),

              /// item Description
              AppWidgets.spacer(verticalSpace: 10),
              Container(
                decoration: AppConst.boxDecoration20Radius,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Sweet wines", style: AppTextStyles.font15),
                          Text("\$100", style: AppTextStyles.subTitleStyle),
                        ],
                      ),
                      AppWidgets.spacer(verticalSpace: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Alcohol", style: AppTextStyles.regularStyle),
                          Text("Total Daily",
                              style: AppTextStyles.regularStyle),
                        ],
                      ),
                      AppWidgets.spacer(verticalSpace: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                              onPressed: () {},
                              child: const Text(
                                "REJECT",
                                style: TextStyle(
                                    color: Colors.red,
                                    fontWeight: FontWeight.w400),
                              )),
                          TextButton(
                              onPressed: () {},
                              child: const Text(
                                "ACCEPT",
                                style: TextStyle(
                                    color: Colors.green,
                                    fontWeight: FontWeight.w400),
                              )),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              AppWidgets.spacer(verticalSpace: 200),
            ],
          ),
        ),
      ),
    );
  }

  final Widget filter = Row(
    children: [
      AppWidgets.blueBar(),
      Text(
        "Filter",
        style: AppTextStyles.subTitleStyle,
      )
    ],
  );
  final Widget acceptance = Row(
    children: [
      AppWidgets.blueBar(),
      Text(
        "Acceptance",
        style: AppTextStyles.subTitleStyle,
      )
    ],
  );
  final Widget chooseFilter = Row(
    children: [
      AppWidgets.blueBar(),
      Text(
        "Advert offer categories to always reject",
        style: AppTextStyles.subTitleStyle,
      )
    ],
  );
}
