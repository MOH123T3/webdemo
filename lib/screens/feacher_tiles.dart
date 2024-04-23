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
        ? Padding(
            padding: EdgeInsets.only(top: widget.screenSize.height / 50),
            child: SingleChildScrollView(
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
            ),
          )
        : Padding(
            padding: EdgeInsets.only(
              top: widget.screenSize.height * 0.06,
              left: widget.screenSize.width / 15,
              right: widget.screenSize.width / 15,
            ),
            child: GridView.builder(
              shrinkWrap: true,
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
              itemCount: assets.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    InkWell(
                      splashColor: Colors.transparent,
                      hoverColor: Colors.transparent,
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
                      child: SizedBox(
                        height: widget.screenSize.width / 6,
                        width: _isHovering[index]
                            ? widget.screenSize.width / 2.4
                            : widget.screenSize.width / 4.8,
                        child: ClipRRect(
                          borderRadius: _isHovering[index]
                              ? BorderRadius.circular(9.0)
                              : BorderRadius.circular(5.0),
                          child: Image.asset(
                            assets[index],
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: widget.screenSize.height / 70,
                      ),
                      child: Text(
                        title[index],
                        style: TextStyle(
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
