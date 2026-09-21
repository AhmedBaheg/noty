import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_note/core/utils/app_colors.dart';
import 'package:my_note/core/utils/app_text_styles.dart';
import 'package:my_note/core/utils/date_time_format.dart';
import 'package:my_note/features/add_note/presentation/screen/add_note_screen.dart';
import 'package:my_note/features/add_note/presentation/screen/widgets/custom_add_note_bar_button.dart';
import 'package:my_note/features/home/data/model/note_model.dart';
import 'package:my_note/features/home/presentation/cubits/fetch_note_cubit/fetch_note_cubit.dart';

import '../cubits/add_note_cubit/edit_note_cubit.dart';

class NoteDetailsScreen extends StatefulWidget {
  const NoteDetailsScreen({super.key, required this.model, required this.index, this.isPinned});

  final NoteModel model;
  final int index;
  final bool? isPinned;

  @override
  State<NoteDetailsScreen> createState() => _NoteDetailsScreenState();
}

class _NoteDetailsScreenState extends State<NoteDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditNoteCubit, EditNoteState>(
  builder: (context, state) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        iconTheme: IconThemeData(color: AppColors.textPrimary),
        actions: [
          IconButton(
            onPressed: () {
              BlocProvider.of<EditNoteCubit>(context).isPinned(widget.model);
              BlocProvider.of<FetchNoteCubit>(context).fetchNotes();
              Navigator.pop(context);
            },
            icon: widget.model.isPinned == true ? Icon(
              Icons.push_pin_rounded,
              color: Color(widget.model.categoryColor!),
            ) : Icon(
            Icons.push_pin_outlined,
            color: Color(widget.model.categoryColor!),
          ),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AddNoteScreen(model: widget.model,index: widget.index),),
              ).then((value){
                setState(() {
                  BlocProvider.of<FetchNoteCubit>(context).fetchNotes();
                });
              });
            },
            icon: const Icon(Icons.edit),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Row(
              children: [
                Container(
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: Color(widget.model.categoryColor!),
                    shape: BoxShape.circle,
                  ),
                ),
                SizedBox(width: 10),
                Text(
                  widget.model.category!,
                  style: AppTextStyles.body.copyWith(
                    color: Color(widget.model.categoryColor!),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(widget.model.title!, style: AppTextStyles.screenTitle),
            SizedBox(height: 20),
            Text(
              DateTimeFormat.formatCreatedAtDetailsNote(widget.model.createdAt!),
              style: AppTextStyles.caption,
            ),
            SizedBox(height: 20),
            Expanded(
              child: Text(widget.model.content!, style: AppTextStyles.noteTitle),
            ),
            Divider(color: AppColors.border, thickness: 0.3),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomAddNoteBarButton(
                  icon: Icons.text_fields,
                  onTap: () {},
                  iconColor: AppColors.textSecondary,
                ),
                CustomAddNoteBarButton(
                  icon: Icons.format_list_bulleted,
                  onTap: () {},
                  iconColor: AppColors.textSecondary,
                ),
                CustomAddNoteBarButton(
                  icon: Icons.image_outlined,
                  onTap: () {},
                  iconColor: AppColors.textSecondary,
                ),
                CustomAddNoteBarButton(
                  icon: Icons.delete_outline_rounded,
                  onTap: () {},
                  iconColor: AppColors.textSecondary,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  },
);
  }
}
