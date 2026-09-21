import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_note/core/utils/app_colors.dart';
import 'package:my_note/core/utils/app_text_styles.dart';
import 'package:my_note/core/utils/date_time_format.dart';
import 'package:my_note/features/home/data/model/note_model.dart';

class BuildNoteListViewItemWidget extends StatelessWidget {
  const BuildNoteListViewItemWidget({super.key, required this.model});

  final NoteModel model;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(bottom: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      color: AppColors.card,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: Color(model.categoryColor!),
                    shape: BoxShape.circle,
                  ),
                ),
                SizedBox(width: 10),
                Text(model.category!, style: AppTextStyles.label.copyWith(color: Color(model.categoryColor!))),
                Spacer(),
                Icon(
                    Icons.push_pin_rounded, color: model.isPinned == true ? Color(model.categoryColor!) : AppColors.textSecondary, size: 18),
              ],
            ),
            SizedBox(height: 15),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    model.title!,
                    style: AppTextStyles.noteTitle,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 5),
                  Text(
                    model.content!,
                    style: AppTextStyles.body,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            SizedBox(height: 5),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                DateTimeFormat.formatCreatedAt(model.createdAt!),
                style: AppTextStyles.caption,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

