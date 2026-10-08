import 'package:flutter/material.dart';
import 'package:my_note/core/utils/app_colors.dart';
import 'package:my_note/core/utils/app_text_styles.dart';

class EmptyTrashWidget extends StatelessWidget {
  const EmptyTrashWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.delete_outline_rounded,
            size: 80,
            color: AppColors.textPrimary.withValues(
              alpha: 0.25,
            ),
          ),

          const SizedBox(height: 16),

          Text(
            'Trash is empty',
            style: AppTextStyles.appBarTitle.copyWith(
              color: AppColors.textPrimary.withValues(
                alpha: 0.7,
              ),
            ),
          ),

          const SizedBox(height: 8),

          Text(
            'Deleted notes will appear here',
            style: TextStyle(
              color: AppColors.textPrimary.withValues(
                alpha: 0.5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}