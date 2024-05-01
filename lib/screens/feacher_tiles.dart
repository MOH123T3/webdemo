// ignore_for_file: prefer_const_constructors, must_be_immutable, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:myecommercewebapp/widgets/responsive.dart';

class FeaturedTiles extends StatefulWidget {
  final Size screenSize;
  double height;  
  ScrollController controller;
  FeaturedTiles(
      {Key? key,
      required this.screenSize,
      required this.controller,
      required this.height})
      : super(key: key);

  @override
  State<FeaturedTiles> createState() => _FeaturedTilesState();
}

class _FeaturedTilesState extends State<FeaturedTiles> {
  final List _isHovering = [false, false, false, false, false];

  final List<String> assets = [
    'assets/GardenPergola.jpg',
    'assets/furniture.jpg',
    'assets/AluminiumWorks.jpg',
    'assets/Shutter.jpg',
    'assets/sheds.jpg',
  ];

  final List<String> title = [
    'Garden Pergola',
    'Metal/Sheet Furniture',
    'Aluminium Works',
    'Shutter',
    'Sheds',
  ];

  void animateToIndex(int index) {
    widget.controller.animateTo(
      index * widget.height,
      duration: Duration(seconds: 2),
      curve: Curves.fastOutSlowIn,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget.isSmallScreen(context)
        ? SingleChildScrollView(
            padding: EdgeInsets.zero,
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(width: widget.screenSize.width / 15),
                ...Iterable<int>.generate(assets.length).map(
                  (int pageIndex) => Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: widget.screenSize.width / 2.5,
                            width: widget.screenSize.width / 1.5,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(5.0),
                              child: Image.asset(
                                assets[pageIndex],
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              top: widget.screenSize.height / 70,
                            ),
                            child: Text(
                              title[pageIndex],
                              style: TextStyle(
                                fontSize: 16,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: widget.screenSize.width / 15),
                    ],
                  ),
                ),
              ],
            ),
          )
        : Padding(
            padding: EdgeInsets.only(
              left: widget.screenSize.width / 15,
              right: widget.screenSize.width / 15,
            ),
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, childAspectRatio: 2 / 1.6),
              shrinkWrap: true,
              itemCount: assets.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    InkWell(
                      onHover: (value) {
                        setState(() {
                          value
                              ? _isHovering[index] = true
                              : _isHovering[index] = false;
                        });
                      },
                      onTap: () {
                        if (index == 0) {
                          animateToIndex(12);
                        } else if (index == 1) {
                          animateToIndex(22);
                        } else if (index == 2) {
                          animateToIndex(33);
                        } else if (index == 3) {
                          animateToIndex(43);
                        } else if (index == 4) {
                          animateToIndex(53);
                        }

                        // Navigator.push(context,
                        //     MaterialPageRoute(builder: ((context) {
                        //   return ProductsScreen();
                        // })));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(5),
                                topRight: Radius.circular(5)),
                            image: DecorationImage(
                                image: AssetImage(assets[index]),
                                fit: BoxFit.cover),
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: _isHovering[index] ? 10 : 0,
                                  blurStyle: BlurStyle.solid),
                            ]),
                        height: widget.screenSize.width / 6,
                        width: _isHovering[index]
                            ? widget.screenSize.width / 3
                            : widget.screenSize.width / 4,
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(9),
                            bottomRight: Radius.circular(9)),
                      ),
                      width: _isHovering[index]
                          ? widget.screenSize.width / 3
                          : widget.screenSize.width / 4,
                      padding: EdgeInsets.only(
                        top: widget.screenSize.height / 70,
                        bottom: widget.screenSize.height / 70,
                      ),
                      child: Text(
                        title[index],
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ).animate().flipH(duration: 600.ms).then(delay: 200.ms);
              },
            ),
          );
  }
}
