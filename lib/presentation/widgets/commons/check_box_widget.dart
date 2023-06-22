import 'package:flutter/material.dart';

class CheckBoxWidget extends StatefulWidget {
  const CheckBoxWidget({
    super.key,
  });

  @override
  State<CheckBoxWidget> createState() => _CheckBoxWidgetState();
}

class _CheckBoxWidgetState extends State<CheckBoxWidget> {
  bool onChangedValue = false;
  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: onChangedValue, 
      onChanged: (value) {
        onChangedValue = value!;
        setState(() {});
      }
    );
  }
}