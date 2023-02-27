import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mostalah/config/app_theme.dart';
import 'package:mostalah/utils/app_layout.dart';
import 'package:mostalah/view/widgets/contact_info.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: const Text('تواصل معنا'),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: Get.isDarkMode
                ? AppTheme.appBarGradientDark
                : AppTheme.appBarGradient,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: AppLayout.getHeight(250),
              width: double.infinity,
              // margin: EdgeInsets.only(top: AppLayout.getHeight(50)),
              padding: EdgeInsets.all(AppLayout.getHeight(10)),
              // child: Image(image: Get.isDarkMode?const AssetImage('assets/images/Contact-darker.jpg'):const AssetImage('assets/images/contact-us.png'),fit: BoxFit.fitWidth),
              child: const Image(
                  image: AssetImage('assets/images/contact-us.png'),
                  fit: BoxFit.fitWidth),
            ),
            SizedBox(
              height: AppLayout.getHeight(35),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: AppLayout.getWidth(10)),
                  child: Text(
                    'معلومات المطور',
                    style: TextStyle(
                      color: Get.isDarkMode
                          ? Colors.grey.shade400
                          : Colors.grey.shade600,
                    ),
                  ),
                ),
                SizedBox(
                  height: AppLayout.getHeight(10),
                ),
                const ContactInfo(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
