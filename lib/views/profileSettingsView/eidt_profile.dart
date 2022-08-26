import 'package:demo/commons/app_assets.dart';
import 'package:demo/commons/app_text_styles.dart';
import 'package:demo/commons/constant.dart';
import 'package:demo/commons/local_storage.dart';
import 'package:demo/commons/widgets.dart';
import 'package:demo/components/app_extended_button.dart';
import 'package:demo/components/app_form_field.dart';
import 'package:demo/controllers/auth_provider/edit_profile_provider.dart';
import 'package:demo/models/auth_model/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditProfileView extends StatefulWidget {
  const EditProfileView({Key? key}) : super(key: key);

  @override
  State<EditProfileView> createState() => _EditProfileViewState();
}

class _EditProfileViewState extends State<EditProfileView> {
  final User user = LocalStorage.getUserCredential();

  late TextEditingController nameCtrl;
  late TextEditingController emailCtrl;
  late TextEditingController phoneCtrl;
  @override
  void initState() {
    nameCtrl = TextEditingController(text: user.userName);
    emailCtrl = TextEditingController(text: user.email);
    phoneCtrl = TextEditingController(text: user.contactNumber);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<EditProfileProvider>(
      builder: (BuildContext context, value, Widget? child) {
        return Scaffold(
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: AppExtendedButtonFilled(
                onTap: () async {
                  bool status =
                      await Provider.of<EditProfileProvider>(context, listen: false).updateProfile(
                    name: nameCtrl.text,
                    email: emailCtrl.text,
                    contactNumber: phoneCtrl.text,
                    profileUrl: "profileUrl",
                  );

                  logger.i(status);
                  if (status) setState(() {});
                },
                title: "Submit"),
          ),
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: IconButton(
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppWidgets.spacer(verticalSpace: 10),
                  editProfile,
                  AppWidgets.spacer(verticalSpace: 10),

                  /// Profile Picture
                  Container(
                    decoration: AppConst.boxDecoration20Radius,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Update profile picture",
                            style: AppTextStyles.font15,
                          ),
                          AppWidgets.spacer(verticalSpace: 10),
                          Row(
                            children: [
                              CircleAvatar(
                                radius: 30,
                                backgroundImage:
                                    user.profileUrl != null ? NetworkImage(user.profileUrl!) : null,
                              ),
                              AppWidgets.spacer(horizontalSpace: 20),
                              Image.asset(AppAssets.gallery),
                              AppWidgets.spacer(horizontalSpace: 10),
                              Text(
                                "Upload Profile Picture",
                                style: AppTextStyles.font15,
                              ),
                            ],
                          ),
                          AppWidgets.spacer(verticalSpace: 10),
                          updateStatus(msg: "Profile picture updated successfully")
                        ],
                      ),
                    ),
                  ),
                  AppWidgets.spacer(verticalSpace: 10),

                  /// Name
                  Container(
                    decoration: AppConst.boxDecoration20Radius,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(),
                          Text(
                            "Name",
                            style: AppTextStyles.font15.copyWith(fontWeight: FontWeight.w400),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 30, right: 30, bottom: 10),
                            child: AppFormField(textEditingController: nameCtrl),
                          ),
                          updateStatus(msg: "Username updated successfully")
                        ],
                      ),
                    ),
                  ),
                  AppWidgets.spacer(verticalSpace: 10),

                  /// Email
                  Container(
                    decoration: AppConst.boxDecoration20Radius,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(),
                          Text(
                            "Email",
                            style: AppTextStyles.font15.copyWith(fontWeight: FontWeight.w400),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 30,
                              right: 30,
                            ),
                            child: AppFormField(
                              textEditingController: emailCtrl,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  AppWidgets.spacer(verticalSpace: 10),

                  /// Update Phone
                  Container(
                    decoration: AppConst.boxDecoration20Radius,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(),
                          Text(
                            "Update Phone ",
                            style: AppTextStyles.font15.copyWith(fontWeight: FontWeight.w400),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 30),
                            child: Column(
                              children: [
                                AppFormField(
                                  textEditingController: phoneCtrl,
                                ),
                                AppFormField(
                                    textEditingController:
                                        TextEditingController(text: "Enter Otp Code here")),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Wait 59s to re send",
                                      style: AppTextStyles.font15,
                                    ),
                                    Text(
                                      "Resend",
                                      style: AppTextStyles.font15WithGrey,
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          AppWidgets.spacer(verticalSpace: 10),
                          const Align(
                            alignment: Alignment.bottomRight,
                            child: CircleAvatar(
                              backgroundColor: Colors.black,
                              radius: 15,
                              child: Icon(
                                Icons.check,
                                color: Colors.white,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  AppWidgets.spacer(verticalSpace: 100),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  final Widget editProfile = Row(
    children: [
      AppWidgets.blueBar(),
      Text(
        "Edit Profile",
        style: AppTextStyles.subTitleStyle,
      )
    ],
  );

  Widget updateStatus({required String msg}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Text(
            msg,
            style: AppTextStyles.font15,
          ),
          AppWidgets.spacer(horizontalSpace: 10),
          const CircleAvatar(
            radius: 15,
            backgroundColor: Colors.green,
            child: Icon(
              Icons.check,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
