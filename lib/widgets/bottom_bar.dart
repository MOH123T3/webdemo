import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class HiddenBottomBar extends StatefulWidget {
  var isVisible;

  HiddenBottomBar({Key? key, required this.isVisible}) : super(key: key);

  @override
  HiddenBottomBarState createState() => new HiddenBottomBarState();
}

class HiddenBottomBarState extends State<HiddenBottomBar> {
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 50),
      height: widget.isVisible ? 60.0 : 0.0,
      child: widget.isVisible
          ? AnimatedContainer(
              duration: Duration(milliseconds: 50),
              height: widget.isVisible ? 60.0 : 0.0,
              child: widget.isVisible
                  ? Container(
                      width: MediaQuery.of(context).size.width,
                      color: Colors.blue,
                      child: Center(
                        child: Text("Bottom AppBar"),
                      ),
                    )
                  : Container(
                      color: Colors.white,
                      width: MediaQuery.of(context).size.width,
                    ),
            )
          : Container(
              color: Colors.transparent,
              width: MediaQuery.of(context).size.width,
            ),
    );
  }
}
