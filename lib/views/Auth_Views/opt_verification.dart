import 'package:demo/commons/app_assets.dart';
import 'package:demo/commons/app_text_styles.dart';
import 'package:demo/commons/constant.dart';
import 'package:demo/commons/widgets.dart';
import 'package:demo/components/app_extended_button.dart';
import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';

class OtpVerification extends StatelessWidget {
  OtpVerification({Key? key}) : super(key: key);

  final String phNumber = "+5551931094648";

  final TextEditingController otpPinCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: Padding(
        padding: const EdgeInsets.only(bottom: 50),
        child: Row(
          children: [
            const Expanded(child: SizedBox()),
            SizedBox(
              width: 180,
              child: AppExtendedButtonFilled(
                title: 'Verify',
                onTap: () {},
              ),
            ),
            const Expanded(child: SizedBox()),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            AppWidgets.spacer(verticalSpace: 30),
            phoneVerification,
            AppWidgets.spacer(verticalSpace: 30),
            Image.asset(AppAssets.otpVerification),
            AppWidgets.spacer(verticalSpace: 50),
            verifyPhoneNumber,
            AppWidgets.spacer(verticalSpace: 10),
            SizedBox(
              child: RichText(
                text: TextSpan(
                  style: const TextStyle(
                    fontSize: 14.0,
                    color: Colors.black,
                  ),
                  children: <TextSpan>[
                    const TextSpan(
                        text: 'Waiting to automatically detect an SMS sent to this phone number '),
                    TextSpan(text: phNumber, style: const TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            ),
            AppWidgets.spacer(verticalSpace: 60),
            OTPTextField(
              length: 6,
              width: MediaQuery.of(context).size.width,
              fieldWidth: 20,
              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              textFieldAlignment: MainAxisAlignment.spaceAround,
              fieldStyle: FieldStyle.underline,
              onCompleted: (pin) {
                logger.i("Completed: $pin");
              },
              onChanged: (v) {},
            ),
          ],
        ),
      ),
    );
  }

  final Widget phoneVerification = Row(
    children: [
      AppWidgets.blueBar(),
      Text(
        "Phone Verification",
        style: AppTextStyles.subTitleStyle,
      )
    ],
  );

  final Widget verifyPhoneNumber = Row(
    children: [
      AppWidgets.blueBar(),
      Text(
        "Verify Your Phone No.",
        style: AppTextStyles.subTitleStyle,
      )
    ],
  );
}
