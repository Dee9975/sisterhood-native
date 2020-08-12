import 'package:cloud_firestore/cloud_firestore.dart';

class Date {
  String title;
  String subtitle;
  String color;
  Timestamp date;

  Date({this.date, this.color, this.title, this.subtitle});

  Date.fromJson(Map<String, dynamic> json) {
    title = json["title"];
    subtitle = json["subtitle"];
    date = json["date"];
    color = json["color"];
  }

  Date.fromSnapshot(DocumentSnapshot documentSnapshot)
    : title = documentSnapshot.data["title"],
      subtitle = documentSnapshot.data["subtitle"],
      date = documentSnapshot.data["date"],
      color = documentSnapshot.data["color"];
}