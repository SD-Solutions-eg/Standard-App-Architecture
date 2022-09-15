import '../../../../MainImports/main_imports.dart';

class DrawerItem extends StatelessWidget {
  late IconData icons;
  late String value;
  late Function onPressed;

  DrawerItem({
    Key? key,
    required this.icons,
    required this.value,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
        InkWell(
          onTap: () {
            onPressed();
          },
          child: ListTile(
              visualDensity: const VisualDensity(horizontal: 0, vertical: -4),
              title: Row(
                children: [
                  Icon(
                    icons,
                    color: ColorManager.grayColor,
                  ),
                  AppSize.spaceWidth2(context),
                  Text(
                    value,
                    style: TextStyle(
                      color: ColorManager.grayColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              )),
        ),
        Divider(),
      ],
    );
  }
}
