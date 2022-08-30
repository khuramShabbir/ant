import 'package:demo/commons/app_colors.dart';
import 'package:flutter/material.dart';

class AppFormField extends StatefulWidget {
  final TextEditingController textEditingController;
  final double padding;
  final String hintLabel;
  final bool outlinedBorderd;
  final int maxLines;
  final FormFieldValidator<String>? validator;
  const AppFormField({
    Key? key,
    this.validator,
    this.outlinedBorderd = false,
    this.maxLines = 1,
    this.padding = 5.0,
    required this.textEditingController,
    this.hintLabel = '',
  }) : super(key: key);

  @override
  State<AppFormField> createState() => _AppFormFieldState();
}

class _AppFormFieldState extends State<AppFormField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: widget.padding),
      child: TextFormField(
        validator: widget.validator,
        maxLines: widget.maxLines,
        controller: widget.textEditingController,
        decoration: InputDecoration(
          labelStyle: TextStyle(color: AppColors.primary),
          labelText: widget.hintLabel,
          enabledBorder: widget.outlinedBorderd
              ? OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.primary, width: 1),
                )
              : UnderlineInputBorder(
                  borderSide: BorderSide(width: 1, color: AppColors.primary),
                ),
          border: widget.outlinedBorderd
              ? OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.primary, width: 1),
                )
              : UnderlineInputBorder(
                  borderSide: BorderSide(width: 1, color: AppColors.primary),
                ),
          focusedBorder: widget.outlinedBorderd
              ? OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.primary, width: 1),
                )
              : UnderlineInputBorder(
                  borderSide: BorderSide(width: 1, color: AppColors.primary),
                ),
        ),
      ),
    );
  }
}
