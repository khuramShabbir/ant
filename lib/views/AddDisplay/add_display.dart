import 'dart:io';

import 'package:demo/commons/app_colors.dart';
import 'package:demo/commons/app_text_styles.dart';
import 'package:demo/commons/constant.dart';
import 'package:demo/commons/local_storage.dart';
import 'package:demo/commons/widgets.dart';
import 'package:demo/components/app_extended_button.dart';
import 'package:demo/components/app_form_field.dart';
import 'package:demo/components/single_selection_chip.dart';
import 'package:demo/controllers/AddDisplayProvider/add_display_prov.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddDisplay extends StatelessWidget {
  AddDisplay({Key? key}) : super(key: key);

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    logger.i(LocalStorage.getToken());

    return Consumer<AddDisplayProvider>(
      builder: (BuildContext context, value, Widget? child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Add Display"),
            leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back, color: AppColors.primary)),
          ),
          bottomSheet: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: AppExtendedButtonFilled(
              onTap: () async {
                if (formKey.currentState!.validate()) {
                  bool status = value.formValidations();
                  if (status) value.addDisplay();
                }
              },
              title: "Add",
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    titleText("Add Display Image"),
                    displayImage(
                        onTap: () async {
                          value.getDisplayImage();
                        },
                        addDisplayProvider: value),
                    titleText("Business Type"),
                    SingleSelectionChip(
                        valueChanged: (v) {
                          value.businessType = v;
                        },
                        chipsDataList: const ["Company", "Individual"]),
                    titleText("Display Type"),
                    SingleSelectionChip(
                        valueChanged: (v) {
                          value.displayType = v;
                        },
                        chipsDataList: const ["Static", "Variable"]),
                    titleText("Display Status"),
                    SingleSelectionChip(
                        valueChanged: (v) {
                          value.displayStatus = v;
                        },
                        chipsDataList: const ["Connected", "Disconnected"]),
                    // titleText(" Status"),
                    // SingleSelectionChip(
                    //     valueChanged: (v) {
                    //       value.status = v;
                    //     },
                    //     chipsDataList: const ["Pending", "Confirmed"]),
                    titleText("Add your Business Name"),
                    AppFormField(
                      validator: (v) {
                        if (v!.isEmpty) return "field required";
                        return null;
                      },
                      hintLabel: "Business Name",
                      outlinedBorderd: true,
                      textEditingController: value.businessNameCtrl,
                    ),
                    titleText("Business Location"),
                    AppFormField(
                      validator: (v) {
                        if (v!.isEmpty) return "field required";
                        return null;
                      },
                      hintLabel: "Business Location",
                      outlinedBorderd: true,
                      textEditingController: value.businessLocationCtrl,
                    ),
                    titleText("Business Category"),
                    AppFormField(
                      validator: (v) {
                        if (v!.isEmpty) return "field required";
                        return null;
                      },
                      hintLabel: "Business Category",
                      outlinedBorderd: true,
                      textEditingController: value.businessCategoryCtrl,
                    ),
                    titleText("Specifications"),
                    AppFormField(
                      validator: (v) {
                        if (v!.isEmpty) return "field required";
                        return null;
                      },
                      maxLines: 10,
                      hintLabel: "Specifications",
                      outlinedBorderd: true,
                      textEditingController: value.specificationCtrl,
                    ),
                    AppWidgets.spacer(verticalSpace: 150)
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget titleText(String title) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Text(title, style: AppTextStyles.font15BoldPrimary),
    );
  }

  Widget displayImage(
      {required VoidCallback onTap, required AddDisplayProvider addDisplayProvider}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 150,
        width: 150,
        decoration: BoxDecoration(
            image: addDisplayProvider.xFile != null
                ? DecorationImage(
                    image: FileImage(File(addDisplayProvider.xFile!.path)), fit: BoxFit.fill)
                : null,
            border: Border.all(width: 1, color: AppColors.primary),
            borderRadius: BorderRadius.circular(10)),
        child: Center(
          child:
              addDisplayProvider.xFile == null ? Icon(Icons.add, color: AppColors.primary) : null,
        ),
      ),
    );
  }
}
