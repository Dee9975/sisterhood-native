import 'package:flutter/material.dart';
import 'package:sisterhood/style.dart';

class CalendarItem extends StatelessWidget {
  final Color color;
  final String date;
  final String title;
  final String subTitle;
  final bool firstItem;

  CalendarItem(
      {this.color = Colors.deepOrange,
      this.date,
      this.title,
      this.subTitle,
      this.firstItem = false})
      : assert(date != null && title != null);

  @override
  Widget build(BuildContext context) {
    if (firstItem) return BigCard(color: color, date: date, title: title, subTitle: subTitle);
    return SmallCard(title: title, date: date, color: color,);
  }
}

class SmallCard extends StatelessWidget {
  final Color color;
  final String date;
  final String title;

  SmallCard({this.date, this.title, this.color});

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
            Text(date),
            Text(
              title,
              style: Title2TextStyle,
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
      {this.color = Colors.deepOrange,
        this.date,
        this.title,
        this.subTitle})
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
            left: 16.0, top: 16.0, right: 16.0, bottom: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(date),
            Text(
              title,
              style: TitleTextStyle,
            ),
            Text(
              subTitle,
              style: Title2TextStyle,
            ),
          ],
        ),
      ),
    );
  }
}
