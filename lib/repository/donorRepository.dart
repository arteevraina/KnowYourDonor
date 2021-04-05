// Library imports.
import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// Local imports.
import 'package:knowyourdonor/models/Donor.dart';

/// Different Submission states.
enum SubmitState {
  NotSubmitted,
  Submitting,
  Submitted,
}

/// Repository containing functions for communication with
/// [Cloud Firestore].
class DonorRepository with ChangeNotifier {
  DonorRepository(this._firestore) : assert(_firestore != null);

  final FirebaseFirestore _firestore;

  SubmitState _state = SubmitState.NotSubmitted;

  SubmitState get state => _state;

  Future<bool> postDonor(Donor seeker) async {
    try {
      /// Converts seeker to Map using [toJson()] method and adds it
      /// to firebase while return the document refernece to [document].
      _state = SubmitState.Submitting;
      notifyListeners();

      await _firestore.collection('donors').add(seeker.toJson());

      _state = SubmitState.Submitted;
      notifyListeners();

      // If document gets successfully added return true.
      // Else return false.
      return true;
    } catch (e) {
      return false;
    }
  }

  Stream<QuerySnapshot> getDonors() {
    /// Gets the snapshots from [Cloud Firestore]
    /// and returns them as List.
    try {
      return _firestore.collection('donors').snapshots();
    } catch (e) {
      return null;
    }
  }

  Future<DocumentSnapshot> getDonorById(String id) async {
    /// Gets the document from [Cloud Firestore]
    /// and returns.
    try {
      return _firestore.collection('donors').doc(id).get();
    } catch (e) {
      return null;
    }
  }
}
