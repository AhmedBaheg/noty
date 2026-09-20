import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_note/core/utils/app_colors.dart';
import 'package:my_note/features/home/data/model/note_model.dart';
import 'package:my_note/features/home/presentation/cubits/fetch_note_cubit/fetch_note_cubit.dart';

import '../cubits/add_note_cubit/add_note_cubit.dart';
import 'widgets/add_note_screen_body.dart';
import 'widgets/custom_add_note_bar_widget.dart';

class AddNoteScreen extends StatefulWidget {
  const AddNoteScreen({super.key});

  @override
  State<AddNoteScreen> createState() => _AddNoteScreenState();
}

class _AddNoteScreenState extends State<AddNoteScreen> {
  final GlobalKey<FormState> formKey = GlobalKey();

  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;

  String? title, content, category;
  Color? categoryColor;

  void saveNote() {
    if (category == null || category!.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please choose a category first!'),
          backgroundColor: Colors.redAccent,
          behavior: SnackBarBehavior.floating,
        ),
      );
      return;
    }

    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      BlocProvider.of<AddNoteCubit>(context).addNote(
        NoteModel(
          title: title,
          content: content,
          category: category,
          createdAt: DateTime.now(),
          categoryColor: categoryColor?.value,
        ),
      );
    } else {
      setState(() {
        autoValidateMode = AutovalidateMode.always;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: CustomAddNoteBarWidget(
          onPressed: () {
            saveNote();
          },
        ),
        backgroundColor: AppColors.background,
        automaticallyImplyLeading: false,
        leadingWidth: 0,
        titleSpacing: 0,
      ),
      body: BlocConsumer<AddNoteCubit, AddNoteState>(
        builder: (context, state) {
          return AddNoteScreenBody(
            onTitleSaved: (value) => title = value,
            onContentSaved: (value) => content = value,
            formKey: formKey,
            autoValidateMode: autoValidateMode,
            title: title,
            content: content,
            selectedCategory: category,
            onChangeCategory: (value) => setState(() {
              category = value;
            }),
            onChangeCategoryColo: (value) => categoryColor = value,
          );
        },
        listener: (BuildContext context, AddNoteState state) {
          if (state is AddNoteSuccess) {
            Navigator.pop(context);
            BlocProvider.of<FetchNoteCubit>(context).fetchNotes();
          }

          if (state is AddNoteFailure) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.message)));
          }
        },
      ),
    );
  }
}
