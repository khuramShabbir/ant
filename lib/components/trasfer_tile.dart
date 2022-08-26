import 'package:demo/commons/app_assets.dart';
import 'package:demo/commons/app_colors.dart';
import 'package:demo/commons/app_text_styles.dart';
import 'package:demo/commons/constant.dart';
import 'package:demo/commons/widgets.dart';
import 'package:flutter/material.dart';

class TransferTile extends StatelessWidget {
  final bool debit;
  final VoidCallback onTap;
  const TransferTile({required this.debit, required this.onTap, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: AppConst.boxDecoration20Radius,
          width: AppConst.screenWidth(context),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              upWard(debit),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("KOTAK MAHINDRA", style: AppTextStyles.font15Bold),
                  AppWidgets.spacer(verticalSpace: 10),
                  Text("13 May", style: AppTextStyles.font15),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text("\$ 100", style: AppTextStyles.font15Bold),
                  AppWidgets.spacer(verticalSpace: 10),
                  Text("Transfer Complete", style: AppTextStyles.font15),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget upWard(bool debit) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      child: CircleAvatar(
        radius: 25,
        backgroundColor: debit ? AppColors.primary : AppColors.green,
        child: Image.asset(debit ? AppAssets.upWard : AppAssets.downWard),
      ),
    );
  }
}
