import 'package:demo/commons/app_text_styles.dart';
import 'package:demo/commons/constant.dart';
import 'package:demo/commons/widgets.dart';
import 'package:demo/components/forecast_card.dart';
import 'package:demo/components/trasfer_tile.dart';
import 'package:demo/views/DashBoardView/TransactionDetailView/transaction_detail_view.dart';
import 'package:flutter/material.dart';

class TransferHistory extends StatelessWidget {
  TransferHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      // appBar: AppBar(
      //   elevation: 0,
      //   backgroundColor: Colors.transparent,
      //   leading: const CircleAvatar(),
      //   actions: [Image.asset("assets/png/notifications.png")],
      //   title: Text(
      //     "Hi Sul",
      //     style: AppTextStyles.appBarStyle,
      //   ),
      // ),
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
                balance,
                AppWidgets.spacer(verticalSpace: 10),
                Container(
                  decoration: AppConst.boxDecoration20Radius,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    recentActivity,
                    TextButton(
                      onPressed: () {},
                      child:
                          Text("View All", style: AppTextStyles.regularStyle),
                    )
                  ],
                ),
                AppWidgets.spacer(verticalSpace: 10),
                TransferTile(
                  debit: true,
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (BuildContext context) {
                      return TransactionDetailView();
                    }));
                  },
                ),
                TransferTile(
                  debit: false,
                  onTap: () {},
                ),
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
  final Widget balance = Row(
    children: [
      AppWidgets.blueBar(),
      Text(
        "Balance",
        style: AppTextStyles.subTitleStyle,
      )
    ],
  );
  final Widget recentActivity = Row(
    children: [
      AppWidgets.blueBar(),
      Text(
        "Recent Activity",
        style: AppTextStyles.subTitleStyle,
      )
    ],
  );
}
