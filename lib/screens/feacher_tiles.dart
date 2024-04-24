// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:myecommercewebapp/screens/products.dart';
import 'package:myecommercewebapp/widgets/responsive.dart';

class FeaturedTiles extends StatefulWidget {
  FeaturedTiles({
    Key? key,
    required this.screenSize,
  }) : super(key: key);

  final Size screenSize;

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
                        Navigator.push(context,
                            MaterialPageRoute(builder: ((context) {
                          return ProductsScreen();
                        })));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: _isHovering[index]
                                ? BorderRadius.only(
                                    topLeft: Radius.circular(9),
                                    topRight: Radius.circular(9))
                                : BorderRadius.only(
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
                );
              },
            ),
          );
  }
}
