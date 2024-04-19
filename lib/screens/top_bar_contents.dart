// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';

import '../widgets/dropdownButton.dart';

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
    false
  ];

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return PreferredSize(
      preferredSize: Size(screenSize.width, 1000),
      child: Container(
        color: widget.isFrom == true
            ? Colors.black
            : Colors.black.withOpacity(widget.opacity),
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
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
              Expanded(
                child: widget.isFrom == true
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(width: screenSize.width / 8),
                          DropDown(
                            hintName: 'Home',
                          ),
                          SizedBox(width: screenSize.width / 30),
                          DropDown(
                            hintName: 'Shop',
                          ),
                          SizedBox(width: screenSize.width / 30),
                          DropDown(
                            hintName: 'Stores',
                          ),
                          SizedBox(width: screenSize.width / 30),
                          DropDown(
                            hintName: 'Pages',
                          ),
                          SizedBox(width: screenSize.width / 30),
                          DropDown(
                            hintName: 'Account',
                          ),
                          Spacer(),
                          Icon(
                            Icons.search,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Icon(
                            Icons.location_on_sharp,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Icon(
                            Icons.add_shopping_cart_rounded,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Icon(
                            Icons.person,
                            color: Colors.white,
                          ),
                        ],
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(width: screenSize.width / 8),
                          InkWell(
                            onHover: (value) {
                              setState(() {
                                value
                                    ? _isHovering[0] = true
                                    : _isHovering[0] = false;
                              });
                            },
                            onTap: () {},
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'Discover',
                                  style: TextStyle(
                                    color: _isHovering[0]
                                        ? Colors.blue.shade200
                                        : Colors.white,
                                  ),
                                ),
                                SizedBox(height: 5),
                                Visibility(
                                  maintainAnimation: true,
                                  maintainState: true,
                                  maintainSize: true,
                                  visible: _isHovering[0],
                                  child: Container(
                                    height: 2,
                                    width: 20,
                                    color: Colors.white,
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(width: screenSize.width / 20),
                          InkWell(
                            onHover: (value) {
                              setState(() {
                                value
                                    ? _isHovering[1] = true
                                    : _isHovering[1] = false;
                              });
                            },
                            onTap: () {},
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'Contact Us',
                                  style: TextStyle(
                                    color: _isHovering[1]
                                        ? Colors.blue[200]
                                        : Colors.white,
                                  ),
                                ),
                                SizedBox(height: 5),
                                Visibility(
                                  maintainAnimation: true,
                                  maintainState: true,
                                  maintainSize: true,
                                  visible: _isHovering[1],
                                  child: Container(
                                    height: 2,
                                    width: 20,
                                    color: Colors.white,
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(width: screenSize.width / 20),
                          InkWell(
                            onHover: (value) {
                              setState(() {
                                value
                                    ? _isHovering[2] = true
                                    : _isHovering[2] = false;
                              });
                            },
                            onTap: () {},
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'Sign Up',
                                  style: TextStyle(
                                    color: _isHovering[2]
                                        ? Colors.blue[200]
                                        : Colors.white,
                                  ),
                                ),
                                SizedBox(height: 5),
                                Visibility(
                                  maintainAnimation: true,
                                  maintainState: true,
                                  maintainSize: true,
                                  visible: _isHovering[2],
                                  child: Container(
                                    height: 2,
                                    width: 20,
                                    color: Colors.white,
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(width: screenSize.width / 20),
                          InkWell(
                            onHover: (value) {
                              setState(() {
                                value
                                    ? _isHovering[3] = true
                                    : _isHovering[3] = false;
                              });
                            },
                            onTap: () {},
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'Login',
                                  style: TextStyle(
                                    color: _isHovering[3]
                                        ? Colors.blue[200]
                                        : Colors.white,
                                  ),
                                ),
                                SizedBox(height: 5),
                                Visibility(
                                  maintainAnimation: true,
                                  maintainState: true,
                                  maintainSize: true,
                                  visible: _isHovering[3],
                                  child: Container( 
                                    height: 2,
                                    width: 20,
                                    color: Colors.white,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
