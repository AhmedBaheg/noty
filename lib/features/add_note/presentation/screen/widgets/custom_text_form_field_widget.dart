import 'package:flutter/material.dart';
import 'package:my_note/core/utils/app_colors.dart';
import 'package:my_note/core/utils/app_text_styles.dart';

class CustomTextFormFieldWidget extends StatelessWidget {
  const CustomTextFormFieldWidget({
    super.key,
    this.style,
    this.hintStyle,
    required this.hint,
    this.onSaved,
    this.controller,
  });

  final TextStyle? style, hintStyle;
  final String hint;
  final String? Function(String?)? onSaved;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onSaved: onSaved,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "This field is required";
        }
        return null;
      },
      minLines: 1,
      maxLines: null,
      keyboardType: TextInputType.multiline,
      style: style ?? AppTextStyles.input,
      cursorColor: AppColors.textPrimary,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: hintStyle ?? AppTextStyles.hint,
        border: InputBorder.none,
      ),
    );
  }
}
