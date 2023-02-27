import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mostalah/config/app_theme.dart';
import 'package:mostalah/utils/app_layout.dart';
import 'package:get/get.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: const Text('حول التطبيق'),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: Get.isDarkMode
                ? AppTheme.appBarGradientDark
                : AppTheme.appBarGradient,
          ),
        ),
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: AppLayout.getHeight(50),
            ),
            SizedBox(
                height: AppLayout.getHeight(150),
                child: Image.asset(
                  'assets/images/MostalahLogo.png',
                  fit: BoxFit.cover,
                )),
            SizedBox(
              height: AppLayout.getHeight(10),
            ),
            Text(
              'Mostalah',
              style: GoogleFonts.parisienne(
                  fontSize: 45, color: Color(0xFFF15E90)),
            ),
            SizedBox(
              height: AppLayout.getHeight(10),
            ),
            const Text(
              'Version 1.0.0',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(
              height: AppLayout.getHeight(30),
            ),
            const Text(
              'Created by',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(
              height: AppLayout.getHeight(15),
            ),
            // Text(
            //   'GiddyUp Applications',
            //   style: TextStyle(fontSize: AppLayout.getHeight(34), color: Colors.greenAccent.shade100),
            // ),
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/MahmoudLogo.png'),
                  fit: BoxFit.fitHeight,
                ),
              ),
              height: AppLayout.getHeight(150),
              width: AppLayout.getWidth(220),
            ),
            SizedBox(
              height: AppLayout.getHeight(40),
            ),
            // const Text(
            //   'This application only uses Google\'s Firebase Crashlytics and Analytics to resolve crashes and bugs. No other data is being collected.',
            //   style: TextStyle(fontSize: 16),
            //   textAlign: TextAlign.center,
            // ),
          ],
        ),
      ),
    );
  }
}
