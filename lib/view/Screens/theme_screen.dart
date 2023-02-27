import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mostalah/config/app_theme.dart';
import 'package:mostalah/view/widgets/theme_option_widget.dart';

class ThemeScreen extends StatelessWidget {
  const ThemeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: const Text('اختار السمة'),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: Get.isDarkMode
                ? AppTheme.appBarGradientDark
                : AppTheme.appBarGradient,
          ),
        ),
      ),
      body: Column(
        children: [
          ThemeOptionWidget(
            text: 'فاتح',
            index: 0,
          ),
          ThemeOptionWidget(
            text: 'مظلم',
            index: 1,
          ),
        ],
      ),
    );
  }
}
