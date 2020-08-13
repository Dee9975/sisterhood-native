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
      bottomNavigationBar: BottomAppBar(
        color: Colors.transparent,
        elevation: 0,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              ButtonTheme(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(60),
                ),
                child: FlatButton(
                  color: Colors.black,
                  onPressed: () => print("Hello"),
                  child: Text("Read on wiki", style: TextStyle(color: Colors.white),),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: ButtonTheme(
                  minWidth: 40,
                  shape: CircleBorder(

                  ),
                  child: FlatButton(
                    color: Colors.black,
                    onPressed: () => print("Hello"),
                    child: Icon(Icons.share, color: Colors.white,)
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverPersistentHeader(
            delegate: Header(data: data),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(
                  top: 24.0, left: 16.0, right: 16.0, bottom: 16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      padding: EdgeInsets.only(top: 8.0),
                      child: RichText(
                        text: TextSpan(children: [
                          TextSpan(
                              text: "Nationality: ",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          TextSpan(text: data.nationality),
                        ], style: TextStyle(color: Colors.black, height: 1.5)),
                      )),
                  Container(
                      padding: EdgeInsets.only(top: 8.0),
                      child: RichText(
                        text: TextSpan(children: [
                          TextSpan(
                              text: "Achievements: ",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          TextSpan(text: data.achievements),
                        ], style: TextStyle(color: Colors.black, height: 1.5)),
                      )),
                  Container(
                      padding: EdgeInsets.only(top: 8.0),
                      child: RichText(
                        text: TextSpan(children: [
                          TextSpan(
                              text: "Quote: ",
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          TextSpan(text: data.quote),
                        ], style: TextStyle(color: Colors.black, height: 1.5)),
                      )),
                  Container(
                      padding: EdgeInsets.only(top: 8.0),
                      child: RichText(
                        text: TextSpan(children: [
                          TextSpan(text: data.description),
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
  double get maxExtent => 340.0;
  @override
  double get minExtent => 200.0;
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final Color color = data.color.toColor();
        final double percentage =
            (constraints.maxHeight - minExtent) / (maxExtent - minExtent);

        return Container(
          decoration: BoxDecoration(color: color),
          height: constraints.maxHeight,
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(left: 24.0, top: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    child: Container(height: 30.0,child: Icon(Icons.arrow_back)),
                    onTap: () => Navigator.pop(context),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16.0, top: 16.0),
                    child: Text(
                      DateFormat.yMMMd().format(data.date.toDate()),
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(bottom: 8.0),
                      height: 50.0,
                      child: Image.asset("assets/images/icon_crown.png")),
                  Text(data.role),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Text(
                      data.title,
                      style: TitleTextStyle,
                    ),
                  ),
                  Text("10/01/1914 - 13/09/1944")
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
