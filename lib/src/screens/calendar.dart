import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:sisterhood/src/models/Date.dart';
import 'package:sisterhood/src/models/animations.dart';
import 'package:sisterhood/src/screens/person_details.dart';
import 'package:sisterhood/src/screens/settings.dart';
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
          stream: FirebaseFirestore.instance.collection("dates").snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return Text("Error: ${snapshot.error}");
            }
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return Center(
                  child: CircularProgressIndicator(),
                );
              default:
                List<Date> data =
                    snapshot.data.docs.map((DocumentSnapshot document) {
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
                              Provider.of<Animations>(context, listen: false)
                                  .isScrolling = true;
                            } else if (notification is ScrollEndNotification) {
                              Provider.of<Animations>(context, listen: false)
                                  .isScrolling = false;
                            }
                            return true;
                          },
                          child: CustomScrollView(
                            physics: RangeMaintainingScrollPhysics(),
                            slivers: [
                              TopBar(),
                              SliverToBoxAdapter(
                                child: Padding(
                                  padding: const EdgeInsets.only(bottom: 42.0),
                                  child: Container(
                                    padding: EdgeInsets.only(left: 28.0),
                                    width: MediaQuery.of(context).size.width,
                                    height: 44.0,
                                    child: ListView(
                                      shrinkWrap: true,
                                      scrollDirection: Axis.horizontal,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(right: 8.0),
                                          child: GestureDetector(
                                            onTap: () => print("all"),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color: Colors.black,
                                                borderRadius: BorderRadius.circular(10.0)
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 12.0, ),
                                                child: Text("All", style: TextStyle(color: Colors.white, fontSize: 14.0),),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(right: 8.0),
                                          child: GestureDetector(
                                            onTap: () => print("Science"),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color: "#e2e2e2".toColor(),
                                                borderRadius: BorderRadius.circular(10.0)
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsets.all(12.0),
                                                child: Row(
                                                  children: [
                                                    Padding(
                                                      padding: const EdgeInsets.only(right: 2.0),
                                                      child: SvgPicture.asset("assets/images/science.svg"),
                                                    ),
                                                    Text("Science", style: TextStyle(color: Colors.black, fontSize: 14.0),),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(right: 8.0),
                                          child: GestureDetector(
                                            onTap: () => print("all"),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  color: "#e2e2e2".toColor(),
                                                  borderRadius: BorderRadius.circular(10.0)
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsets.all(12.0),
                                                child: Row(
                                                  children: [
                                                    Padding(
                                                      padding: const EdgeInsets.only(right: 2.0),
                                                      child: SvgPicture.asset("assets/images/culture.svg"),
                                                    ),
                                                    Text("Culture", style: TextStyle(color: Colors.black, fontSize: 14.0),),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(0.0),
                                          child: GestureDetector(
                                            onTap: () => print("all"),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  color: "#e2e2e2".toColor(),
                                                  borderRadius: BorderRadius.circular(10.0)
                                              ),
                                              child: Padding(
                                                padding: const EdgeInsets.all(12.0),
                                                child: Row(
                                                  children: [
                                                    Padding(
                                                      padding: const EdgeInsets.only(right: 4.0),
                                                      child: SvgPicture.asset("assets/images/politics.svg"),
                                                    ),
                                                    Text("Politics", style: TextStyle(color: Colors.black, fontSize: 14.0),),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              SliverList(
                                delegate: SliverChildBuilderDelegate(
                                    (context, int index) {
                                  return AnimatedPadding(
                                    duration: 0.25.seconds,
                                    curve: Curves.bounceInOut,
                                    padding: EdgeInsets.only(
                                        top: Provider.of<Animations>(context)
                                            .padding,
                                        left: 28.0,
                                        right: 28.0),
                                    child: GestureDetector(
                                      onTap: () {
                                        Navigator.push(context,
                                            MaterialPageRoute(
                                                builder: (context) {
                                          return PersonDetails(
                                              data: data[index]);
                                        }));
                                      },
                                      child: CalendarItem(
                                        title: data[index].title,
                                        subTitle: data[index].subtitle,
                                        category: data[index].category,
                                        role: data[index].role?? "Inspiration",
                                        date: DateFormat.MMMMd()
                                            .format(data[index].date.toDate()),
                                        color: data[index].color.toColor(),
                                      ),
                                    ),
                                  );
                                }, childCount: data.length),
                              ),
                              // SliverToBoxAdapter(
                              //   child: SizedBox(height: 16.0,),
                              // )
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                );
            }
          }),
    );
  }
}

class TopBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(
            left: 28.0, top: 32.0, right: 28.0, bottom: 30.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Sisterhood",
              style: TitleTextStyle,
            ),
            GestureDetector(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SettingsScreen(),
                  )),
              child: Stack(alignment: Alignment.center, children: [
                Container(
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(360),
                      color: "#ededed".toColor()),
                ),
                Icon(
                  Icons.settings,
                  size: 25,
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
