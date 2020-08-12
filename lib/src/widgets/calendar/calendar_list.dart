import 'package:flutter/material.dart';
import 'package:sisterhood/src/models/Date.dart';
import 'package:sisterhood/src/widgets/calendar/calendar_item.dart';
import 'package:supercharged/supercharged.dart';

class CalendarList extends StatefulWidget {
  final List<Date> data;

  CalendarList({this.data});

  @override
  _CalendarListState createState() => _CalendarListState(data: data);
}

class _CalendarListState extends State<CalendarList>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  final List<Date> data;
  double padding;

  _CalendarListState({this.data});

  @override
  void initState() {
    padding = 8.0;
    _controller = AnimationController(
      vsync: this,
    );
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void changePadding() {
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate((context, int index) {
        return Padding(
          padding: EdgeInsets.only(top: padding, left: 16.0, right: 16.0),
          child: CalendarItem(
            title: data[index].title,
            subTitle: data[index].subtitle,
            date: data[index].date.toDate().toString(),
            color: data[index].color.toColor(),
          ),
        );
      }, childCount: data.length),
    );
  }
}
