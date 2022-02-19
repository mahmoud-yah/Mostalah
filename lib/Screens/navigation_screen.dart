import 'package:flutter/material.dart';
import 'package:mostalah/Screens/add_terms_screen.dart';
import 'package:mostalah/Screens/main_screen.dart';
import 'package:mostalah/Screens/favorites_screen.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({Key? key}) : super(key: key);

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  final List<Widget> _screens = <Widget>[const MainScreen(),const AddTermsScreen(), FavoritesScreen()];

  int _selectedIndex = 0;

  void _onItemTapped(int index){
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
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
        ],
        // backgroundColor: Theme.of(context).primaryColor,
        // type: BottomNavigationBarType.shifting,
        // selectedFontSize: 15,
        // selectedIconTheme: IconThemeData(color: Colors.amberAccent),
        // selectedItemColor: Colors.amberAccent,
        // selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Theme.of(context).primaryColor,
      ),
      body: _screens.elementAt(_selectedIndex),
    );
  }
}
