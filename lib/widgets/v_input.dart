import 'package:flutter/material.dart';
import 'package:login/constant.dart';

class VTextForm extends StatelessWidget {
  final bool? enabled;
  final String label;
  final String value;
  final TextEditingController controller;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onEditingComplete;

  const VTextForm(
      {Key? key,
      this.onChanged,
      this.onEditingComplete,
      this.enabled,
      required this.label,
      required this.value,
      required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
            ),
          ),
          SizedBox(height: 10),
          TextFormField(
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
            enabled: enabled,
            onChanged: onChanged,
            onEditingComplete: onEditingComplete,
            controller: controller,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent),
                borderRadius: BorderRadius.circular(16.0),
              ),
              focusColor: Colors.white,
              hoverColor: Colors.white,
              filled: true,
              fillColor: kDarkBlue,
              hintText: value,
              hintStyle: TextStyle(color: Colors.white, fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }
}

class VDate {
  static Future<DateTime?> vShowDatePicker(
    BuildContext context, {
    DateTime? selectedDate,
    DateTime? lastDate,
  }) async {
    return await showDatePicker(
      context: context,
      initialDate:
          selectedDate ?? DateTime.now().subtract(Duration(days: 365 * 22)),
      firstDate: DateTime(1965),
      lastDate: lastDate ?? DateTime(2200, 6, 7, 05, 09),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: const ColorScheme.light(primary: kDarkBlue),
          ),
          child: child!,
        );
      },
    );
  }
}
