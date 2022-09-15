import '../../../MainImports/main_imports.dart';
import 'Components/drawer_item.dart';

class DrawerScreen extends StatelessWidget {
  const DrawerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              AppSize.spaceHeight6(context),
              DrawerItem(
                onPressed: () {
                  // Navigation.navigateWithName(
                  //     context, Routes.statisticScreenRoute);
                },
                icons: Icons.stacked_line_chart,
                value: "Statistics",
              ),
              DrawerItem(
                onPressed: () {},
                icons: Icons.mail_rounded,
                value: "Help Center ",
              ),
              DrawerItem(
                onPressed: () {},
                icons: Icons.star_rate_outlined,
                value: "Rate the app",
              ),
              DrawerItem(
                onPressed: () {},
                icons: Icons.logout,
                value: "Logout",
              ),
              AppSize.spaceHeight12(context),
              AppSize.spaceHeight12(context),

            ],
          ),
        ),
      ),
    );
  }
}
