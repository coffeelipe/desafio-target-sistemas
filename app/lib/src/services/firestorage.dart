
import 'package:app/src/models/note.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

// ignore_for_file: avoid_print

class FirestorageService {
	static const String _serviceTag = '[FIRESTORAGE_SERVICE]';

	final FirebaseFirestore _db;

	FirestorageService({FirebaseFirestore? firestore})
		: _db = firestore ?? FirebaseFirestore.instance;

	DocumentReference<Map<String, dynamic>> _userDocRef(String uid) {
		return _db.collection('users').doc(uid);
	}

	CollectionReference<Map<String, dynamic>> _userNotesColRef(String uid) {
		return _userDocRef(uid).collection('notes');
	}

	Future<void> ensureUserDoc(User user) async {
		try {
			await _userDocRef(user.uid).set(
				{
					'uid': user.uid,
					'email': user.email,
					'displayName': user.displayName,
					'createdAt': FieldValue.serverTimestamp(),
					'updatedAt': FieldValue.serverTimestamp(),
				},
				SetOptions(merge: true),
			);
		} on FirebaseException catch (e) {
			print('$_serviceTag Caught exception during ensureUserDoc: $e');
		}
	}

	Future<List<Note>> fetchNotes(String uid) async {
		try {
			final QuerySnapshot<Map<String, dynamic>> snapshot =
					await _userNotesColRef(uid).get();

			return snapshot.docs.map((doc) {
				final data = doc.data();
				final title = data['title'] as String?;
				final content = (data['content'] as String?) ?? '';
				return Note.fromContent(id: doc.id, title: title, content: content);
			}).toList();
		} on FirebaseException catch (e) {
			print('$_serviceTag Caught exception during fetchNotes: $e');
			return <Note>[];
		}
	}

	Future<void> upsertNote(String uid, Note note) async {
		try {
			await _userNotesColRef(uid).doc(note.id).set(
				{
					'title': note.title,
					'content': note.content,
					'updatedAt': FieldValue.serverTimestamp(),
				},
				SetOptions(merge: true),
			);
		} on FirebaseException catch (e) {
			print('$_serviceTag Caught exception during upsertNote: $e');
		}
	}

	Future<void> deleteNote(String uid, String noteId) async {
		try {
			await _userNotesColRef(uid).doc(noteId).delete();
		} on FirebaseException catch (e) {
			print('$_serviceTag Caught exception during deleteNote: $e');
		}
	}
}
