import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mostalah/config/app_theme.dart';
import 'package:mostalah/data/constants.dart';
import 'package:mostalah/models/term.dart';
import 'package:mostalah/utils/app_layout.dart';
import 'package:mostalah/view/widgets/custom_drawer.dart';
import 'package:mostalah/view/widgets/custom_text_field.dart';
import 'package:mostalah/view/widgets/gradient_button.dart';
import 'package:mostalah/view/widgets/my_custom_dialog.dart';

class AddTermsScreen extends StatefulWidget {
  const AddTermsScreen({Key? key}) : super(key: key);

  @override
  State<AddTermsScreen> createState() => _AddTermsScreenState();
}

TextEditingController egController = TextEditingController();
TextEditingController syController = TextEditingController();
TextEditingController descriptionController = TextEditingController();
FirebaseFirestore db = FirebaseFirestore.instance;

class _AddTermsScreenState extends State<AddTermsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawer: CustomDrawer(),
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: const Text('أضف مصطلح'),
        backgroundColor: Theme.of(context).primaryColor,
        centerTitle: true,
        elevation: 0,
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
          children: [
            SizedBox(height: AppLayout.getHeight(8)),
            CustomTextFormField(
              controller: syController,
              hintText: 'أضف المصطلح السوري',
            ),
            CustomTextFormField(
              controller: egController,
              hintText: 'أضف المرادف المصري',
            ),
            CustomTextFormField(
              controller: descriptionController,
              hintText: 'أضف شرح بسيط عن المصطلح (اختياري)',
              isDescription: true,
            ),
            // Container(
            //   height: 37,
            //   // padding: const EdgeInsets.only(top: 8.0),
            //   decoration: BoxDecoration(
            //       gradient: buttonGradient,
            //       borderRadius: BorderRadius.circular(10)),
            //   child: ElevatedButton(
            //     onPressed: () {
            //       final data = {
            //         egyptianTermColumn: egController.text,
            //         syrianTermColumn: syController.text,
            //         termDescriptionColumn: descriptionController.text,
            //       };
            //       // db.collection('new_terms').add(data);
            //       egController.clear();
            //       syController.clear();
            //       descriptionController.clear();
            //
            //       showDialog(
            //         context: context,
            //         builder: (context) => const MyCustomDialog(),
            //       );
            //       FocusScope.of(context).unfocus();
            //     },
            //     child: const Text('أضف'),
            //     style: ElevatedButton.styleFrom(
            //       backgroundColor: Colors.transparent,
            //
            //       // foregroundColor: Colors.black,
            //     ),
            //   ),
            // ),
            GradientButton(
              height: AppLayout.getHeight(40),
              width: AppLayout.getWidth(70),
              text: 'إضافة',
              textColor: Colors.yellowAccent,
              buttonGradient: Get.isDarkMode
                  ? AppTheme.buttonGradientDark
                  : AppTheme.buttonGradient,
              onTap: () {
                final data = {
                  egyptianTermColumn: egController.text,
                  syrianTermColumn: syController.text,
                  termDescriptionColumn: descriptionController.text,
                };
                db
                    .collection('new_terms')
                    .add(data)
                    .then((value) => showDialog(
                          context: context,
                          builder: (context) =>
                              const MyCustomDialog(isError: false),
                        ))
                    .catchError((error) {
                  showDialog(
                    context: context,
                    builder: (context) => const MyCustomDialog(isError: true),
                  );
                });
                egController.clear();
                syController.clear();
                descriptionController.clear();

                FocusScope.of(context).unfocus();
              },
            ),
          ],
        ),
      ),
    );
  }
}
