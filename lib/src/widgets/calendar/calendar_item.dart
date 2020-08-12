import 'package:flutter/material.dart';
import 'package:sisterhood/style.dart';

class CalendarItem extends StatelessWidget {
  final Color color;
  final String date;
  final String title;
  final String subTitle;

  CalendarItem({this.color = Colors.deepOrange, this.date, this. title, this.subTitle}) : assert(date != null && title != null);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 16.0, top: 16.0, right: 16.0, bottom: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(date),
            Text(title, style: TitleTextStyle,),
            Text(subTitle, style: Title2TextStyle,),
          ],
        ),
      ),
    );
  }
}
