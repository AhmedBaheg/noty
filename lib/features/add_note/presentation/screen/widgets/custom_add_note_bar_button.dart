import 'package:flutter/material.dart';
import 'package:my_note/core/utils/app_colors.dart';

class CustomAddNoteBarButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  final Color? iconColor;

  const CustomAddNoteBarButton({
    super.key,
    required this.icon,
    required this.onTap,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: onTap,
          icon: Icon(icon, color: iconColor ?? AppColors.primary),
        ),
      ],
    );
  }
}
