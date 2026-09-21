import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:my_note/features/home/data/model/note_model.dart';

part 'edit_note_state.dart';

class EditNoteCubit extends Cubit<EditNoteState> {
  EditNoteCubit() : super(EditNoteInitial());

  void editNote(NoteModel model) {
    emit(EditNoteLoading());

    try {
      model.save();
      emit(EditNoteSuccess());
    } on Exception catch (e) {
      emit(EditNoteFailure(message: e.toString()));
    }
  }

  void isPinned(NoteModel model) {

    emit(EditNoteLoading());

    try {
      model.isPinned = !model.isPinned!;
      model.save();
      emit(EditNoteSuccess());
    } on Exception catch (e) {
      // TODO
      emit(EditNoteFailure(message: e.toString()));
    }

  }
}
