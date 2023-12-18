
import 'package:cloud_firestore/cloud_firestore.dart';

class PersonalInfoModel {
  final String? id;
  final List<String> languages;
  final List<String> photos;
  final String bio;


  const PersonalInfoModel({
    this.id,
    required this.languages, 
    required this.photos, 
    required this.bio, 
  });

  toJson() {
    return {
      "Bio": bio,
      "Languages": List<String>.from(languages),
      "Photos": List<String>.from(photos),
    };
  }

factory PersonalInfoModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
  final data = document.data();

  return PersonalInfoModel(
    id: document.id,
    languages: List<String>.from(data?["Languages"] ?? [
      'Default...',
      'Default...',
    ]),
    photos: List<String>.from(data?["Photos"] ?? [
      'Default...',
      'Default...',
    ]), 
    bio: 'Default..',
  );
}


}
