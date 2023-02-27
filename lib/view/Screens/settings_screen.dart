import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mostalah/config/app_theme.dart';
import 'package:mostalah/utils/custom_icons.dart';
import 'package:mostalah/view/Screens/about_screen.dart';
import 'package:mostalah/view/Screens/contact_us_screen.dart';
import 'package:mostalah/view/Screens/convertion_screen.dart';
import 'package:mostalah/view/Screens/privacy_policy_screen.dart';
import 'package:mostalah/view/Screens/theme_screen.dart';
import 'package:mostalah/view/widgets/settings_item.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: const Text('الإعدادات'),
        centerTitle: true,
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
          // SettingsItem(
          //   title: 'السمة',
          //   icon: Icons.color_lens_outlined,
          //   onTap: () {
          //     Get.to(() => const ThemeScreen());
          //   },
          // ),
          SettingsItem(
            title: 'جهة التحويل (مصري <=> سوري)',

            // icon: Icons.compare_arrows,
            // icon: Icons.multiple_stop,
            icon: CustomIcons.exchange_1,
            onTap: () {
              Get.to(() => const ConversionScreen());
            },
          ),
          SettingsItem(
            title: 'حول التطبيق',
            icon: Icons.info_outline,
            onTap: () {
              Get.to(() => const AboutScreen());
            },
          ),
          SettingsItem(
            title: 'سياسة الخصوصية',
            icon: Icons.privacy_tip_outlined,
            onTap: () async {
              final uri = Uri.parse(
                  'https://sites.google.com/view/sr-privacy-policy/home');
              try {
                await launchUrl(
                  uri,
                );
              } on Exception catch (e) {
                // return 'Could not launch $uri';
              }
            },
          ),
          SettingsItem(
            title: 'تواصل معنا',
            icon: Icons.phone_in_talk_outlined,
            onTap: () {
              Get.to(() => const ContactUsScreen());
            },
          ),
          SettingsItem(
            title: 'قيم التطبيق',
            icon: Icons.star_rate_outlined,
            onTap: () {},
          ),
        ],
      ),
    );
  }

  void openPrivacyPolicyUrl() async {
    final uri =
        Uri.parse('https://sites.google.com/view/sr-privacy-policy/home');
    try {
      await launchUrl(
        uri,
      );
    } on Exception catch (e) {
      // return 'Could not launch $uri';
    }
  }

  getCustomText(String start, String end, IconData icon) {
    return '$start ${Icon(icon)} $end';
  }
}
