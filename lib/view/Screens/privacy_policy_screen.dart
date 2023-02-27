import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mostalah/config/app_theme.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: const Text('سياسة الخصوصية'),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: Get.isDarkMode
                ? AppTheme.appBarGradientDark
                : AppTheme.appBarGradient,
          ),
        ),
      ),
    );
  }
}
