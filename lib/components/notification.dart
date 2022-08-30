import 'package:demo/commons/app_text_styles.dart';
import 'package:demo/commons/constant.dart';
import 'package:demo/commons/widgets.dart';
import 'package:flutter/material.dart';

class NotificationWidget extends StatelessWidget {
  final bool isStatus;
  final String title;
  final String subTitle;
  final String detail;
  final String? price;

  final String? priceDec;

  const NotificationWidget({
    this.isStatus = false,
    required this.title,
    required this.subTitle,
    this.price,
    this.priceDec,
    required this.detail,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Container(
        decoration: AppConst.boxDecoration20Radius,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(title, style: AppTextStyles.subTitleStyle),
                  const Expanded(child: SizedBox()),
                  if (isStatus)
                    const Text("DISCONNECTED",
                        style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
                  AppWidgets.spacer(horizontalSpace: 5),
                  if (isStatus) const CircleAvatar(radius: 5, backgroundColor: Colors.red)
                ],
              ),
              AppWidgets.spacer(verticalSpace: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(subTitle, style: AppTextStyles.font15Bold),
                  if (!isStatus)
                    Column(
                      children: [
                        Text(price ?? "", style: AppTextStyles.font15),
                        Text(priceDec ?? "", style: AppTextStyles.font15)
                      ],
                    )
                ],
              ),
              AppWidgets.spacer(verticalSpace: 20),
              Row(
                children: [
                  Text(
                    detail,
                    style: AppTextStyles.regularStyle,
                  ),
                  if (isStatus)
                    const Text(
                      " reconnect",
                      style:
                          TextStyle(color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 12),
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
