// ignore_for_file: file_names, no_leading_underscores_for_local_identifiers, non_constant_identifier_names

import 'package:flutter/material.dart';

class PageModel {
  PageModel(
      int _index, String _title, Widget _widget, Color _color, String _icon) {
    pIcon = _icon;
    Index = _index;
    title = _title;
    widget = _widget;
    color = _color;
  }

  late String pIcon;
  late int Index;
  late String title;
  late Widget widget;
  late Color color;
}
