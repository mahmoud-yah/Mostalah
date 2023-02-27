import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mostalah/config/app_theme.dart';
import 'package:mostalah/logic/controllers/settings_controller.dart';
import 'package:mostalah/models/term.dart';
import 'package:mostalah/utils/app_layout.dart';

class TermScreen extends StatelessWidget {
  final Term term;
  final bool isSyrian;

  // final settingsController = Get.find<SettingsController>();

  const TermScreen({
    Key? key,
    required this.term,
    required this.isSyrian,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: Get.isDarkMode
                ? AppTheme.appBarGradientDark
                : AppTheme.appBarGradient,
          ),
        ),
        elevation: 0,
      ),
      body: Column(
        children: [
          Container(
            // height: MediaQuery.of(context).size.height * 0.15,
            height: AppLayout.getHeight(120),
            width: double.infinity,
            // color: Theme.of(context).primaryColor,
            color:
                Get.isDarkMode ? Colors.red.shade900 : const Color(0xFFF15E90),
            // decoration: BoxDecoration(
            //   gradient: Get.isDarkMode
            //       ? AppTheme.buttonGradientDark
            //       : AppTheme.buttonGradient,
            // ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  isSyrian ? term.syrianTerm : term.egyptianTerm,
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 28,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: double.infinity,
            // color: Colors.yellowAccent,
            // padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  color: Get.isDarkMode
                      ? Colors.purple.shade400
                      : Colors.grey.shade300,
                  // decoration: const BoxDecoration(
                  //   gradient: LinearGradient(
                  //       begin: Alignment.centerRight,
                  //       end: Alignment.centerLeft,
                  //       colors: [Colors.red, Colors.purpleAccent]),
                  // ),
                  height: AppLayout.getHeight(120),
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          const Text(
                            'المرادف: ',
                            style: TextStyle(fontSize: 20),
                          ),
                          Text(
                            isSyrian ? term.egyptianTerm : term.syrianTerm,
                            style: const TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(AppLayout.getHeight(20)),
                  height: AppLayout.getHeight(200),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          const Text(
                            'الوصف: ',
                            style: TextStyle(fontSize: 20),
                          ),
                          Text(
                            term.termDescription,
                            style: TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
