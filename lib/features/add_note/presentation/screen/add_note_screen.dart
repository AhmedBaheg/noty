import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_note/core/utils/app_colors.dart';
import 'package:my_note/features/home/data/model/note_model.dart';
import 'package:my_note/features/home/presentation/cubits/fetch_note_cubit/fetch_note_cubit.dart';
import 'package:my_note/features/note_details/presentation/cubits/add_note_cubit/edit_note_cubit.dart';

import '../cubits/add_note_cubit/add_note_cubit.dart';
import 'widgets/add_note_screen_body.dart';
import 'widgets/custom_add_note_bar_widget.dart';

class AddNoteScreen extends StatefulWidget {
  const AddNoteScreen({super.key, this.model, this.index});

  final NoteModel? model;
  final int? index;

  @override
  State<AddNoteScreen> createState() => _AddNoteScreenState();
}

class _AddNoteScreenState extends State<AddNoteScreen> {
  final GlobalKey<FormState> formKey = GlobalKey();

  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;

  String? title, content;
  late String? category;
  late Color? categoryColor;
  late TextEditingController titleController;
  late TextEditingController contentController;

  @override
  void initState() {
    super.initState();
    // تهيئة القيم بالبيانات القديمة في حالة التعديل
    titleController = TextEditingController(text: widget.model?.title ?? "");
    contentController = TextEditingController(
      text: widget.model?.content ?? "",
    );
    category = widget.model?.category ?? "Category";
    categoryColor = widget.model?.categoryColor != null
        ? Color(widget.model!.categoryColor!)
        : AppColors.textSecondary;
  }

  void saveNote() {
    if (category == "Category") {
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

      if (widget.model == null) {
        BlocProvider.of<AddNoteCubit>(context).addNote(
          NoteModel(
            title: title,
            content: content,
            category: category,
            createdAt: DateTime.now(),
            categoryColor: categoryColor?.value,
            isPinned: false,
          ),
        );
      } else {
        widget.model!.title = title;
        widget.model!.content = content;
        widget.model!.createdAt = DateTime.now();
        widget.model!.category = category;
        widget.model!.categoryColor = categoryColor?.value;
        BlocProvider.of<EditNoteCubit>(context).editNote(widget.model!);
      }
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
          model: widget.model,
          onPressed: () {
            saveNote();
          },
        ),
        backgroundColor: AppColors.background,
        automaticallyImplyLeading: false,
        leadingWidth: 0,
        titleSpacing: 0,
      ),
      body: MultiBlocListener(
        listeners: [
          BlocListener<AddNoteCubit, AddNoteState>(
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
          BlocListener<EditNoteCubit, EditNoteState>(
            listener: (BuildContext context, EditNoteState state) {
              if (state is EditNoteSuccess) {
                Navigator.pop(context);
                BlocProvider.of<FetchNoteCubit>(context).fetchNotes();
              }

              if (state is EditNoteFailure) {
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text(state.message)));
              }
            },
          ),
        ],
        child: AddNoteScreenBody(
          onTitleSaved: (value) => title = value,
          onContentSaved: (value) => content = value,
          formKey: formKey,
          autoValidateMode: autoValidateMode,
          title: title,
          content: content,
          selectedCategory: category,
          selectedCategoryColor: categoryColor?.value,
          onChangeCategory: (value) => setState(() {
            category = value;
          }),
          onChangeCategoryColo: (value) => categoryColor = value,
          model: widget.model,
          contentController: contentController,
          titleController: titleController,
        ),
      ),
    );
  }
}
