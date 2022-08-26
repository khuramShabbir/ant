import 'package:demo/commons/app_text_styles.dart';
import 'package:demo/commons/widgets.dart';
import 'package:flutter/material.dart';

class GoogleButton extends StatelessWidget {
  final VoidCallback onTap;
  const GoogleButton({required this.onTap, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width * .9,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(.3),
                blurRadius: 10,
                spreadRadius: 1,
              ),
            ]),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/png/google.png"),
              AppWidgets.spacer(horizontalSpace: 20),
              Text(
                "sign in with Google",
                style: AppTextStyles.buttonTextStyles,
              )
            ],
          ),
        ),
      ),
    );
  }
}
