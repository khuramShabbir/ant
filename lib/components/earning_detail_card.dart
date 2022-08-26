import 'package:demo/commons/app_colors.dart';
import 'package:demo/commons/app_text_styles.dart';
import 'package:demo/commons/widgets.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

class EarningDetailCard extends StatefulWidget {
  const EarningDetailCard({Key? key}) : super(key: key);

  @override
  State<EarningDetailCard> createState() => _EarningDetailCardState();
}

class _EarningDetailCardState extends State<EarningDetailCard> {
  bool expand = false;
  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      onExpansionChanged: (bool value) {
        expand = !expand;
        setState(() {});
      },
      title: Text("All Displays", style: AppTextStyles.subTitleStyle),
      subtitle: Text("Several Locations", style: AppTextStyles.font15),
      trailing: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "CONNECTED",
                style: TextStyle(
                    color: AppColors.green, fontWeight: FontWeight.bold),
              ),
              AppWidgets.spacer(horizontalSpace: 5),
              dot()
            ],
          ),
          RotatedBox(
            quarterTurns: !expand ? 2 : 0,
            child: Icon(
              Icons.keyboard_arrow_down_outlined,
              color: !expand ? Colors.black : AppColors.green,
            ),
          )
        ],
      ),
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "\$ 475",
              style: AppTextStyles.subTitleStyle,
            ),
            Text(
              "Earning",
              style: AppTextStyles.font15,
            ),
            SizedBox(
              height: 250,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text("\$75K", style: AppTextStyles.font15WithGrey),
                      Text("\$50K", style: AppTextStyles.font15WithGrey),
                      Text("\$25K", style: AppTextStyles.font15WithGrey),
                      Text("\$0K", style: AppTextStyles.font15WithGrey),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: SizedBox(
                      height: 210,
                      width: 300,
                      // height: 200,
                      child: Column(
                        children: [
                          SfSparkAreaChart(
                            data: const <double>[10, 6, 8, 11, 5, -2],
                            borderColor: AppColors.primary,
                            borderWidth: 3,
                            color: Colors.blue.withOpacity(.5),
                            trackball: SparkChartTrackball(
                                width: 20,
                                borderRadius: BorderRadius.circular(100),
                                color: Colors.black),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Jan", style: AppTextStyles.subTitleStyle),
                              Text("Feb", style: AppTextStyles.subTitleStyle),
                              Text("Mar", style: AppTextStyles.subTitleStyle),
                              Text("Apr", style: AppTextStyles.subTitleStyle),
                              Text("May", style: AppTextStyles.subTitleStyle),
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text(
                      "01",
                      style: AppTextStyles.subTitleStyle,
                    ),
                    Text(
                      "Online",
                      style: AppTextStyles.font15WithGrey,
                    )
                  ],
                ),
                Column(
                  children: [
                    Text(
                      "01",
                      style: AppTextStyles.subTitleStyle,
                    ),
                    Text(
                      "Display Monetized",
                      style: AppTextStyles.font15WithGrey,
                    )
                  ],
                ),
                Column(
                  children: [
                    Text(
                      "01",
                      style: AppTextStyles.subTitleStyle,
                    ),
                    Text(
                      "Offline",
                      style: AppTextStyles.font15WithGrey,
                    )
                  ],
                ),
              ],
            )
          ],
        )
      ],
    );
  }

  Widget dot() {
    return Container(
      height: 12,
      width: 12,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100), color: AppColors.green),
    );
  }
}
