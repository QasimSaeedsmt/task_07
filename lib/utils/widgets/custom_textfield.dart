import 'package:flutter/material.dart';
import 'package:task_07/constants/constants_resources.dart';
import 'package:task_07/constants/dimentions_resources.dart';

import '../../constants/string_resources.dart';

class CustomTextField extends StatelessWidget {
  final int labelNo;
  final TextEditingController controller;

  const CustomTextField({
    super.key,
    required this.labelNo,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          vertical: DimensionResources.D_5, horizontal: DimensionResources.D_5),
      child: TextFormField(
        maxLength: ConstantsResources.NUMBER_MAX_LENGTH,
        controller: controller,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
            labelText: "${StringResources.VALUE_LABEL} $labelNo",
            enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.green),
                borderRadius: BorderRadius.circular(DimensionResources.D_12)),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(DimensionResources.D_12),
                borderSide: const BorderSide(color: Colors.green))),
        validator: (value) {
          if (value!.isEmpty) {
            return StringResources.VALIDATION_TEXT;
          }
          if (int.tryParse(value) == null) {
            return StringResources.NUMBER_VALIDATION;
          }
          return null;
        },
      ),
    );
  }
}
