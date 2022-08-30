import 'dart:io';

import 'package:demo/Models/AuthModel/auth_model.dart';
import 'package:demo/commons/app_assets.dart';
import 'package:demo/commons/app_text_styles.dart';
import 'package:demo/commons/constant.dart';
import 'package:demo/commons/local_storage.dart';
import 'package:demo/commons/widgets.dart';
import 'package:demo/components/app_extended_button.dart';
import 'package:demo/components/app_extended_button_rounded.dart';
import 'package:demo/components/app_form_field.dart';
import 'package:demo/controllers/AuthProvider/edit_profile_provider.dart';
import 'package:demo/controllers/AuthProvider/user_credential_provider.dart';

import 'package:demo/views/Auth_Views/sign_in_with_google_view.dart';
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
  late TextEditingController otpPinCtrl;
  late UserCredentialProvider userProv;

  @override
  void initState() {
    userProv = Provider.of<UserCredentialProvider>(context, listen: false);
    nameCtrl = TextEditingController(text: user.userName);
    emailCtrl = TextEditingController(text: user.email);
    // phoneCtrl = TextEditingController(text: user.contactNumber);
    phoneCtrl = TextEditingController(text: "+923134905014");
    otpPinCtrl = TextEditingController(text: "Enter Otp Code here");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<EditProfileProvider>(
      builder: (BuildContext context, editProv, Widget? child) {
        return Scaffold(
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: AppExtendedButtonFilled(
                onTap: () async {
                  await userProv.otpSend(phoneNumber: phoneCtrl.text, otpPin: "123456");

                  if (editProv.isPhoneVerified) {
                    await editProv.updateProfile(
                      name: nameCtrl.text,
                      email: emailCtrl.text,
                      contactNumber: phoneCtrl.text,
                      profileUrl: "profileUrl",
                    );
                  }
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
                  InkWell(
                    onTap: () async {
                      await editProv.getImages();
                    },
                    child: Container(
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
                                editProv.xFile != null
                                    ? CircleAvatar(
                                        radius: 30,
                                        backgroundImage: FileImage(File(editProv.xFile!.path)))
                                    : CircleAvatar(
                                        radius: 30,
                                        backgroundImage: user.profileUrl != null
                                            ? NetworkImage(user.profileUrl!)
                                            : null,
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
                                AppFormField(textEditingController: otpPinCtrl),
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
                  AppWidgets.spacer(verticalSpace: 20),
                  TextButton(
                    onPressed: () {
                      AppWidgets.infoSnackBar(msg: "Long Press For Account Delete");
                    },
                    child: const Text(
                      "Delete Account",
                      style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                    ),
                    onLongPress: () async {
                      await confirmation(context, onConfirm: () async {
                        Navigator.pop(context);
                        bool status =
                            await Provider.of<UserCredentialProvider>(context, listen: false)
                                .deleteAccount();
                        if (status) {
                          Navigator.pushAndRemoveUntil(context,
                              MaterialPageRoute(builder: (BuildContext context) {
                            return const SignInWithGoogleView();
                          }), (route) => false);
                        }
                      });
                    },
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

  Future<void> confirmation(BuildContext context, {required VoidCallback onConfirm}) async {
    showDialog(
      barrierDismissible: true,
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.symmetric(
              horizontal: 50, vertical: MediaQuery.of(context).size.height * .3),
          child: Material(
            elevation: 5,
            borderRadius: BorderRadius.circular(10),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Text(
                      "Do you want delete account permanently?",
                      style:
                          TextStyle(color: Colors.red, fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        AppExtendedButtonRounded(onTap: onConfirm, title: "Delete"),
                        AppExtendedButtonRounded(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            title: "Cancel")
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

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
