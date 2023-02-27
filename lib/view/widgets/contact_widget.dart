import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mostalah/utils/app_layout.dart';


class ContactWidget extends StatelessWidget {
  const ContactWidget(
      {Key? key, required this.text, required this.icon, required this.label})
      : super(key: key);
  final IconData icon;
  final String text;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: AppLayout.getWidth(20)),
      child: Column(
        children: [
          //to keep the phone number in the correct format
          icon == Icons.phone
              ? TextField(
            controller: TextEditingController(text: text),
            readOnly: true,
            //add text direction and align
            textDirection: TextDirection.ltr,
            textAlign: TextAlign.end,
            decoration: InputDecoration(
              prefixIcon: Icon(
                icon,
                color: const Color(0xFFF15E90),
                size: AppLayout.getWidth(30),
              ),
              labelText: label,
              enabled: false,
              border: InputBorder.none,
              // contentPadding: EdgeInsets.only(top: 50),
              // icon: Icon(icon),
            ),
          )
              : TextField(
            controller: TextEditingController(text: text),
            readOnly: true,
            decoration: InputDecoration(
              prefixIcon: Icon(
                icon,
                color: const Color(0xFFF15E90),
                size: AppLayout.getWidth(30),
              ),
              labelText: label,
              enabled: false,
              border: InputBorder.none,
              // contentPadding: EdgeInsets.only(top: 50),
              // icon: Icon(icon),
            ),
          ),
          SizedBox(
            height: AppLayout.getHeight(7),
          ),
          label == 'الملف الشخصي على LinkedIn'
              ? const SizedBox.shrink()
              : Divider(
              height: AppLayout.getHeight(1),
              thickness: AppLayout.getHeight(2)),
        ],
      ),
    );
  }
}
