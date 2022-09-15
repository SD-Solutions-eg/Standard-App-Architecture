// ignore_for_file: must_be_immutable

import '../../MainImports/main_imports.dart';

class DefaultButton extends StatelessWidget {
  Color? background;
  Color? textColor;

  bool isWidget = true;
  double? radius;

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
        this.textColor,
        required this.isWidget,
        this.fontSize,
        this.fontWeight,
        this.radius,
        this.btnHeight,
        this.widget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: btnHeight ?? height(context) * .08,
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
              color: textColor ?? Colors.white,
              fontSize: fontSize ?? FontSize.textHeader(context),
              fontWeight: fontWeight),
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          radius ?? 10.0,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.15),
            spreadRadius: 2,
            blurRadius: 4,
            offset: const Offset(0, 3), //
          )
        ],
        gradient: LinearGradient(
            colors: [
              background ?? ColorManager.primaryColor,
              background ?? ColorManager.orangeColor,
            ],
            stops: const [
              0.0,
              0.8
            ],
            begin: FractionalOffset.topLeft,
            end: FractionalOffset.bottomRight,
            tileMode: TileMode.repeated),
        color: background,
      ),
    );
  }
}
