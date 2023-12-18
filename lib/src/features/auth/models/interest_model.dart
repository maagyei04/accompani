
import 'package:cloud_firestore/cloud_firestore.dart';

class InterestModel {
  final String? id;
  final List<String> interests;

  const InterestModel({
    this.id,
    required this.interests,
  });

  toJson() {
    return {
      "Interests": List<String>.from(interests),
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
  );
}


}
