import 'package:flutter/material.dart';

class Walkthrough extends StatefulWidget {
  final image;
  Walkthrough({this.image});

  @override
  WalkthroughState createState() {
    return WalkthroughState();
  }
}

class WalkthroughState extends State<Walkthrough>
    with SingleTickerProviderStateMixin {
  Animation animation;
  AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 19));
    animation = Tween(begin: -250.0, end: 0.0).animate(
        CurvedAnimation(parent: animationController, curve: Curves.easeInOut));

    animation.addListener(() => setState(() {}));

    animationController.forward();
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
        padding: EdgeInsets.all(20.0),
        child: Material(
          animationDuration: Duration(milliseconds: 19),
          elevation: 2.0,
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              new Transform(
                  transform:
                      new Matrix4.translationValues(animation.value, 0.0, 0.0),
                  child: new Image(image: widget.image)),
            ],
          ),
        ));
  }
}
