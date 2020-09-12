import 'package:flutter/material.dart';
import 'package:sisterhood/style.dart';

class CalendarItem extends StatelessWidget {
  final Color color;
  final String date;
  final String title;
  final String subTitle;
  final bool firstItem;
  final String category;
  final String role;

  CalendarItem(
      {this.color = Colors.deepOrange,
      this.date,
      this.title,
      this.subTitle,
      this.category,
      this.role,
      this.firstItem = false})
      : assert(date != null && title != null);

  @override
  Widget build(BuildContext context) {
    if (firstItem)
      return BigCard(
          color: color, date: date, title: title, subTitle: subTitle);
    return SmallCard(
      title: title,
      date: date,
      color: color,
      category: category,
      role: role,
    );
  }
}

class SmallCard extends StatelessWidget {
  final Color color;
  final String date;
  final String title;
  final String category;
  final String role;

  SmallCard({this.date, this.title, this.color, this.category, this.role});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.only(
            left: 16.0, top: 16.0, right: 16.0, bottom: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Text(
                category.toUpperCase(),
                style: TextStyle(
                    letterSpacing: 1.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 10.0),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 5.0),
              child: Text(
                title,
                style: TextStyle(
                  fontFamily: FontNameDefault,
                  fontWeight: FontWeight.w600,
                  fontSize: MediumTextSize,
                  color: Colors.white,
                ),
              ),
            ),
            Text(
              role,
              style: TextStyle(
                fontFamily: FontNameDefault,
                fontWeight: FontWeight.w300,
                fontSize: 12.0,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BigCard extends StatelessWidget {
  final Color color;
  final String date;
  final String title;
  final String subTitle;

  BigCard(
      {this.color = Colors.deepOrange, this.date, this.title, this.subTitle})
      : assert(date != null && title != null);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.only(
            left: 16.0, top: 16.0, right: 16.0, bottom: 22.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontFamily: FontNameDefault,
                fontWeight: FontWeight.w600,
                fontSize: LargeTextSize,
                color: Colors.white,
              ),
            ),
            Text(
              subTitle,
              style: TextStyle(
                fontFamily: FontNameDefault,
                fontWeight: FontWeight.w600,
                fontSize: MediumTextSize,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
