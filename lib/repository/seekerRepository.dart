import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:knowyourdonor/models/Seeker.dart';

/// Repository containing functions for communication with
/// [Cloud Firestore].
class SeekerRepository {
  SeekerRepository(this._firestore) : assert(_firestore != null);

  final FirebaseFirestore _firestore;

  Future<bool> postSeeker(Seeker seeker) async {
    try {
      /// Converts seeker to Map using [toJson()] method and adds it
      /// to firebase while return the document refernece to [document].
      await _firestore.collection('seekers').add(seeker.toJson());

      // If document gets successfully added return true.
      // Else return false.
      return true;
    } catch (e) {
      return false;
    }
  }

  Stream<List<Seeker>> getSeekers() {
    /// Gets the snapshots from [Cloud Firestore]
    /// and return them as List.
    try {
      return _firestore.collection('seekers').snapshots().map((snapshot) {
        return snapshot.docs
            .map(
              (document) => Seeker(
                document['name'],
                document['address'],
                document['bloodGroup'],
                document['units'],
                document['phoneNumber'],
              ),
            )
            .toList();
      });
    } catch (e) {
      return null;
    }
  }
}
