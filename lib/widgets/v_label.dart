import 'package:flutter/material.dart';

class VLabel extends StatelessWidget {
  const VLabel({Key? key, required this.label}) : super(key: key);
  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        label,
        style: TextStyle(fontSize: 28.0, color: Colors.white),
      ),
    );
  }
}
