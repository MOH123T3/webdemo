// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Cw {
  static Text headingText(data) {
    return Text(
      data,
      style: const TextStyle(
        color: Colors.black,
        fontSize: 20,
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.w400,
        letterSpacing: 3,
      ),
    );
  }

  static Text subHeadingText(data) {
    return Text(
      data,
      style: TextStyle(
        color: Colors.blueGrey.shade400,
        fontSize: 15,
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.w400,
        letterSpacing: 3,
      ),
    );
  }

  static Text description(data) {
    return Text(
      data,
      style: TextStyle(
        color: Colors.blueGrey.shade400,
        fontSize: 15,
        fontFamily: 'Electrolize',
        fontWeight: FontWeight.normal,
      ),
    );
  }

  static Text descriptionText(data) {
    return Text(
      data,
      style: TextStyle(
        color: Colors.black,
        fontSize: 18,
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.normal,
      ),
      overflow: TextOverflow.clip,
    );
  }

  static Text whiteText(data) {
    return Text(
      data,
      style: TextStyle(
        color: Colors.white,
        fontSize: 12,
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.normal,
      ),
      overflow: TextOverflow.clip,
    );
  }

  static Text whiteHeadingText(data) {
    return Text(
      data,
      style: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.bold,
      ),
      overflow: TextOverflow.clip,
    );
  }

  static ElevatedButton commonButton(data) {
    return ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(Colors.black)),
        onPressed: () {},
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Text(
            data,
            style: TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.normal,
            ),
            overflow: TextOverflow.clip,
          ),
        ));
  }
}
