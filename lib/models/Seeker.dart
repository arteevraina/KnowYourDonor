// Model for Seekers.
class Seeker {
  Seeker(
    this.name,
    this.address,
    this.bloodGroup,
    this.units,
    this.phoneNumber,
  );

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'address': address,
      'bloodGroup': bloodGroup,
      'units': units,
      'phoneNumber': phoneNumber,
    };
  }

  final String name;
  final String address;
  final String bloodGroup;
  final int units;
  final int phoneNumber;
}
