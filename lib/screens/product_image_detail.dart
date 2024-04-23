// ignore_for_file: unnecessary_new, prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductImageDetail extends StatelessWidget {
  const ProductImageDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return new Column(
        children: new List.generate(
      4,
      (index) => Padding(
        padding: const EdgeInsets.only(bottom: 8, right: 10, left: 10),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Image.asset(
            'assets/GardenPergola.jpg',
            height: 95,
            width: 100,
            fit: BoxFit.cover,
          ),
        ),
      ),
    ));
  }
}
