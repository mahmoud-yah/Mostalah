import 'package:flutter/material.dart';
import 'package:stacked_themes/stacked_themes.dart';

class AddTermsScreen extends StatelessWidget {
  const AddTermsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('أضف مصطلح'),
        backgroundColor: Theme.of(context).primaryColor,
        centerTitle: true,
        elevation: 0,
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 12),
            child: TextField(
              decoration: InputDecoration(hintText: 'أضف المصطلح السوري'),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 12),
            child: TextField(
              decoration: InputDecoration(hintText: 'أضف المرادف المصري'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: ElevatedButton(
              onPressed: () {
                // getThemeManager(context).selectThemeAtIndex(2);
                getThemeManager(context).toggleDarkLightTheme();
              },
              child: const Text('أضف'),
              style: ElevatedButton.styleFrom(primary: Theme.of(context).primaryColor),
            ),
          )
        ],
      ),
    );
  }
}
