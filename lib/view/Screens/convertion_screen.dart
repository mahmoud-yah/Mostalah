import 'package:flutter/material.dart';
import 'package:mostalah/config/app_theme.dart';
import 'package:mostalah/view/widgets/conversion_option_widget.dart';
import 'package:get/get.dart';
import 'package:mostalah/view/widgets/custom_text_with_arrows.dart';

class ConversionScreen extends StatelessWidget {
  const ConversionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: const Text('اختار جهة التحويل'),
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
          ConversionOptionWidget(
            // text: 'سوري ==> مصري',
            text: CustomTextWithArrows(startText: 'سوري',endText: 'مصري',arrowIcon: Icons.arrow_right_alt_outlined),
            index: 0,
          ),
          ConversionOptionWidget(
            // text: 'مصري ==> سوري',
            text: CustomTextWithArrows(startText: 'مصري',endText: 'سوري',arrowIcon: Icons.arrow_right_alt_outlined),
            index: 1,
          ),
        ],
      ),
    );
  }
}
