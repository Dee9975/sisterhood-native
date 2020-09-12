import 'package:flutter/material.dart';

class CustomSwitch extends StatefulWidget {
  final bool value;
  final ValueChanged<bool> onChanged;
  final Color activeColor;
  final Color inactiveColor;
  final String activeText;
  final String inactiveText;
  final Color activeTextColor;
  final Color inactiveTextColor;

  const CustomSwitch({
    Key key,
    this.value,
    this.onChanged,
    this.activeColor,
    this.inactiveColor = Colors.grey,
    this.activeText = 'On',
    this.inactiveText = 'Off',
    this.activeTextColor = Colors.white70,
    this.inactiveTextColor = Colors.white70})
      : super(key: key);

  @override
  _CustomSwitchState createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch>
    with SingleTickerProviderStateMixin {
  Animation _circleAnimation;
  AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 30));
    _circleAnimation = AlignmentTween(
        begin: widget.value ? Alignment.centerRight : Alignment.centerLeft,
        end: widget.value ? Alignment.centerLeft : Alignment.centerRight)
        .animate(CurvedAnimation(
        parent: _animationController, curve: Curves.linear));
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return GestureDetector(
          onTap: () {
            if (_animationController.isCompleted) {
              _animationController.reverse();
            } else {
              _animationController.forward();
            }
            widget.value == false
                ? widget.onChanged(true)
                : widget.onChanged(false);
          },
          child: Container(
            width: 70.0,
            height: 35.0,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                border: Border.all(color: Colors.black, width: 2.0)
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 1.0, bottom: 1.0, right: 1.0, left: 1.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  _circleAnimation.value == Alignment.centerRight
                      ? Padding(
                    padding: const EdgeInsets.only(left: 4.0, right: 4.0),
                    child: Text(
                      widget.activeText,
                      style: TextStyle(
                          color: widget.activeTextColor,
                          fontWeight: FontWeight.w900,
                          fontSize: 16.0),
                    ),
                  )
                      : Container(),
                  Align(
                    alignment: _circleAnimation.value,
                    child: Container(
                      width: 28.0,
                      height: 28.0,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.black),
                    ),
                  ),
                  _circleAnimation.value == Alignment.centerLeft
                      ? Padding(
                    padding: const EdgeInsets.only(left: 4.0, right: 5.0),
                    child: Text(
                      widget.inactiveText,
                      style: TextStyle(
                          color: widget.inactiveTextColor,
                          fontWeight: FontWeight.w900,
                          fontSize: 16.0),
                    ),
                  )
                      : Container(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}