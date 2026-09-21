import 'package:flutter/material.dart';
import 'package:my_note/core/utils/app_colors.dart';
import 'package:my_note/core/utils/app_text_styles.dart';
import 'package:my_note/features/home/data/model/note_model.dart';

class CustomAddNoteBarWidget extends StatelessWidget {
  const CustomAddNoteBarWidget({
    super.key, required this.onPressed, this.model,
  });

  final VoidCallback? onPressed;
  final NoteModel? model;


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
          Text(model != null ? 'Edit Note' : 'Add Note', style: AppTextStyles.appBarTitle,),
          TextButton(
            onPressed: onPressed,
            child: Text(model != null ? 'Update' : 'Save', style: AppTextStyles.button.copyWith(color: AppColors.primary)),
          ),
        ],
      ),
    );
  }
}
