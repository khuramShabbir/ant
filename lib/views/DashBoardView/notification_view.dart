import 'package:demo/commons/app_text_styles.dart';
import 'package:demo/commons/widgets.dart';
import 'package:demo/components/notification.dart';
import 'package:flutter/material.dart';

class NotificationView extends StatelessWidget {
  NotificationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: const Icon(
          Icons.arrow_back,
          color: Colors.black,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          children: [
            AppWidgets.spacer(verticalSpace: 10),
            notifications,
            AppWidgets.spacer(verticalSpace: 10),
            NotificationWidget(
              isStatus: true,
              title: "Samsung 65",
              subTitle: "Main 57 windows",
              detail: "This display is not connected with Wifi",
            ),
            NotificationWidget(
              isStatus: false,
              title: "Monetization Offer",
              subTitle: "Bar Stewards Restaurant",
              detail: "This offer has been rejected automatically",
              price: "\$100",
              priceDec: "Alcohol",
            ),
            NotificationWidget(
              isStatus: false,
              title: "Monetization Offer",
              subTitle: "Bar Stewards Restaurant",
              detail: "This offer has been automatically accepted",
              price: "\$100",
              priceDec: "Clothes",
            ),
          ],
        ),
      ),
    );
  }

  final Widget notifications = Row(
    children: [
      AppWidgets.blueBar(),
      Text(
        "Notifications",
        style: AppTextStyles.subTitleStyle,
      )
    ],
  );
}
