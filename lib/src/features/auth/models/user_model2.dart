
import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel2 {
  final String? id;
  final String firstName;
  final String lastName;
  final String email;


  const UserModel2({
    this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
  });

  toJson() {
    return {
      "FirstName": firstName,
      "LastName": lastName,
      "Email": email,
    };
  }

}
