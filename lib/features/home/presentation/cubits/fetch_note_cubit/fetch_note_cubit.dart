import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:my_note/core/utils/app_texts.dart';
import 'package:my_note/features/home/data/model/note_model.dart';

part 'fetch_note_state.dart';

class FetchNoteCubit extends Cubit<FetchNoteState> {
  FetchNoteCubit() : super(FetchNoteInitial());

  List<NoteModel> notesList = [];

  void fetchNotes() {

    try {
      var notesBox = Hive.box<NoteModel>(AppTexts.noteBox);
      notesList = notesBox.values.toList().reversed.toList();

      notesList.sort((a, b) {
        if (a.isPinned == true && b.isPinned != true) {
          return -1; // عنصر 'a' يرتفع للأعلى
        } else if (a.isPinned != true && b.isPinned == true) {
          return 1;  // عنصر 'b' يرتفع للأعلى
        }
        return 0; // يبقون كما هم إذا كانوا متساويين
      });

      emit(FetchNoteSuccess(notesList: notesList));
    } on Exception catch (e) {
      emit(FetchNoteFailure(message: e.toString()));
    }
  }
}
