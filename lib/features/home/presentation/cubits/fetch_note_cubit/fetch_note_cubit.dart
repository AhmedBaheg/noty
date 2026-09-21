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

      // 3. السحر هنا ✨: بدلاً من عرض الكل، نفلتر بناءً على الكاتيجوري الحالي المخزن
      filterNotesByCategory();

    } on Exception catch (e) {
      emit(FetchNoteFailure(message: e.toString()));
    }
  }

  void fetchSpecificNote(String selectedCategory) {
    currentCategory = selectedCategory; // حفظ الكاتيجوري المختار
    filterNotesByCategory();
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
}

