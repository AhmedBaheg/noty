import 'package:flutter/material.dart';
import 'package:my_note/core/utils/app_colors.dart';
import 'package:my_note/core/utils/app_text_styles.dart';

class DrawerHeaderWidget extends StatelessWidget {
  const DrawerHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Logo
        Container(
          width: 52,
          height: 52,
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: AppColors.card,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(
              color: AppColors.border,
            ),
          ),
          child: Image.asset(
            'assets/images/launcher_icon.png',
            fit: BoxFit.contain,
          ),
        ),

        const SizedBox(width: 14),

        // App Name
        Text(
          'Note ',
          style: AppTextStyles.drawerAppName.copyWith(color: AppColors.primary),
        ),
        Text(
          'Book',
          style: AppTextStyles.drawerAppName,
        ),
      ],
    );
  }
}
