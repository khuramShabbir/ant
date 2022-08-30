import 'package:demo/commons/app_colors.dart';
import 'package:flutter/material.dart';

class SingleSelectionChip extends StatefulWidget {
  final List<String> chipsDataList;
  final ValueChanged<String> valueChanged;

  String initChoice;

  SingleSelectionChip({
    Key? key,
    required this.valueChanged,
    this.initChoice = "",
    required this.chipsDataList,
  }) : super(key: key);

  @override
  _SingleSelectionChipState createState() => _SingleSelectionChipState();
}

class _SingleSelectionChipState extends State<SingleSelectionChip> {
  _buildChoiceList() {
    List<Widget> choices = [];
    for (var item in widget.chipsDataList) {
      choices.add(Container(
        padding: const EdgeInsets.all(2.0),
        child: ChoiceChip(
          label: Text(item),
          selectedColor: AppColors.primary.withOpacity(.5),
          selected: widget.initChoice == item,
          onSelected: (selected) {
            setState(() {
              widget.initChoice = item;
              widget.valueChanged(widget.initChoice);
            });
          },
        ),
      ));
    }
    return choices;
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: _buildChoiceList(),
    );
  }
}
