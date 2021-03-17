import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:knowyourdonor/models/Seeker.dart';

/// Different Submission states.
enum SubmitState {
  NotSubmitted,
  Submitting,
  Submitted,
}

/// Repository containing functions for communication with
/// [Cloud Firestore].
class SeekerRepository with ChangeNotifier {
  SeekerRepository(this._firestore) : assert(_firestore != null);

  final FirebaseFirestore _firestore;

  SubmitState _state = SubmitState.NotSubmitted;

  SubmitState get state => _state;

  Future<bool> postSeeker(Seeker seeker) async {
    try {
      /// Converts seeker to Map using [toJson()] method and adds it
      /// to firebase while return the document refernece to [document].
      _state = SubmitState.Submitting;
      notifyListeners();

      await _firestore.collection('seekers').add(seeker.toJson());

      _state = SubmitState.Submitted;
      notifyListeners();

      // If document gets successfully added return true.
      // Else return false.
      return true;
    } catch (e) {
      return false;
    }
  }

  Stream<QuerySnapshot> getSeekers() {
    /// Gets the snapshots from [Cloud Firestore]
    /// and returns them as List.
    try {
      return _firestore.collection('seekers').snapshots();
    } catch (e) {
      return null;
    }
  }

  Future<DocumentSnapshot> getSeekerById(String id) async {
    /// Gets the document from [Cloud Firestore]
    /// and returns.
    try {
      return _firestore.collection('seekers').doc(id).get();
    } catch (e) {
      return null;
    }
  }
}
