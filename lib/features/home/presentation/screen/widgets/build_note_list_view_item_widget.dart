import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_note/core/utils/app_colors.dart';
import 'package:my_note/core/utils/app_text_styles.dart';
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
                Text(model.category!, style: AppTextStyles.label),
                Spacer(),
                Icon(Icons.push_pin, color: AppColors.textSecondary, size: 18),
              ],
            ),
            SizedBox(height: 5),
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
                formatCreatedAt(model.createdAt!),
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

String timeAgo(DateTime createdAt) {
  final diff = DateTime.now().difference(createdAt);

  if (diff.inSeconds < 60)  return 'Just now';
  if (diff.inMinutes < 60)  return '${diff.inMinutes}m ago';
  if (diff.inHours < 24)    return '${diff.inHours}h ago';
  if (diff.inDays == 1)     return 'Yesterday';
  if (diff.inDays < 7)      return '${diff.inDays}d ago';
  if (diff.inDays < 30)     return '${(diff.inDays / 7).floor()}w ago';
  if (diff.inDays < 365)    return '${(diff.inDays / 30).floor()}mo ago';
  return '${(diff.inDays / 365).floor()}y ago';
}


String formatCreatedAt(DateTime createdAt) {
  final diff = DateTime.now().difference(createdAt);

  if (diff.inDays == 0) {
    return DateFormat('hh:mm a').format(createdAt);        // 05:24 PM
  } else if (diff.inDays == 1) {
    return 'Yesterday at ${DateFormat('hh:mm a').format(createdAt)}';
  } else if (diff.inDays < 7) {
    return DateFormat('EEEE hh:mm a').format(createdAt);   // Friday 05:24 PM
  } else {
    return DateFormat('MMM d, yyyy').format(createdAt);    // Sep 15, 2026
  }
}