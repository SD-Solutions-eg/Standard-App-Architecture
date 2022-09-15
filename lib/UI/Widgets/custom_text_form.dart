import '../../MainImports/main_imports.dart';

class MyTextForm extends StatelessWidget {
  final String label;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final String? title;
  final double fileWidth;
  bool? isPassword = false;
  IconData? suffix;
  final Function? suffixPressed;
  String? Function()? validate;
  Function()? onTap;
  Function(String?)? onChanged;
  Iterable<String>? autofillHints;
  String? errorText;
  final Widget? prefixIcon;

  MyTextForm(
      {this.controller,
      Key? key,
      this.errorText,
      this.validate,
      this.keyboardType,
      this.title,
      this.suffixPressed,
      this.isPassword,
      this.suffix,
      this.prefixIcon,
      this.onTap,
      this.onChanged,
      this.autofillHints,
      required this.fileWidth,
      required this.label})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: height(context) * 0.015,
        ),
        SizedBox(
          width: fileWidth,
          child: TextFormField(
            controller: controller,
            obscureText: isPassword!,
            autocorrect: true,
            autofillHints: autofillHints,
            onChanged: onChanged,
            textInputAction: TextInputAction.next,
            onEditingComplete: () => FocusScope.of(context).nextFocus(),
            validator: (String? value) {
              validate!();
              if (value!.isEmpty) {
                return "لا يجب ان يكون الحقل فارغً !";
              }
              if (validate != null) {
                return validate!();
              }
              return null;
            },
            keyboardType: keyboardType,
            onTap: onTap,
            decoration: InputDecoration(
              errorText: errorText,
              suffixIcon: suffix != null
                  ? IconButton(
                      onPressed: () {
                        suffixPressed!();
                      },
                      icon: Icon(
                        suffix,
                        color: ColorManager.blueTxtColor,
                      ))
                  : null,
              prefixIcon: prefixIcon,
              contentPadding: EdgeInsets.symmetric(
                  horizontal: height(context) * .015,
                  vertical: height(context) * .005),
              fillColor: Colors.transparent,
              filled: true,
              enabledBorder: UnderlineInputBorder(
                borderSide:
                    BorderSide(color: ColorManager.blueTxtColor, width: 1),
              ),
              errorBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: ColorManager.error,
                  width: 1,
                ),
              ),
              label: Text(label,
                  style: StyleManager.mainText20(
                      context, ColorManager.blueTxtColor)),
              hintStyle: TextStyle(
                  color: ColorManager.blueTxtColor,
                  fontSize: FontSize.textS20(context)),
              helperStyle: TextStyle(
                  color: ColorManager.blueTxtColor,
                  fontSize: FontSize.textS20(context)),
              //           labelStyle: TextStyle(
              //           color: ColorManager.blueTxtColor,
              // fontSize: FontSize.textS20(context)),
            ),
          ),
        ),
      ],
    );
  }
}
