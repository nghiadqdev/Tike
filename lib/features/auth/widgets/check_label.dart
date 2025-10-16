import 'package:flutter/material.dart';

class CheckLabel extends StatefulWidget {
  const CheckLabel({super.key, required this.check, required this.onCheck, required this.label });
  final String label;
  final bool check;
  final void Function(bool) onCheck;

  @override
  State<CheckLabel> createState() => _CheckLabelState();
}

class _CheckLabelState extends State<CheckLabel> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(widget.label),
        // CheckLabel(check: check, onCheck: onCheck, label: label)
      ],
    );
  }
}
