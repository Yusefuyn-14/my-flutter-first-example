// ignore_for_file: prefer_const_constructors, prefer_interpolation_to_compose_strings, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:testApp/source/colorlist.dart';
import 'package:testApp/source/lingualist.dart';

class StringToIconConverter extends StatelessWidget {
  final String iconString;

  StringToIconConverter(this.iconString, {super.key});

  @override
  Widget build(BuildContext context) {
    final Map<String, IconData> iconMap = {
      'star': Icons.star,
      'favorite': Icons.favorite,
      'home': Icons.home,
      'business': Icons.business,
      'map': Icons.map,
      'delete': Icons.delete,
      'add': Icons.add,
      'edit': Icons.edit,
      'person': Icons.person,
      'push_pin': Icons.push_pin,
    };
    if (iconMap.containsKey(iconString)) {
      return Icon(
        iconMap[iconString],
        color: ColorList.GetMyColour('OzelKirmisi'),
      );
    } else {
      return Text(WordList.GetWord('icon_not_found'));
    }
  }
}
