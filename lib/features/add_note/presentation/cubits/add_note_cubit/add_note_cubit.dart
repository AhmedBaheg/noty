import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:my_note/core/utils/app_texts.dart';
import 'package:my_note/features/home/data/model/note_model.dart';

part 'add_note_state.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddNoteInitial());

  void addNote(NoteModel model) {
    emit(AddNoteLoading());

    try {
      var notesBox = Hive.box<NoteModel>(AppTexts.noteBox);
      notesBox.add(model);
      emit(AddNoteSuccess());
    } on Exception catch (e) {
      emit(AddNoteFailure(message: e.toString()));
    }
  }
}
