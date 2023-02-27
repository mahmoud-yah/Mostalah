import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mostalah/utils/app_layout.dart';

class CustomTextWithArrows extends StatelessWidget {
  const CustomTextWithArrows(
      {Key? key,
      required this.startText,
      required this.endText,
      required this.arrowIcon})
      : super(key: key);
  final String startText;
  final String endText;
  final IconData arrowIcon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          startText,
          style: TextStyle(fontSize: AppLayout.getHeight(22)),
        ),
        SizedBox(width: AppLayout.getWidth(5)),
        Transform.rotate(
            angle: 180 * pi / 180,
            child: Icon(
              arrowIcon,
              size: AppLayout.getHeight(35),
            )),
        SizedBox(width: AppLayout.getWidth(5)),
        Text(
          endText,
          style: TextStyle(fontSize: AppLayout.getHeight(22)),
        ),
      ],
    );
  }
}
