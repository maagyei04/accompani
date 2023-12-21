
class UserModel2 {
  final String? id;
  final String firstName;
  final String lastName;
  final String phoneNumber;


  const UserModel2({
    this.id,
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
  });

  toJson() {
    return {
      "FirstName": firstName,
      "LastName": lastName,
      "Phone": phoneNumber,
    };
  }

}
