import 'package:flutter/material.dart';

class AForm extends StatelessWidget {
  const AForm({super.key, required this.childrent});

  final Widget childrent;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 40,
        vertical: 8,
      ),
      child: childrent,
    );
  }
}
