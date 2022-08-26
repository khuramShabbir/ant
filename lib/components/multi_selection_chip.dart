import 'package:demo/commons/app_assets.dart';
import 'package:demo/commons/widgets.dart';
import 'package:flutter/material.dart';

class MultiSelectChip extends StatefulWidget {
  final List<dynamic> chipsDataList;
  final Function(List) onSelectionChanged;
  final List<dynamic> initChoices;
  const MultiSelectChip(
      {Key? key,
      required this.onSelectionChanged,
      required this.chipsDataList,
      this.initChoices = const <String>[]})
      : super(key: key);
  @override
  _MultiSelectChipState createState() => _MultiSelectChipState();
}

class _MultiSelectChipState extends State<MultiSelectChip> {
  _buildChoiceList() {
    List<Widget> choices = [];
    for (var item in widget.chipsDataList) {
      choices.add(Container(
        padding: const EdgeInsets.all(2.0),
        child: ChoiceChip(
          label: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(item),
              AppWidgets.spacer(horizontalSpace: 20),
              Image.asset(AppAssets.check),
            ],
          ),
          selectedColor: Colors.blue,
          selected: widget.initChoices.contains(item),
          backgroundColor: Colors.blue.withOpacity(.3),
          onSelected: (selected) {
            setState(() {
              widget.initChoices.contains(item)
                  ? widget.initChoices.remove(item)
                  : widget.initChoices.add(item);
              widget.onSelectionChanged(widget.initChoices); // +added
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
