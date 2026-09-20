import 'package:flutter/material.dart';
import 'package:my_note/core/utils/app_colors.dart';
import 'package:my_note/core/utils/app_text_styles.dart';
import 'package:my_note/core/utils/app_texts.dart';
import 'package:my_note/features/add_note/presentation/screen/add_note_screen.dart';
import 'package:my_note/features/home/presentation/screen/widgets/build_floating_action_button_widget.dart';

import 'widgets/categories_list_view_builder_widget.dart';
import 'widgets/notes_list_view_builder_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: BuildFloatingActionButtonWidget(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddNoteScreen()),
          );
        },
      ),
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        title: Text(
          'Home Screen',
          style: TextStyle(color: AppColors.textPrimary),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(height: 20),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(AppTexts.allNote, style: AppTextStyles.screenTitle),
            ),
            SizedBox(height: 20),
            CategoriesListViewBuilderWidget(),
            SizedBox(height: 10),
            NotesListViewBuilderWidget(),
          ],
        ),
      ),
    );
  }
}
