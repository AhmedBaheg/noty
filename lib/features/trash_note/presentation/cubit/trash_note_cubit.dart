import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:my_note/core/utils/app_texts.dart';
import 'package:my_note/features/home/data/model/note_model.dart';

part 'trash_note_state.dart';

class TrashNoteCubit extends Cubit<TrashNoteState> {
  TrashNoteCubit() : super(TrashNoteInitial());
  
  List<NoteModel> trashList = [];
  
  void fetchTrashNotes() {
    
    var trashBox = Hive.box<NoteModel>(AppTexts.trashBox);

    try {
      trashList = trashBox.values.toList().reversed.toList();

      emit(TrashNoteSuccess(trashList: trashList));
    } on Exception catch (e) {
      emit(TrashNoteFailure(errorMessage: e.toString()));
    }
    
  }

  Future<void> deleteForever() async {

    var trashBox = Hive.box<NoteModel>(AppTexts.trashBox);
    await trashBox.clear();

    fetchTrashNotes();

  }
  
}
