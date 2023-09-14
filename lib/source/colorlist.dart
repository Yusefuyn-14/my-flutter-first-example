// ignore_for_file: no_leading_underscores_for_local_identifiers, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:testApp/entities/colour.dart';

class ColorList {
  static List<ColourObject> ColourList = [
    ColourObject('OzelKirmisi', Colors.red[300]!),
    ColourObject('OzelMavi', Colors.blue[300]!),
    ColourObject('OzelYesil', Colors.teal[800]!),
    ColourObject('OzelGrimsi', Colors.grey[800]!),
    ColourObject('OzelMavi2', Colors.blueGrey),
    ColourObject('OzelSiyah', Colors.black),
  ];

  static Color GetMyColour(String Name) {
    try {
      return ColourList.firstWhere((element) => element.Name == Name).Colour;
    } catch (e) {
      return Colors.black54;
    }
  }

  static bool AddMyColour(ColourObject obj) {
    try {
      ColourList.add(obj);
      return true;
    } catch (e) {
      return false;
    }
  }

  static bool AddMyColourNoObject(String _name, Color _color) {
    try {
      ColourList.add(ColourObject(_name, _color));
      return true;
    } catch (e) {
      return false;
    }
  }
}
