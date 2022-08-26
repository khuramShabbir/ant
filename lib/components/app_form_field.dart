import 'package:flutter/material.dart';

class AppFormField extends StatefulWidget {
  final TextEditingController textEditingController;
  final String hintLabel;
  const AppFormField({
    Key? key,
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
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: TextFormField(
        controller: widget.textEditingController,
        decoration: InputDecoration(labelText: widget.hintLabel),
      ),
    );
  }
}
