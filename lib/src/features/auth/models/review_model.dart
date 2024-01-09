import 'package:cloud_firestore/cloud_firestore.dart';


class ReviewModel {
  final String description;
  final DateTime time;
  final String reviewerId;
  final String reviewId;


  const ReviewModel({
    required this.description,
    required this.time,
    required this.reviewerId,
    required this.reviewId,
  });

  toJson() {
    return {
      'ReviewId': reviewId,
      'Description': description,
      'ReviewerId': reviewerId,
      'Time': time.millisecondsSinceEpoch,
    };
  }

  factory ReviewModel.fromMap(Map<String, dynamic> map) {
    return ReviewModel(
      description: map['Description'],
      reviewId: map['ReviewId'],
      reviewerId: map['ReviewerId'],
      time: DateTime.fromMillisecondsSinceEpoch(
        (map['Time'] as int),
      ),
    );
  }   

  factory ReviewModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data();
    return ReviewModel(
      description: data?['Description'],
      reviewId: data?['ReviewId'],
      reviewerId: data?['ReviewerId'],
      time: DateTime.fromMillisecondsSinceEpoch(
        (data?['Time'] as int),
      ),
    );
  } 
}