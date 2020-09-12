import 'package:flutter/material.dart';
import 'package:sisterhood/src/widgets/settings/custom_switch.dart';

class SettingsScreen extends StatefulWidget {
  SettingsScreen({Key key}) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<SettingsScreen> {
  bool value = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 24.0, left: 24.0, bottom: 48.0),
                    child: GestureDetector(
                      child: Image.asset("assets/images/back@2x.png", width: 50, height: 50,),
                      onTap: () => Navigator.pop(context),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 24.0, left: 24.0, right: 24.0, bottom: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Should we notify you?", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),),
                        CustomSwitch(
                          value: value,
                          onChanged: (v) => setState(() => value = v),
                          activeColor: Colors.black,
                        )
                      ],
                    ),
                  ),
                  Divider(color: Colors.black, thickness: 0.5, indent: 24.0, endIndent: 24.0,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0, ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Read about us:", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),),
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Icon(Icons.arrow_forward_ios, size: 16.0,),
                        )
                      ],
                    ),
                  ),
                  Divider(color: Colors.black, thickness: 0.5, indent: 24.0, endIndent: 24.0,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0, ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Give us feedback:", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),),
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Icon(Icons.arrow_forward_ios, size: 16.0,),
                        )
                      ],
                    ),
                  ),
                  Divider(color: Colors.black, thickness: 0.5, indent: 24.0, endIndent: 24.0,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0, ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Follow us here:", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),),
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right:24.0),
                                child: Image.asset("assets/images/twitter.png", width: 35,),
                              ),
                              Image.asset("assets/images/instagram.png", width: 35,)
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}