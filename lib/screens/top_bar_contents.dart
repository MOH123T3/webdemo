// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:myecommercewebapp/features/home/ui/home.dart';

class TopBarContents extends StatefulWidget {
  final double opacity;
  final bool isFrom;
  TopBarContents(this.opacity, this.isFrom);

  @override
  _TopBarContentsState createState() => _TopBarContentsState();
}

class _TopBarContentsState extends State<TopBarContents> {
  final List _isHovering = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false
  ];

  List<String> titleName = <String>[
    "HOME",
    "SHUTTER",
    "METAL/IRON",
    "STAINLESS STEEL",
    "ALUMINIUM",
    "SHEDS",
    "METAL / STEEL FURNITURE",
    "HOME SERVICES",
    "CONTRACT SERVICES",
    "ABOUT US",
    "BLOG"
  ];

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Container(
      height: 75,
      color: Colors.black,
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return HomePage();
                  },
                ));
              },
              child: Animate(
                  effects: [FadeEffect(duration: 300.ms)],
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'WELDING WORKS',
                        style: TextStyle(
                          color: Colors.blueGrey.shade100,
                          fontSize: 20,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w400,
                          letterSpacing: 3,
                        ),
                      ),
                      SizedBox(
                        width: widget.isFrom == false ? 80 : 20,
                      ),
                      Image.asset(
                        'assets/welder.png',
                        color: Colors.blueGrey.shade100,
                        fit: BoxFit.cover,
                      )
                    ],
                  )),
            ),
            SizedBox(
              width: screenSize.width / 45,
            ),
            widget.isFrom == false
                ? Center()
                : Expanded(
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: titleName.length,
                        itemBuilder: (context, index) {
                          return Container(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            alignment: Alignment.center,
                            child: InkWell(
                              onHover: (value) {
                                setState(() {
                                  value
                                      ? _isHovering[index] = true
                                      : _isHovering[index] = false;
                                });
                              },
                              onTap: () {
                                _showAttach(
                                    context, screenSize, titleName[index]);
                              },
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        titleName[index],
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: _isHovering[index]
                                              ? Colors.blue
                                              : Colors.white,
                                        ),
                                      ),
                                      InkWell(
                                        onHover: (value) {
                                          setState(() {
                                            value
                                                ? _isHovering[index] = true
                                                : _isHovering[index] = false;
                                          });
                                          if (_isHovering[index] == true) {
                                            _showAttach(context, screenSize,
                                                titleName[index]);
                                          }
                                        },
                                        onTap: () {
                                          _showAttach(context, screenSize,
                                              titleName[index]);
                                        },
                                        child: Icon(
                                          Icons.keyboard_arrow_down_rounded,
                                          size: 20,
                                          color: _isHovering[index]
                                              ? Colors.blue
                                              : Colors.white,
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(height: 5),
                                  Visibility(
                                    maintainAnimation: true,
                                    maintainState: true,
                                    maintainSize: true,
                                    visible: _isHovering[index],
                                    child: Container(
                                      height: 2,
                                      width: 20,
                                      color: Colors.white,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        }),
                  ),
          ],
        ),
      ),
    );
  }

  void _showAttach(BuildContext ctx, screenSize, title) {
    //target widget
    SmartDialog.show(
      alignment: Alignment.topCenter,
      useSystem: true,
      onDismiss: () {},
      // displayTime: Duration(seconds: 4),
      builder: (_) {
        return Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            margin: EdgeInsets.only(top: screenSize.width / 20),
            height: screenSize.width / 5.3,
            width: screenSize.width / 1.6,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4), color: Colors.white),
            alignment: Alignment.center,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                    flex: 5,
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, childAspectRatio: 6 / 0.8),
                        itemCount: titleName.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onHover: (value) {
                              setState(() {
                                value
                                    ? _isHovering[index] = true
                                    : _isHovering[index] = false;
                              });
                            },
                            child: ListView(
                              physics: NeverScrollableScrollPhysics(),
                              children: [
                                Text(
                                  titleName[index],
                                  style: TextStyle(
                                    color: _isHovering[index]
                                        ? Colors.blue
                                        : Colors.black,
                                  ),
                                ),
                                SizedBox(
                                  height: screenSize.width / 320,
                                ),
                                Divider(),
                                SizedBox(
                                  height: screenSize.width / 320,
                                )
                              ],
                            ),
                          );
                        },
                      ),
                    )),
                Expanded(
                  flex: 2,
                  child: Image.asset(
                    'assets/metal-gate.jpg',
                    fit: BoxFit.fill,
                  ),
                ),
              ],
            ));
      },
    );
  }
}
