// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:myecommercewebapp/widgets/responsive.dart';

class WeldingDetailsHeading extends StatelessWidget {
  const WeldingDetailsHeading({
    Key? key,
    required this.screenSize,
  }) : super(key: key);

  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget.isSmallScreen(context)
        ? Container(
            padding: EdgeInsets.only(
                top: screenSize.height / 20,
                bottom: screenSize.height / 20,
                right: screenSize.height / 20,
                left: screenSize.height / 20),
            width: screenSize.width,
            child: Text(
              'We provide Door Step services for Metal & Steel Fabrication and Repairs. Now Getting Welder at your Door Step is very easy.',
              textAlign: TextAlign.start,
              style: TextStyle(
                fontSize: 12,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        : Container(
            padding: EdgeInsets.only(
              top: screenSize.height / 10,
              bottom: screenSize.height / 15,
            ),
            width: screenSize.width,
            child: Text(
              'We provide Door Step services for Metal & Steel Fabrication and Repairs. Now Getting Welder at your Door Step is very easy.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.bold,
              ),
            ),
          );
  }
}