import 'package:flutter/material.dart';
import 'package:scoltender/app_colors.dart';

class TextFieldWidget extends StatelessWidget {
  final TextEditingController textEditingController;
  final String label;
  final String hint;
  final FormFieldValidator<String>? validator;

  const TextFieldWidget({
    super.key,
    required this.textEditingController,
    required this.label,
    required this.hint,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      textAlign: TextAlign.start,
      style: const TextStyle(
        color: Colors.black,
        fontSize: 13,
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w400,
      ),
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        hintStyle: const TextStyle(
          color: Colors.black,
          fontSize: 10,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w400,
        ),
        labelStyle: TextStyle(
          color: AppColors.primaryColor,
          fontSize: 15,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w600,
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(
            width: 1,
            color: Colors.black,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(
            width: 1,
            color: AppColors.primaryColor,
          ),
        ),
      ),
      validator: validator,
    );
  }
}
