part of 'trash_note_cubit.dart';

@immutable
sealed class TrashNoteState {}

final class TrashNoteInitial extends TrashNoteState {}
final class TrashNoteLoading extends TrashNoteState {}
final class TrashNoteSuccess extends TrashNoteState {

  final List<NoteModel> trashList;

  new({required this.trashList});

}
final class TrashNoteFailure extends TrashNoteState {
  final String errorMessage;

  new({required this.errorMessage});
}
