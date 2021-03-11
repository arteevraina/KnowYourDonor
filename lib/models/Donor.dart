// Model for Seekers.
class Donor {
  Donor(
    this.name,
    this.address,
    this.bloodGroup,
    this.phoneNumber,
    this.lat,
    this.long,
  );

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'address': address,
      'bloodGroup': bloodGroup,
      'phoneNumber': phoneNumber,
      'latitude': lat,
      'longitude': long,
    };
  }

  final String name;
  final String address;
  final String bloodGroup;
  final int phoneNumber;
  final double lat;
  final double long;
}
