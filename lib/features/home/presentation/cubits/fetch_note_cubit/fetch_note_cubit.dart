import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:my_note/core/utils/app_texts.dart';
import 'package:my_note/features/home/data/model/note_model.dart';

part 'fetch_note_state.dart';
class FetchNoteCubit extends Cubit<FetchNoteState> {
  FetchNoteCubit() : super(FetchNoteInitial());

  List<NoteModel> allList = [];
  List<NoteModel> notesList = [];


  String currentCategory = "All";

  // Drawer
  String selectedItem = "All Notes";
  int selectedIndex = 0;

  void selectItem(String item, int index) {
      selectedItem = item;
      selectedIndex = index;
  }


  void fetchNotes() {
    try {
      var notesBox = Hive.box<NoteModel>(AppTexts.noteBox);

      // 1. نجلب كل البيانات ونخزنها في القائمة الأساسية المرتبة تنازلياً
      allList = notesBox.values.toList().reversed.toList();

      // 2. نقوم بترتيب الـ allList أولاً بناءً على الـ pinned
      allList.sort((a, b) {
        if (a.isPinned == true && b.isPinned != true) return -1;
        if (a.isPinned != true && b.isPinned == true) return 1;
        return 0;
      });

      filterNotesByCategory();

    } on Exception catch (e) {
      emit(FetchNoteFailure(message: e.toString()));
    }
  }

  void filterNotesByCategory() {
    if (currentCategory == "All") {
      notesList = allList;
    } else if (currentCategory == "Pinned") {
      notesList = allList.where((note) => note.isPinned == true).toList();
    } else {
      notesList = allList
          .where((note) => note.category == currentCategory)
          .toList();
    }
    emit(FetchNoteSuccess(notesList: notesList));
  }

  void selectCategory(String category, int index) {
    currentCategory = category;
    selectedIndex = index;

    selectedItem = category == "All"
        ? "All Notes"
        : category;

    filterNotesByCategory();
  }

  void moveToTrash(NoteModel note) {

    var notesBox = Hive.box<NoteModel>(AppTexts.noteBox);
    notesBox.delete(note.key);

    var trashBox = Hive.box<NoteModel>(AppTexts.trashBox);
    trashBox.add(note);

  }

}

