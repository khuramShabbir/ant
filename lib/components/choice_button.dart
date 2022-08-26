import 'package:demo/commons/app_colors.dart';
import 'package:demo/commons/constant.dart';
import 'package:demo/commons/widgets.dart';
import 'package:flutter/material.dart';

class ChoiceButton extends StatefulWidget {
  final ValueChanged<String> valueChanged;
  final String button1Text;
  final String button2Text;
  const ChoiceButton({
    required this.valueChanged,
    required this.button1Text,
    required this.button2Text,
    Key? key,
  }) : super(key: key);

  @override
  State<ChoiceButton> createState() => _ChoiceButtonState();
}

class _ChoiceButtonState extends State<ChoiceButton> {
  int choice = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppConst.boxDecoration10Radius,
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: Row(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () {
                  choice = 1;
                  setState(() {});
                  widget.valueChanged(widget.button1Text);
                },
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color:
                          choice == 1 ? AppColors.primary : Colors.transparent),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Text(
                        widget.button1Text,
                        style: TextStyle(
                            color: choice == 1 ? Colors.white : Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            AppWidgets.spacer(horizontalSpace: 30),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  choice = 2;
                  setState(() {});
                  widget.valueChanged(widget.button2Text);
                },
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color:
                          choice == 2 ? AppColors.primary : Colors.transparent),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Text(
                        widget.button2Text,
                        style: TextStyle(
                            color: choice == 2 ? Colors.white : Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
