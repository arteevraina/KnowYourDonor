// Model for Seekers.
class Donor {
  Donor(
    this.name,
    this.address,
    this.bloodGroup,
    this.phoneNumber,
  );

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'address': address,
      'bloodGroup': bloodGroup,
      'phoneNumber': phoneNumber,
    };
  }

  final String name;
  final String address;
  final String bloodGroup;
  final int phoneNumber;
}
