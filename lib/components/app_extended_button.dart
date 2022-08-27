import 'package:demo/commons/app_colors.dart';
import 'package:flutter/material.dart';

class AppExtendedButtonFilled extends StatelessWidget {
  final String title;
  final dynamic onTap;
  final Widget? leading;
  final Widget? trailing;
  final double padding;

  const AppExtendedButtonFilled(
      {required this.onTap,
      required this.title,
      this.leading,
      this.trailing,
      this.padding = 0.0,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        elevation: 0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        padding: const EdgeInsets.all(10),
        fixedSize: const Size.fromHeight(45),
        tapTargetSize: MaterialTapTargetSize.padded,
        animationDuration: const Duration(milliseconds: 500),
        primary: AppColors.primary,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (leading != null) leading!,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: padding),
            child: Text(title),
          ),
          if (trailing != null) trailing!,
        ],
      ),
    );
  }
}
