

import '../../MainImports/main_imports.dart';

class DefaultButton extends StatelessWidget {
  Color? background;

  bool isWidget = true;
  final double radius = 5.0;
  double? btnWidth;
  double? btnHeight;

  final Function function;
  String? text;
  Widget? widget;
  double? fontSize;
  FontWeight? fontWeight;

  DefaultButton(
      {Key? key,
      required this.function,
      this.text,
      this.background,
      this.btnWidth,
      required this.isWidget,
      this.fontSize,
      this.fontWeight,
      this.btnHeight,
      this.widget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: btnHeight ?? height(context) * .07,
      width: btnWidth ?? width(context),
      // margin: EdgeInsets.symmetric(vertical: height(context) * .015),
      padding: EdgeInsets.symmetric(
          vertical: height(context) * .015, horizontal: width(context) * .02),
      child: MaterialButton(
        padding: EdgeInsets.zero,
        onPressed: () {
          function();
        },
        child: !isWidget
            ? widget
            : Text(
                text!,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: fontSize ?? FontSize.textHeader(context),
                    fontWeight: fontWeight),
              ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          radius,
        ),
        color: background,
      ),
    );
  }
}
