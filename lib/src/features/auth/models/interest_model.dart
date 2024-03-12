
import 'package:cloud_firestore/cloud_firestore.dart';

class InterestModel {
  final String? id;
  final List<String> interests;
  final List<String> languages;
  final List<String> photos;
  final String bio;

  const InterestModel({
    this.id,
    required this.interests,
    required this.languages,
    required this.photos,
    required this.bio,
  });

  toJson() {
    return {
      "Interests": List<String>.from(interests),
      "Bio": bio,
      "Languages": List<String>.from(languages),
      "Photos": List<String>.from(photos),
    };
  }

factory InterestModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
  final data = document.data();

  return InterestModel(
    id: document.id,
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
    bio: 'Default..',  );
}


}
