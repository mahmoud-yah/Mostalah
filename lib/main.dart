import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mostalah/Screens/navigation_screen.dart';
import 'package:mostalah/config/theme_setup.dart';

// import 'package:mostalah/config/theme_setup.dart';
import 'package:stacked_themes/stacked_themes.dart';

Future main() async {
  await ThemeManager.initialise();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  // final Controller ctrl = Get.find();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ThemeBuilder(
        defaultThemeMode: ThemeMode.system,
        // darkTheme: ,
        themes: getThemes(),
        builder: (context, regularTheme, darkTheme, themeMode) => GetMaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Mostalah',
              theme: regularTheme,
              darkTheme: darkTheme,
              // themeMode: themeMode,
              // darkTheme: darkTheme,
              themeMode: ThemeMode.system,
              home: const NavigationScreen(),
              textDirection: TextDirection.rtl,
            ));
  }
}
