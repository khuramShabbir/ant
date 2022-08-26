import 'package:demo/commons/app_assets.dart';
import 'package:demo/commons/app_text_styles.dart';
import 'package:demo/commons/constant.dart';
import 'package:demo/commons/widgets.dart';
import 'package:flutter/material.dart';

class TransactionDetailView extends StatelessWidget {
  TransactionDetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const Icon(Icons.arrow_back, color: Colors.black),
        actions: [Image.asset(AppAssets.notifications)],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppWidgets.spacer(verticalSpace: 20),
            transaction,
            AppWidgets.spacer(verticalSpace: 20),
            Container(
              width: AppConst.screenWidth(context),
              decoration: AppConst.boxDecoration20Radius,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    Text("KOTAK MAHINDRA", style: AppTextStyles.subTitleStyle),
                    AppWidgets.spacer(verticalSpace: 10),
                    Text("Sent Money", style: AppTextStyles.font15Bold),
                    AppWidgets.spacer(verticalSpace: 25),
                    Text("\$ 100", style: AppTextStyles.subTitleStyle),
                    AppWidgets.spacer(verticalSpace: 10),
                    Text("KOTAK MAHINDRA BANK LIMITED",
                        style: AppTextStyles.regularStyle),
                  ],
                ),
              ),
            ),
            AppWidgets.spacer(verticalSpace: 20),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Text(
                "Transaction Details",
                style: AppTextStyles.font15Bold,
              ),
            ),
            AppWidgets.spacer(verticalSpace: 20),
            Column(
              children: List.generate(
                  listFoo.length,
                  (index) => Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              listFoo[index],
                              style: AppTextStyles.font15WithGrey,
                            ),
                            Text(fooList[index], style: AppTextStyles.font15),
                          ],
                        ),
                      )),
            ),
            AppWidgets.spacer(verticalSpace: 50),
            Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Transaction Id", style: AppTextStyles.font15WithGrey),
                  AppWidgets.spacer(verticalSpace: 10),
                  Text("4TUSEYAKSAKMX7593", style: AppTextStyles.font15Bold),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  final Widget transaction = Row(
    children: [
      AppWidgets.blueBar(),
      Text(
        "Transaction",
        style: AppTextStyles.subTitleStyle,
      )
    ],
  );

  final List listFoo = [
    "Date",
    "From",
    "Destination",
    "Amount",
    "Fee",
  ];
  final List fooList = [
    "13 May 2021 - 08.21",
    "Ant Balance",
    "Kotak Mahindra",
    "\$100",
    "0",
  ];
}
