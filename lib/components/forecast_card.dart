import 'package:demo/commons/app_colors.dart';
import 'package:demo/commons/app_text_styles.dart';
import 'package:demo/commons/constant.dart';
import 'package:demo/commons/widgets.dart';
import 'package:demo/components/app_extended_button.dart';
import 'package:flutter/material.dart';

class ForeCastCard extends StatelessWidget {
  const ForeCastCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppConst.boxDecoration20Radius,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Yearly Forecast",
                  style: AppTextStyles.font15,
                ),
                AppWidgets.spacer(verticalSpace: 10),
                Text(
                  "\$12,0000",
                  style: AppTextStyles.subTitleStyle,
                ),
                AppWidgets.spacer(verticalSpace: 10),
                AppExtendedButtonFilled(
                    onTap: () {},
                    leading: const Padding(
                      padding: EdgeInsets.only(right: 8.0),
                      child: Icon(
                        Icons.trending_up_rounded,
                        color: Colors.white,
                      ),
                    ),
                    title: "+4.5%"),
              ],
            ),
            Image.asset("assets/png/graph.png"),
            FloatingActionButton(
              backgroundColor: AppColors.primary,
              elevation: 0,
              onPressed: () {},
              child: Text(
                "\$",
                style: AppTextStyles.subTitleStyle,
              ),
            )
          ],
        ),
      ),
    );
  }
}
