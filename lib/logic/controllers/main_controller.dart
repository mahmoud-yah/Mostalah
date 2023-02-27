import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mostalah/config/database.dart';
import 'package:mostalah/data/data.dart';

class MainController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    refreshTermsList();
    refreshFavoriteTermsList();
  }

  MaterialColor themePrimaryColor = Colors.green;
  var selectedIndex = 0.obs;
  var termsList = [].obs;
  var favoriteTermsList = [].obs;

  void changeIndex(int index) {
    selectedIndex.value = index;
  }

  void refreshTermsList() async {
    termsList.value = await DBProvider.db.getAllTerms();
    // termsList.value = terms;
  }

  void refreshFavoriteTermsList() async {
    favoriteTermsList.value = await DBProvider.db.getFavoriteTerms();
  }

  void changeThemeColor(MaterialColor color) {
    themePrimaryColor = color;
  }
}
