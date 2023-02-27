import 'package:flutter/material.dart';
import 'package:mostalah/config/app_theme.dart';
import 'package:mostalah/utils/app_layout.dart';
import 'package:mostalah/view/widgets/gradient_button.dart';
import 'package:get/get.dart';

class MyCustomDialog extends StatelessWidget {
  const MyCustomDialog({Key? key, this.isError = false}) : super(key: key);
  final bool isError;

  // final String title;
  // final String bodyText;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            height: AppLayout.getHeight(250),
            padding: EdgeInsets.only(
                top: AppLayout.getHeight(60),
                left: AppLayout.getWidth(20),
                right: AppLayout.getWidth(20)),
            child: Column(
              children: [
                Text(
                  isError ? 'حدث خطأ ما' : 'تمت إضافة المقترح',
                  style: const TextStyle(fontSize: 25),
                ),
                SizedBox(
                  height: AppLayout.getHeight(10),
                ),
                Text(
                  isError
                      ? 'حدث خطأ ما تأكد من جودة إتصالك بالإنترنت و حاول مرة أخرى'
                      : 'تمت إضافة المصطلح إلى المصطلحات المقترحة و سيتم نشره بعد التحقق من صحته',
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: AppLayout.getHeight(20),
                ),
                GradientButton(
                    height: AppLayout.getHeight(35),
                    width: AppLayout.getWidth(60),
                    buttonGradient: isError
                        ? LinearGradient(colors: [
                            Colors.red.shade900,
                            Colors.red.shade600,
                          ])
                        : Get.isDarkMode
                            ? AppTheme.buttonGradientDark
                            : AppTheme.buttonGradient,
                    text: 'حسناً',
                    textColor: isError ? Colors.white : Colors.yellowAccent,
                    onTap: () {
                      Get.back();
                    }),
              ],
            ),
          ),
          Positioned(
            child: Container(
              height: AppLayout.getHeight(100),
              width: AppLayout.getWidth(100),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: isError
                    ? LinearGradient(
                        colors: [Colors.red.shade900, Colors.red.shade600])
                    : Get.isDarkMode
                        ? AppTheme.buttonGradientDark
                        : AppTheme.buttonGradient,
              ),
              child: Icon(
                isError ? Icons.close : Icons.check,
                size: AppLayout.getHeight(50),
                color: isError ? Colors.white : Colors.yellowAccent,
              ),
            ),
            top: AppLayout.getHeight(-50),
            left: AppLayout.getWidth(20),
            right: AppLayout.getWidth(20),
          ),
        ],
      ),
    );
  }
}
