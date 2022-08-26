import 'package:demo/commons/app_text_styles.dart';
import 'package:demo/commons/constant.dart';
import 'package:demo/commons/local_storage.dart';
import 'package:demo/commons/widgets.dart';
import 'package:demo/components/app_extended_button.dart';
import 'package:demo/controllers/auth_provider/user_credential.dart';
import 'package:demo/models/auth_model/auth.dart';
import 'package:demo/views/Auth_Views/sign_in_with_google_view.dart';
import 'package:demo/views/profileSettingsView/eidt_profile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileSettingsView extends StatelessWidget {
  ProfileSettingsView({Key? key}) : super(key: key);
  final User user = LocalStorage.getUserCredential();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            AppWidgets.spacer(verticalSpace: 10),
            profile,
            AppWidgets.spacer(verticalSpace: 20),
            Container(
                decoration: AppConst.boxDecoration20Radius,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            radius: 50,
                            backgroundImage:
                                user.profileUrl != null ? NetworkImage(user.profileUrl!) : null,
                          ),
                          AppWidgets.spacer(horizontalSpace: 20),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(user.userName, style: AppTextStyles.subTitleStyle),
                              Text(user.email, style: AppTextStyles.font15),
                            ],
                          )
                        ],
                      ),
                      AppWidgets.spacer(verticalSpace: 20),

                      /// Email
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.alternate_email,
                            color: Colors.grey.withOpacity(.7),
                          ),
                          AppWidgets.spacer(horizontalSpace: 10),
                          Text(user.email, style: AppTextStyles.subTitleStyle),
                        ],
                      ),
                      AppWidgets.spacer(verticalSpace: 5),

                      ///Phone Number
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.call,
                            color: Colors.grey.withOpacity(.7),
                          ),
                          AppWidgets.spacer(horizontalSpace: 10),
                          Text(user.contactNumber ?? "", style: AppTextStyles.subTitleStyle),
                        ],
                      ),
                      AppWidgets.spacer(verticalSpace: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 50),
                        child: Row(
                          children: [
                            TextButton(
                                onPressed: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (BuildContext context) {
                                    return EditProfileView();
                                  }));
                                },
                                child: Text(
                                  "Edit",
                                  style: AppTextStyles.subTitleStyle
                                      .copyWith(fontWeight: FontWeight.w400),
                                )),
                            const Expanded(child: SizedBox()),
                            Container(
                              height: 35,
                              width: 2,
                              decoration: BoxDecoration(
                                  color: Colors.black, borderRadius: BorderRadius.circular(100)),
                            ),
                            const Expanded(child: SizedBox()),
                            TextButton(
                                onPressed: () async {
                                  bool status = await Provider.of<UserCredentialProvider>(context,
                                          listen: false)
                                      .logOut();

                                  if (status) {
                                    Navigator.pushAndRemoveUntil(context,
                                        MaterialPageRoute(builder: (BuildContext context) {
                                      return SignInWithGoogleView();
                                    }), (route) => false);
                                  }
                                },
                                child: Text(
                                  "Logout",
                                  style: AppTextStyles.subTitleStyle
                                      .copyWith(fontWeight: FontWeight.w400),
                                )),
                          ],
                        ),
                      )
                    ],
                  ),
                )),
            AppWidgets.spacer(verticalSpace: 20),
            aboutYou,
            AppWidgets.spacer(verticalSpace: 20),
            Container(
              decoration: AppConst.boxDecoration20Radius,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(),
                    Text(
                      "Position",
                      style: AppTextStyles.font15Bold.copyWith(fontWeight: FontWeight.w400),
                    ),
                    AppWidgets.spacer(verticalSpace: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Business owner",
                            style: AppTextStyles.font15Bold.copyWith(fontWeight: FontWeight.w400),
                          ),
                          Container(
                            width: AppConst.screenWidth(context),
                            height: 1,
                            color: Colors.grey.withOpacity(.7),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            AppWidgets.spacer(verticalSpace: 20),
            payment,
            AppWidgets.spacer(verticalSpace: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: AppExtendedButtonFilled(
                onTap: () {},
                title: "Connect With Stripe",
                leading: Row(
                  children: [
                    const Text(
                      "S",
                      style:
                          TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    AppWidgets.spacer(horizontalSpace: 20)
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  final Widget aboutYou = Row(
    children: [
      AppWidgets.blueBar(),
      Text(
        "About You",
        style: AppTextStyles.subTitleStyle,
      )
    ],
  );
  final Widget profile = Row(
    children: [
      AppWidgets.blueBar(),
      Text(
        "Profile",
        style: AppTextStyles.subTitleStyle,
      )
    ],
  );
  final Widget payment = Row(
    children: [
      AppWidgets.blueBar(),
      Text(
        "Payment",
        style: AppTextStyles.subTitleStyle,
      )
    ],
  );
}
