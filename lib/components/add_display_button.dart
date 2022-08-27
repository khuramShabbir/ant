import 'package:demo/commons/app_assets.dart';
import 'package:demo/commons/app_text_styles.dart';
import 'package:demo/commons/widgets.dart';
import 'package:flutter/material.dart';

class AddDisplayButton extends StatelessWidget {
  final VoidCallback onTap;
  const AddDisplayButton({required this.onTap, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(
              width: 2,
              color: Colors.grey.withOpacity(.5),
            ),
            borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 30),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(AppAssets.addDisplay),
              AppWidgets.spacer(verticalSpace: 10),
              Text("Add Display", style: AppTextStyles.font15)
            ],
          ),
        ),
      ),
    );
  }
}
