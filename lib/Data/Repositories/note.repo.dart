import '../../core/Providers/FB Firestore/fbfirestore_repo.dart';
import '../Model/Notes/notes.dart';

class NoteRepo extends FirestoreRepo<Note> {
  NoteRepo()
      : super(
    'Notes',
  );

  @override
  Note? toModel(Map<String, dynamic>? item) => Note.fromMap(item ?? {});

  @override
  Map<String, dynamic>? fromModel(Note? item) => item?.toMap() ?? {};
}
