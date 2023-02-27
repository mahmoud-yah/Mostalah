import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mostalah/config/app_theme.dart';
import 'package:mostalah/utils/app_layout.dart';
import 'package:mostalah/view/Screens/about_screen.dart';
import 'package:mostalah/view/Screens/contact_us_screen.dart';
import 'package:mostalah/view/Screens/convertion_screen.dart';
import 'package:mostalah/view/Screens/privacy_policy_screen.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        decoration: BoxDecoration(gradient: AppTheme.buttonGradient),
        child: ListView(
          children: [
            // Container(
            //   decoration: const BoxDecoration(
            //     image: DecorationImage(
            //       image: AssetImage('assets/images/MostalahLogo.png'),
            //       fit: BoxFit.fitHeight,
            //     ),
            //   ),
            //   height: AppLayout.getHeight(120),
            // ),
            // SizedBox(
            //   height: AppLayout.getHeight(50),
            // ),
            Center(
              child: Text(
                'Mostalah',
                style: GoogleFonts.parisienne(
                  fontSize: 45,
                  color: Colors.yellowAccent,
                ),
              ),
            ),
            SizedBox(
              height: AppLayout.getHeight(30),
            ),
            ListTile(
              leading: const Icon(
                Icons.compare_arrows,
                color: Colors.yellowAccent,
              ),
              title: const Text(
                'جهة التحويل (مصري <=> سوري)',
                style: TextStyle(color: Colors.yellowAccent),
              ),
              onTap: () => Get.to(() => const ConversionScreen()),
            ),
            ListTile(
              leading: const Icon(
                Icons.info_outline,
                color: Colors.yellowAccent,
              ),
              title: const Text(
                'حول التطبيق',
                style: TextStyle(color: Colors.yellowAccent),
              ),
              onTap: () => Get.to(() => const AboutScreen()),
            ),
            ListTile(
              leading: const Icon(
                Icons.privacy_tip_outlined,
                color: Colors.yellowAccent,
              ),
              title: const Text(
                'سياسة الخصوصية',
                style: TextStyle(color: Colors.yellowAccent),
              ),
              onTap: () => Get.to(() => const PrivacyPolicyScreen()),
            ),
            ListTile(
              leading: const Icon(
                Icons.phone_in_talk_outlined,
                color: Colors.yellowAccent,
              ),
              title: const Text(
                'تواصل معنا',
                style: TextStyle(color: Colors.yellowAccent),
              ),
              onTap: () => Get.to(() => const ContactUsScreen()),
            ),
            const ListTile(
              leading: Icon(
                Icons.star_rate_outlined,
                color: Colors.yellowAccent,
              ),
              title: Text(
                'قيم التطبيق',
                style: TextStyle(color: Colors.yellowAccent),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
