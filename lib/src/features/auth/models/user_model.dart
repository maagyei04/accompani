
import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String? id;
  final List<String> interests;
  final List<String> languages;
  final String firstName;
  final String lastName;
  final String email;
  final String phoneNumber;
  final List<String> photos;
  final String bio;
  final String password;


  const UserModel({
    this.id,
    required this.interests,
    required this.languages, 
    required this.photos, 
    required this.bio, 
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phoneNumber,
    required this.password,
  });

  toJson() {
    return {
      "FirstName": firstName,
      "LastName": lastName,
      "Email": email,
      "Phone": phoneNumber,
      "Bio": bio,
      "Password": password,
      "Interests": List<String>.from(interests),
      "Languages": List<String>.from(languages),
      "Photos": List<String>.from(photos),
    };
  }

factory UserModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
  final data = document.data();

  return UserModel(
    id: document.id,
    firstName: data?["FirstName"] ?? 'Default...',
    lastName: data?["LastName"] ?? 'Default...',
    email: data?["Email"] ?? 'Default...',
    phoneNumber: data?["Phone"] ?? 'Default...',
    bio: data?["Bio"] ?? 'Default...',
    interests: List<String>.from(data?["Interests"] ?? [
      'Default...',
      'Default...',
    ]),
    languages: List<String>.from(data?["Languages"] ?? [
      'Default...',
      'Default...',
    ]),
    photos: List<String>.from(data?["Photos"] ?? [
      'Default...',
      'Default...',
    ]), 
    password: 'Default..',
  );
}


}
