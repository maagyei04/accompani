
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserModel {
  final String? id;
  final String? userId;
  final List<String> interests;
  final List<String> languages;
  final String firstName;
  final String lastName;
  final String email;
  final String phoneNumber;
  final List<String> photos;
  final String bio;
  final String password;
  final String? userType;
  final String? priceTag;
  final String? location;
  final List<String>? paymentMethods;


  const UserModel({
    this.id,
    this.userId,
    required this.interests,
    required this.languages, 
    required this.photos, 
    required this.bio, 
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phoneNumber,
    required this.password,
    this.userType,
    this.priceTag,
    this.location,
    this.paymentMethods,
  });

  toJson() {
    return {
      "UserId": FirebaseAuth.instance.currentUser!.uid,
      "UserType": 'Guest',
      "FirstName": firstName,
      "LastName": lastName,
      "Email": email,
      "Phone": phoneNumber,
      "Bio": bio,
      "Password": password,
      "Interests": List<String>.from(interests),
      "Languages": List<String>.from(languages),
      "Photos": List<String>.from(photos),
      "PriceTag": priceTag,
      "Location": location,
      "PaymentMethods": paymentMethods,
    };
  }

factory UserModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
  final data = document.data();

  return UserModel(
    id: document.id,
    userType: data?["UserType"] ?? 'Default...',
    userId: data?["UserId"] ?? 'Default...',
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
    priceTag: data?["PriceTag"] ?? 'Default..',
    location: data?["Location"] ?? 'Default...',
    paymentMethods: List<String>.from("Paymentmethods" as Iterable),
  );
}


}
