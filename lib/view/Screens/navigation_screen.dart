import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mostalah/config/app_theme.dart';
import 'package:mostalah/logic/controllers/settings_controller.dart';
import 'package:mostalah/view/Screens/add_terms_screen.dart';
import 'package:mostalah/view/Screens/main_screen.dart';
import 'package:mostalah/view/Screens/favorites_screen.dart';
import 'package:mostalah/logic/controllers/main_controller.dart';
import 'package:mostalah/view/Screens/settings_screen.dart';
import 'package:mostalah/view/widgets/custom_drawer.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({Key? key}) : super(key: key);

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  final controller = Get.put(MainController());

  // final settingsController = Get.put(SettingsController());
  final settingsController = Get.find<SettingsController>();
  final List<Widget> _screens = <Widget>[
    const MainScreen(),
    const AddTermsScreen(),
    FavoritesScreen(),
    const SettingsScreen(),
  ];

  // int _selectedIndex = 0;

  // void _onItemTapped(int index){
  //   setState(() {
  //     _selectedIndex = index;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          backgroundColor: Theme.of(context).backgroundColor,
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
              gradient: Get.isDarkMode
                  ? AppTheme.bottomNavigationBarGradientDark
                  : AppTheme.bottomNavigationBarGradient,
            ),
            child: BottomNavigationBar(
              selectedItemColor: Colors.yellow,
              unselectedItemColor: Colors.white,
              showUnselectedLabels: true,
              type: BottomNavigationBarType.fixed,
              // backgroundColor: Color(0xFFF15E90),
              backgroundColor: Colors.transparent,

              items: const [
                BottomNavigationBarItem(
                  label: 'الرئيسية',
                  icon: Icon(Icons.home),
                ),
                BottomNavigationBarItem(
                  label: 'اضافة مصطلح',
                  icon: Icon(Icons.add_box_outlined),
                ),
                BottomNavigationBarItem(
                  label: 'العناصر المحفوظة',
                  icon: Icon(Icons.favorite_border),
                ),
                BottomNavigationBarItem(
                  label: 'الإعدادات',
                  icon: Icon(Icons.settings),
                  // activeIcon: Icon(Icons.settings),
                ),
              ],
              // backgroundColor: Theme.of(context).primaryColor,
              // type: BottomNavigationBarType.shifting,
              // selectedFontSize: 15,
              // selectedIconTheme: IconThemeData(color: Colors.amberAccent),
              // selectedItemColor: Colors.amberAccent,
              // selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
              currentIndex: controller.selectedIndex.value,
              onTap: controller.changeIndex,
            ),
          ),
          body: _screens.elementAt(controller.selectedIndex.value),
        ));
  }
}
