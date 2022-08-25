import 'package:easy_localization/easy_localization.dart';
import 'package:get_storage/get_storage.dart';

import 'MainImports/main_imports.dart';
import 'Resources/routes_manager.dart';
import 'Service/dio_helper.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await GetStorage.init();
  await DioHelper.init();
  runApp(EasyLocalization(
    path: 'assets/translations',
    supportedLocales: const [
      Locale('ar'),
      Locale('en'),
    ],
    // assetLoader: const CodegenLoader(),
    fallbackLocale: const Locale('ar'),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Standard App Architecture',
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      // locale: const Locale('ar'),
      onGenerateRoute: RouteGenerator.getRoute,
      initialRoute: Routes.splashRoute,
      theme: ThemeData(
          primaryColor: ColorManager.orangeColor, fontFamily: 'Lato'),
    );
  }
}

