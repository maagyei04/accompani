
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class TripModel {
  final String? userId;
  final String activity;
  final List<String> guestAdded;
  final String arrivalDate;
  final String cost;
  final String description;
  final String destination;
  final String duration;
  final String host;
  final String purpose;
  final String status;
  final String title;


  const TripModel({
    this.userId,
    required this.activity,
    required this.guestAdded,
    required this.arrivalDate, 
    required this.cost, 
    required this.description, 
    required this.duration,
    required this.host,
    required this.purpose,
    required this.status,
    required this.title,
    required this.destination,
  });

  toJson() {
    return {
      "UserId": FirebaseAuth.instance.currentUser!.uid,
      "Activity": activity,
      "ArrivalDate": arrivalDate,
      "Cost": cost,
      "Description": description,
      "Duration": duration,
      "Host": host,
      "Purpose": purpose,
      "Status": status,
      "GuestAdded": List<String>.from(guestAdded),
      "Title": title,
      "Destination": destination,
    };
  }

factory TripModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
  final data = document.data();

  return TripModel(
    userId: document.id,
    activity: data?["UserType"] ?? 'Default...',
    arrivalDate: data?["UserId"] ?? 'Default...',
    cost: data?["FirstName"] ?? 'Default...',
    description: data?["LastName"] ?? 'Default...',
    duration: data?["Email"] ?? 'Default...',
    host: data?["Phone"] ?? 'Default...',
    purpose: data?["Bio"] ?? 'Default...',
    guestAdded: List<String>.from(data?["Interests"] ?? [
      'Default...',
      'Default...',
    ]),
    status: 'Default..',
    title: data?["PriceTag"] ?? 'Default..',
    destination: data?["Location"] ?? 'Default...',
    );
}


}
