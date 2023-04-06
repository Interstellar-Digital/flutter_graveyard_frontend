import 'package:flutter/material.dart';

FloatingActionButton AddGrave() {
  return FloatingActionButton(
    backgroundColor: Color.fromRGBO(6, 208, 111, 1),
    child: Text(
      '+Add',
      textAlign: TextAlign.center,
      style: TextStyle(color: Colors.black),
    ),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    onPressed: () {}, //add person to grave list
  );
}
