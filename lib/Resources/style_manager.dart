import 'package:flutter/cupertino.dart';

import 'font_manager.dart';

class StyleManager {
  static TextStyle mainText(context, color, {fontWeight}) {
    return TextStyle(
        fontSize: FontSize.textS18(context),
        color: color,
        fontWeight: fontWeight);
  }

  static TextStyle mainText20(context, color, {fontWeight}) {
    return TextStyle(
        fontSize: FontSize.textS20(context),
        color: color,
        fontWeight: fontWeight);
  }

  static TextStyle mainText14(context, color,{fontWeight}) {
    return TextStyle(
        fontSize: FontSize.textS14(context),
        color: color,
        fontWeight:fontWeight?? FontWeight.w700);
  }
  static TextStyle mainText16(context, color,{fontWeight}) {
    return TextStyle(
        fontSize: FontSize.textS16(context),
        color: color,
        fontWeight:fontWeight?? FontWeight.w700);
  }
  static TextStyle headerText(context, color) {
    return TextStyle(
        color: color,
        fontSize: FontSize.textHeader(context),
        fontWeight: FontWeight.w700);
  }
}
