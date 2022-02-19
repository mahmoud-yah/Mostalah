import 'package:flutter/material.dart';
import 'package:mostalah/config/database.dart';
import 'package:mostalah/models/term.dart';

class AddTermsScreen extends StatefulWidget {
  const AddTermsScreen({Key? key}) : super(key: key);

  @override
  State<AddTermsScreen> createState() => _AddTermsScreenState();
}

TextEditingController egController = TextEditingController();
TextEditingController syController = TextEditingController();

class _AddTermsScreenState extends State<AddTermsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('أضف مصطلح'),
        backgroundColor: Theme.of(context).primaryColor,
        centerTitle: true,
        elevation: 0,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12),
            child: TextField(
              controller: syController,
              decoration: const InputDecoration(hintText: 'أضف المصطلح السوري'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12),
            child: TextField(
              controller: egController,
              decoration: const InputDecoration(hintText: 'أضف المرادف المصري'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: ElevatedButton(
              onPressed: () {
                Term term = Term(
                  syrianTerm: syController.text,
                  egyptianTerm: egController.text,
                  isFavorite: true,
                );
                DBProvider.db.insertTerm(term);
                egController.clear();
                syController.clear();
                ScaffoldMessenger.of(context).showSnackBar(
                   SnackBar(
                    content: const Text('تم إضافة المصطلح بنجاح!'),
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                );
                FocusScope.of(context).unfocus();
              },
              child: const Text('أضف'),
              style: ElevatedButton.styleFrom(
                  primary: Theme.of(context).primaryColor),
            ),
          )
        ],
      ),
    );
  }
}
