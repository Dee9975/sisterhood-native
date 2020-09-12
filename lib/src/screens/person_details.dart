import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sisterhood/src/models/Date.dart';
import 'package:sisterhood/style.dart';
import 'package:supercharged/supercharged.dart';

class PersonDetails extends StatefulWidget {
  final Date data;
  PersonDetails({Key key, @required this.data}) : super(key: key);

  @override
  _PersonDetailsState createState() => _PersonDetailsState(data: data);
}

class _PersonDetailsState extends State<PersonDetails> {
  final Date data;
  _PersonDetailsState({@required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        elevation: 0,
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40), topRight: Radius.circular(40)),
              color: Colors.black),
          height: 111.0,
          child: Center(
            child: Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(360),
                  color: Colors.white),
              child: Icon(
                Icons.play_arrow,
                size: 28,
              ),
            ),
          ),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverPersistentHeader(
            pinned: true,
            floating: true,
            delegate: Header(data: data),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(
                  top: 24.0, left: 32.0, right: 32.0, bottom: 16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      padding: EdgeInsets.only(top: 8.0),
                      child: RichText(
                        text: TextSpan(
                            children: [
                              TextSpan(
                                  text: "NATIONALITY\n",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 2.0,
                                      fontSize: 12.0)),
                              TextSpan(text: data.nationality),
                            ],
                            style: TextStyle(
                                color: Colors.black,
                                height: 1.5,
                                fontSize: 16.0)),
                      )),
                  Container(
                      padding: EdgeInsets.only(top: 26.0),
                      child: RichText(
                        text: TextSpan(
                            children: [
                              TextSpan(
                                  text: "ACHIEVEMENTS\n",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12.0,
                                      letterSpacing: 2.0)),
                              TextSpan(text: data.achievements),
                            ],
                            style: TextStyle(
                                color: Colors.black,
                                height: 1.5,
                                fontSize: 16.0)),
                      )),
                  Container(
                      padding: EdgeInsets.only(top: 24.0),
                      child: RichText(
                        text: TextSpan(
                            children: [
                              TextSpan(text: data.description),
                            ],
                            style: TextStyle(
                                color: Colors.black,
                                height: 1.5,
                                fontSize: 16.0)),
                      )),
                  Container(
                      padding: EdgeInsets.only(top: 26.0),
                      child: RichText(
                        text: TextSpan(children: [
                          TextSpan(
                              text: "QUOTE\n",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 2.0)),
                          TextSpan(text: data.quote),
                        ], style: TextStyle(color: Colors.black, height: 1.5)),
                      )),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class Header extends SliverPersistentHeaderDelegate {
  final Date data;
  Header({@required this.data});

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate _) => true;
  @override
  double get maxExtent => 360.0;
  @override
  double get minExtent => 150.0;
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    double opacity = 1.0;
    return LayoutBuilder(
      builder: (context, constraints) {
        final Color color = data.color.toColor();
        final double percentage =
            (constraints.maxHeight - minExtent) / (maxExtent - minExtent);
        return Container(
          decoration: BoxDecoration(color: color),
          height: constraints.maxHeight,
          child: SafeArea(
            child: SingleChildScrollView(
              child: Stack(children: [
                Positioned(
                  bottom: 0,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(40.0), topRight: Radius.circular(40.0)),
                    ),
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 24.0, left: 32, right: 32),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        child: Container(
                            height: 30.0, child: Icon(Icons.arrow_back)),
                        onTap: () => Navigator.pop(context),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 52.0, top: 16.0),
                        child: Opacity(
                          opacity: percentage,
                          child: Text(
                            data.category.toUpperCase(),
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                letterSpacing: 2.0,
                                fontSize: 12.0),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Opacity(
                          opacity: percentage,
                          child: Text(
                            data.title,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 32.0,
                                color: Colors.white),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 24.0),
                        child: Opacity(
                          opacity: percentage,
                          child: Text(
                            data.role,
                            style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      ),
                      Opacity(
                        opacity: percentage,
                        child: Text(
                          "10/01/1914 - 13/09/1944",
                          style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ]),
            ),
          ),
        );
      },
    );
  }
}
