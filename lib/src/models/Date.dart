import 'package:cloud_firestore/cloud_firestore.dart';

class Date {
  String title;
  String subtitle;
  String color;
  String achievements;
  String description;
  String nationality;
  String quote;
  String role;
  String url;
  String category;
  Timestamp date;

  Date(
      {this.date,
      this.color,
      this.title,
      this.subtitle,
      this.achievements,
      this.description,
      this.nationality,
      this.quote,
      this.role,
      this.category,
      this.url});

  Date.fromJson(Map<String, dynamic> json) {
    title = json["title"];
    subtitle = json["subtitle"];
    date = json["date"];
    color = json["color"];
    achievements = json["achievements"];
  }

  Date.fromSnapshot(DocumentSnapshot documentSnapshot)
      : title = documentSnapshot.data()["title"],
        subtitle = documentSnapshot.data()["subtitle"],
        date = documentSnapshot.data()["date"],
        color = documentSnapshot.data()["color"],
        achievements = documentSnapshot.data()["achievements"]?? "",
        description = documentSnapshot.data()["description"]?? "",
        nationality = documentSnapshot.data()["nationality"]?? "",
        quote = documentSnapshot.data()["quote"],
        role = documentSnapshot.data()["role"],
        url = documentSnapshot.data()["url"],
        category = documentSnapshot.data()["category"]?? "science";
}
