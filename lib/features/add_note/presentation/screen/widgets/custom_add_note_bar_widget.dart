import 'package:flutter/material.dart';
import 'package:my_note/core/utils/app_colors.dart';
import 'package:my_note/core/utils/app_text_styles.dart';

class CustomAddNoteBarWidget extends StatelessWidget {
  const CustomAddNoteBarWidget({
    super.key, required this.onPressed,
  });

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Cancel', style: AppTextStyles.button.copyWith(color: AppColors.primary)),
          ),
          Text('Add Note', style: AppTextStyles.appBarTitle,),
          TextButton(
            onPressed: onPressed,
            child: Text('Save', style: AppTextStyles.button.copyWith(color: AppColors.primary)),
          ),
        ],
      ),
    );
  }
}
