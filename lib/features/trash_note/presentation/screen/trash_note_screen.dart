import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_note/core/utils/app_colors.dart';
import 'package:my_note/core/utils/app_text_styles.dart';
import 'package:my_note/features/home/data/model/note_model.dart';
import 'package:my_note/features/home/presentation/screen/widgets/build_note_list_view_item_widget.dart';
import 'package:my_note/features/trash_note/presentation/cubit/trash_note_cubit.dart';

import '../../../home/presentation/screen/widgets/empty_trash_widget.dart';

class TrashNoteScreen extends StatelessWidget {
  const TrashNoteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TrashNoteCubit, TrashNoteState>(
      builder: (context, state) {
        final List<NoteModel> trashList = context
            .read<TrashNoteCubit>()
            .trashList;

        return Scaffold(
          backgroundColor: AppColors.background,

          appBar: AppBar(
            backgroundColor: AppColors.background,
            elevation: 0,
            centerTitle: true,

            title: Text('Trash', style: AppTextStyles.appBarTitle),

            iconTheme: IconThemeData(color: AppColors.textPrimary),

            actions: [
              if (trashList.isNotEmpty)
                IconButton(
                  onPressed: () {
                    context.read<TrashNoteCubit>().deleteForever();
                  },
                  tooltip: 'Delete all',
                  icon: const Icon(
                    Icons.delete_outline_rounded,
                    color: Colors.red,
                  ),
                ),
            ],
          ),

          body: trashList.isEmpty
              ? const EmptyTrashWidget()
              : Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  child: ListView.builder(
                    itemCount: trashList.length,
                    itemBuilder: (context, index) {
                      return BuildNoteListViewItemWidget(
                        model: trashList[index],
                      );
                    },
                  ),
                ),
        );
      },
    );
  }
}
