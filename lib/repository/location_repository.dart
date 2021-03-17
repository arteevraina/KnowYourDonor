import 'package:geolocator/geolocator.dart';

/// Repository containing functions for communication with
/// [Cloud Firestore].
/// This class will help to fetch [Donor's] information.

class LocationRepository {
  Future<Position> getCurrentLocation() async {
    Position res = await Geolocator.getCurrentPosition();
    return res;
  }
}
