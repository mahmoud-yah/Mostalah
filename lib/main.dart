import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mostalah/Screens/navigation_screen.dart';
// import 'package:mostalah/config/theme_setup.dart';

// import 'package:mostalah/config/theme_setup.dart';
import 'package:stacked_themes/stacked_themes.dart';

Future main() async {
  await ThemeManager.initialise();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // final Controller ctrl = Get.find();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mostalah',
      themeMode: ThemeMode.system,
      home: NavigationScreen(),
      textDirection: TextDirection.rtl,
    );
  }
}
