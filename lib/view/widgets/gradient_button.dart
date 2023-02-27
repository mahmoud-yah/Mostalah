import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mostalah/config/app_theme.dart';

class GradientButton extends StatelessWidget {
  const GradientButton({
    Key? key,
    required this.height,
    required this.width,
    required this.buttonGradient,
    required this.text,
    required this.textColor,
    required this.onTap,
  }) : super(key: key);
  final double height;
  final double width;
  final LinearGradient buttonGradient;
  final String text;
  final Color textColor;

  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        // padding: const EdgeInsets.only(top: 8.0),
        decoration: BoxDecoration(
          // gradient: Get.isDarkMode
          //     ? AppTheme.buttonGradientDark
          //     : AppTheme.buttonGradient,
          gradient: buttonGradient,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: textColor,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
