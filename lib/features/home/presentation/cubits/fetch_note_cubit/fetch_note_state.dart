part of 'fetch_note_cubit.dart';

@immutable
sealed class FetchNoteState {}

final class FetchNoteInitial extends FetchNoteState {}
final class FetchNoteSuccess extends FetchNoteState {
  final List<NoteModel> notesList;

  new({required this.notesList});
}
final class FetchNoteFailure extends FetchNoteState {
  final String message;

  new({required this.message});
}
