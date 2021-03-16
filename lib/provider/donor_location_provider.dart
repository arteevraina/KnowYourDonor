import 'package:geolocator/geolocator.dart';

/// Repository containing functions for communication with
/// [Cloud Firestore].
/// This class will help to fetch [Donor's] information.

class DonorLocationRepository {
  Future<Position> getCurrentLocation() async {
    Position res = await Geolocator.getCurrentPosition();
    return res;
  }
}
