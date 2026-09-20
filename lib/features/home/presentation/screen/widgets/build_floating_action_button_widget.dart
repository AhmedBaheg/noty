import 'package:flutter/material.dart';
import 'package:my_note/core/utils/app_colors.dart';


class BuildFloatingActionButtonWidget extends StatelessWidget {
  const BuildFloatingActionButtonWidget({
    super.key, required this.onPressed,
  });

  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      backgroundColor: AppColors.primary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50),
      ),
      child: Icon(Icons.add, color: AppColors.textPrimary),
    );
  }
}
