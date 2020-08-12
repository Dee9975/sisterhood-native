import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sisterhood/src/models/Date.dart';
import 'package:sisterhood/src/models/animations.dart';
import 'package:sisterhood/src/widgets/calendar/calendar_item.dart';
import 'package:sisterhood/style.dart';
import 'package:supercharged/supercharged.dart';
import 'package:intl/intl.dart';

class Calendar extends StatefulWidget {
  Calendar({Key key}) : super(key: key);

  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  List<Date> data;
  double padding;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
        stream: Firestore.instance.collection("dates").snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text("Error: ${snapshot.error}");
          }
          switch (snapshot.connectionState) {
            case ConnectionState.waiting: return Center(child: CircularProgressIndicator(),);
            default:
                List<Date> data = snapshot.data.documents.map((DocumentSnapshot document) {
                  return Date.fromSnapshot(document);
                }).toList();
              return SafeArea(
                child: ChangeNotifierProvider.value(
                  value: Animations(false),
                  child: Builder(
                    builder: (context) {
                      return NotificationListener<ScrollNotification>(
                        onNotification: (notification) {
                          if (notification is ScrollStartNotification) {
                            Provider.of<Animations>(context, listen: false).isScrolling = true;
                          } else if (notification is ScrollEndNotification) {
                            Provider.of<Animations>(context, listen: false).isScrolling = false;
                          }
                          return true;
                        },
                        child: CustomScrollView(
                          physics: RangeMaintainingScrollPhysics(),
                          slivers: [
                            TopBar(),
                            SliverList(
                              delegate: SliverChildBuilderDelegate((context, int index) {
                                return AnimatedPadding(
                                  duration: 0.3.seconds,
                                  curve: Curves.bounceInOut,
                                  padding: EdgeInsets.only(top: Provider.of<Animations>(context).padding, left: 16.0, right: 16.0),
                                  child: CalendarItem(
                                    firstItem: index == 0,
                                    title: data[index].title,
                                    subTitle: data[index].subtitle,
                                    date: DateFormat.MMMMd().format(data[index].date.toDate()),
                                    color: data[index].color.toColor(),
                                  ),
                                );
                              }, childCount: data.length),
                            )
                          ],
                        ),
                      );
                    },
                  ),
                ),
              );
          }
        }
      ),
    );
  }
}

class TopBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding:
        const EdgeInsets.only(left: 16.0, top: 24.0, right: 16.0, bottom: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Calendar",
              style: TitleTextStyle,
            ),
            Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: 36,
                    height: 36,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(360),
                        color: "#ededed".toColor()),
                  ),
                  Icon(Icons.settings, size: 30,),
                ]),
          ],
        ),
      ),
    );
  }
}