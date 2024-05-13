import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DropDown extends StatefulWidget {
  String hintName;

  DropDown({Key? key, required this.hintName}) : super(key: key);

  @override
  DropDownPageState createState() => DropDownPageState();
}

class DropDownPageState extends State<DropDown> {
  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton<String>(
        hint: Text(
          widget.hintName,
          style: TextStyle(color: Colors.white),
        ),
        elevation: 5,
        borderRadius: BorderRadius.circular(25),
        style: TextStyle(
            fontSize: 18,
            color: Color.fromARGB(123, 82, 82, 82),
            fontWeight: FontWeight.w400),
        iconEnabledColor: Color(0xff525252),
        dropdownColor: Colors.white,
        items: <String>['A', 'B', 'C', 'D'].map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        onChanged: (_) {},
      ),
    );
  }
}
