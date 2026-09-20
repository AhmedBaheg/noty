import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_note/features/home/data/model/note_model.dart';

import '../../cubits/fetch_note_cubit/fetch_note_cubit.dart';
import 'build_note_list_view_item_widget.dart';
import 'package:intl/intl.dart';


class NotesListViewBuilderWidget extends StatefulWidget {
  const NotesListViewBuilderWidget({super.key});

  @override
  State<NotesListViewBuilderWidget> createState() => _NotesListViewBuilderWidgetState();
}

class _NotesListViewBuilderWidgetState extends State<NotesListViewBuilderWidget> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<FetchNoteCubit>(context).fetchNotes();
}

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<FetchNoteCubit, FetchNoteState>(
        builder: (context, state) {
          List<NoteModel> notesList = BlocProvider.of<FetchNoteCubit>(context).notesList;
          return ListView.builder(
            itemCount: notesList.length,
            itemBuilder: (context, index) =>
                BuildNoteListViewItemWidget(
                  model: notesList[index],
                ),
          );
        },
      ),
    );
  }
}
