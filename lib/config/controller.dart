import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Controller extends GetxController {
 MaterialColor themePrimaryColor = Colors.green;

 void changeThemeColor(MaterialColor color){
   themePrimaryColor = color;
 }
}
