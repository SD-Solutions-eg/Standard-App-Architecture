import 'package:flutter/material.dart';

//Here is the magic extension that makes this happen:
//you can use this for padding any widget with children if you want any time any way
extension WithPadding on List<Widget> {
  List<Widget> padded(EdgeInsets padding) {
    return map((_) => _ is OverrideListPadding
        ? _
        : Padding(padding: padding, child: _))
        .toList();
  }
}

class OverrideListPadding extends StatelessWidget {
  final Widget child;
  const OverrideListPadding({Key? key, required this.child}) :  super(key: key);
  @override
  Widget build(BuildContext context) {
    return child;
  }
}
extension WithOverrideListPadding on Widget {
  Widget overridePadding() {
    return OverrideListPadding(child: this);
  }
}