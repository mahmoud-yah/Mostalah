import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    Key? key,
    required this.hintText,
    required this.controller,
    this.isDescription = false,
  }) : super(key: key);
  final TextEditingController controller;
  final String hintText;
  final bool isDescription;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12),
      child: isDescription
          ? TextField(
              controller: controller,
              decoration: InputDecoration(
                  hintText: hintText,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
              maxLines: 15,
              maxLength: 500,
            )
          : TextFormField(
              controller: controller,
              decoration: InputDecoration(
                  hintText: hintText,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
    );
  }
}
