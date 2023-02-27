import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mostalah/utils/app_layout.dart';
import 'package:mostalah/utils/custom_icons.dart';
import 'package:mostalah/view/widgets/contact_widget.dart';

import 'package:url_launcher/url_launcher.dart';

class ContactInfo extends StatelessWidget {
  const ContactInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          vertical: AppLayout.getHeight(12), horizontal: AppLayout.getWidth(5)),
      decoration: BoxDecoration(
        border: Border.all(
          color: Get.isDarkMode ? Colors.grey.shade700 : Colors.grey.shade300,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ContactWidget(
            text: 'Mahmoud Yahya',
            icon: Icons.person_outline,
            label: 'الإسم',
          ),
          InkWell(
            onTap: () {
              _email();
            },
            child: const ContactWidget(
              text: 'Mahmoudyah.my@gmail.com',
              icon: Icons.email_outlined,
              label: 'الإيميل',
            ),
          ),
          InkWell(
            onTap: () {
              _phone();
            },
            child: const ContactWidget(
              text: '+20 115 662 1140',
              icon: Icons.phone,
              label: 'رقم الهاتف',
            ),
          ),
          InkWell(
            onTap: () {
              _linkedin();
            },
            child: const ContactWidget(
              text: 'Linkedin.com/in/mahmoud-yah',
              icon: CustomIcons.linkedin_in,
              label: 'الملف الشخصي على LinkedIn',
            ),
          ),
          // SizedBox(height: AppLayout.getHeight(20),),
          // Divider(height: 1,thickness: AppLayout.getHeight(2),),
        ],
      ),
    );
  }

  _email() async {
    final Uri emailUri = Uri.parse('mailto:mahmoudyah.my@gmail.com');

    try {
      await launchUrl(emailUri);
    } on Exception catch (e) {
      return 'Could not send an email';
    }
  }

  _phone() async {
    final Uri phoneUri = Uri.parse('tel:+20-115-662-1140');

    try {
      await launchUrl(phoneUri);
    } on Exception catch (e) {
      return 'Could not dial the number';
    }
  }

  _linkedin() async {
    final Uri url = Uri.parse('https://www.linkedin.com/in/mahmoud-yah');

    try {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    } on Exception catch (e) {
      return 'Could not launch $url';
    }
  }
}
