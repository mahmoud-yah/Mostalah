import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mostalah/config/app_theme.dart';
import 'package:mostalah/logic/controllers/settings_controller.dart';
import 'package:mostalah/utils/app_layout.dart';
import 'package:mostalah/utils/gradient_icon.dart';
import 'package:mostalah/view/Screens/term_screen.dart';
import 'package:mostalah/logic/controllers/main_controller.dart';
import 'package:mostalah/config/database.dart';
import 'package:mostalah/data/data.dart';
import 'package:mostalah/models/term.dart';
import 'package:mostalah/view/widgets/custom_drawer.dart';
import 'package:mostalah/view/widgets/gradient_button.dart';

class FavoritesScreen extends StatelessWidget {
  FavoritesScreen({Key? key}) : super(key: key);

  final List<Term> termsToShow = terms;
  final controller = Get.find<MainController>();
  final settingsController = Get.find<SettingsController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawer: CustomDrawer(),
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: const Text('العناصر المحفوظة'),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: Get.isDarkMode
                ? AppTheme.appBarGradientDark
                : AppTheme.appBarGradient,
          ),
        ),
      ),
      // body: Padding(
      //   padding: const EdgeInsets.symmetric(vertical: 20.0),
      //   child: Column(
      //     crossAxisAlignment: CrossAxisAlignment.start,
      //     children: [
      //        Padding(
      //         padding: EdgeInsets.all(8.0),
      //         child: Row(
      //           children: const [
      //             Icon(Icons.workspaces_outline),
      //             Text(
      //               'اختر النمط: ',
      //               style: TextStyle(fontSize: 25),
      //             ),
      //           ],
      //         ),
      //       ),
      //       Row(
      //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //         children: const [
      //           CircleAvatar(backgroundColor: Colors.red,radius: 25,),
      //           CircleAvatar(backgroundColor: Colors.blue,radius: 25,),
      //           CircleAvatar(backgroundColor: Colors.lightGreen,radius: 25,),
      //           // CircleAvatar(backgroundColor: Colors.yellowAccent,),
      //         ],
      //       ),
      //       const SizedBox(height: 30,),
      //       Row(
      //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //         children: const [
      //           CircleAvatar(backgroundColor: Colors.deepPurple,radius: 25,),
      //           CircleAvatar(backgroundColor: Colors.deepOrange,radius: 25,),
      //           CircleAvatar(backgroundColor: Colors.yellowAccent,radius: 25,),
      //           // CircleAvatar(backgroundColor: Colors.yellowAccent,),
      //         ],
      //       ),
      //     ],
      //   ),
      // ),
      body: controller.favoriteTermsList.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GradientIcon(
                    icon: Icons.favorite_border_rounded,
                    size: 300,
                    gradient: Get.isDarkMode
                        ? AppTheme.favoritesIconGradientDark
                        : AppTheme.favoritesIconGradient,
                  ),
                  const Text('لا يوجد عناصر محفوظة',
                      style: TextStyle(fontSize: 30)),
                  SizedBox(
                    height: AppLayout.getHeight(10),
                  ),
                  // ElevatedButton(
                  //   onPressed: () {
                  //     controller.changeIndex(0);
                  //   },
                  //   child: const Text('أضف مصطلح'),
                  // ),
                  // GradientButton(
                  //   height: AppLayout.getHeight(50),
                  //   width: AppLayout.getWidth(110),
                  //   text: 'أضف عنصر إلى قائمتك',
                  //   textColor: Colors.yellow,
                  //   buttonGradient: buttonGradient,
                  //   onTap: () {
                  //     controller.changeIndex(0);
                  //   },
                  // ),
                  GestureDetector(
                    onTap: () => controller.changeIndex(0),
                    child: Container(
                      height: AppLayout.getHeight(50),
                      width: AppLayout.getWidth(50),
                      child: Icon(
                        Icons.add_outlined,
                        color: Colors.yellowAccent,
                        size: AppLayout.getHeight(35),
                      ),
                      decoration: BoxDecoration(
                        gradient: Get.isDarkMode
                            ? AppTheme.buttonGradientDark
                            : AppTheme.buttonGradient,
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ],
              ),
            )
          : Obx(
              () => ListView.builder(
                  itemCount: controller.favoriteTermsList.length,
                  itemBuilder: (BuildContext context, int index) {
                    Term term = controller.favoriteTermsList[index];

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          onTap: () => Get.to(() => TermScreen(
                                term: term,
                                isSyrian: settingsController.isSyrian.value,
                              )),
                          child: Container(
                            // color: Colors.white,
                            margin: const EdgeInsets.all(7),
                            padding: EdgeInsets.symmetric(
                                horizontal:
                                    MediaQuery.of(context).size.width * 0.035),
                            height: MediaQuery.of(context).size.height * 0.07,
                            // width: MediaQuery.of(context).size.width * 0.9,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              // crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  term.syrianTerm,
                                  style: const TextStyle(fontSize: 25),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Divider(
                          height: AppLayout.getHeight(0.005),
                          // color: Colors.blueGrey,
                          indent: MediaQuery.of(context).size.width * 0.04,
                          endIndent: MediaQuery.of(context).size.width * 0.04,
                        ),
                      ],
                    );
                  }),
            ),
      // FutureBuilder(
      //   future: DBProvider.db.getFavoriteTerms(),
      //   builder: (BuildContext context, AsyncSnapshot snapshot) {
      //     if (snapshot.hasData) {
      //       if (snapshot.data!.length == 0) {
      // return Center(
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: [
      //       const Icon(
      //         Icons.favorite_border_rounded,
      //         color: Colors.red,
      //         size: 300,
      //       ),
      //       const Text('لا يوجد عناصر محفوظة',
      //           style: TextStyle(fontSize: 30)),
      //       ElevatedButton(
      //           onPressed: () {
      //             controller.changeIndex(0);
      //           },
      //           child: const Text('أضف مصطلح')),
      //     ],
      //   ),
      // );
      // }
      //       return ListView.builder(
      //           itemCount: snapshot.data!.length,
      //           itemBuilder: (BuildContext context, int index) {
      //             Term term = snapshot.data![index];
      //             // print(term.id);
      //             return Column(
      //               crossAxisAlignment: CrossAxisAlignment.start,
      //               children: [
      //                 GestureDetector(
      //                   behavior: HitTestBehavior.opaque,
      //                   onTap: () => Get.to(()=>TermScreen(
      //                     term: term,
      //                   )),
      //                   child: Container(
      //                     // color: Colors.white,
      //                     margin: const EdgeInsets.all(7),
      //                     padding: EdgeInsets.symmetric(
      //                         horizontal:
      //                             MediaQuery.of(context).size.width * 0.035),
      //                     height: MediaQuery.of(context).size.height * 0.07,
      //                     // width: MediaQuery.of(context).size.width * 0.9,
      //                     child: Row(
      //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                       // crossAxisAlignment: CrossAxisAlignment.start,
      //                       children: [
      //                         Text(
      //                           term.syrianTerm,
      //                           style: const TextStyle(fontSize: 25),
      //                         ),
      //                       ],
      //                     ),
      //                   ),
      //                 ),
      //                 Divider(
      //                   height: 0.005,
      //                   // color: Colors.blueGrey,
      //                   indent: MediaQuery.of(context).size.width * 0.04,
      //                   endIndent: MediaQuery.of(context).size.width * 0.04,
      //                 ),
      //               ],
      //             );
      //           });
      //     } else {
      //       return const SizedBox.shrink();
      //     }
      //   },
      // ),

      // ListView.builder(

      // itemBuilder: (BuildContext context, int index) {
      //   Term term = termsToShow[index];
      //   return term.isFavorite
      //       ? Column(
      //           crossAxisAlignment: CrossAxisAlignment.start,
      //           children: [
      //             GestureDetector(
      //               behavior: HitTestBehavior.opaque,
      //               onTap: () => Get.to(TermScreen(
      //                 syrianTerm: term.syrianTerm,
      //                 egyptianTerm: term.egyptianTerm,
      //               )),
      //               child: Container(
      //                 // color: Colors.white,
      //                 margin: const EdgeInsets.all(7),
      //                 padding: EdgeInsets.symmetric(
      //                     horizontal:
      //                         MediaQuery.of(context).size.width * 0.035),
      //                 height: MediaQuery.of(context).size.height * 0.07,
      //                 // width: MediaQuery.of(context).size.width * 0.9,
      //                 child: Row(
      //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                   // crossAxisAlignment: CrossAxisAlignment.start,
      //                   children: [
      //                     Text(
      //                       term.syrianTerm,
      //                       style: const TextStyle(fontSize: 25),
      //                     ),
      //

      // IconButton(
      //     onPressed: () {
      //       setState(() {
      //         if (term.isFavorite == true) {
      //           term.isFavorite = false;
      //         } else {
      //           term.isFavorite = true;
      //         }
      //       });
      //     },
      //     icon: term.isFavorite
      //         ? const Icon(
      //       Icons.favorite,
      //       color: Colors.red,
      //     )
      //         : const Icon(Icons.favorite_border)),
      //                   ],
      //                 ),
      //               ),
      //             ),
      //             Divider(
      //               height: 0.005,
      //               // color: Colors.blueGrey,
      //               indent: MediaQuery.of(context).size.width * 0.04,
      //               endIndent: MediaQuery.of(context).size.width * 0.04,
      //             ),
      //           ],
      //         )
      //       : const SizedBox.shrink();
      // },
      //   itemCount: termsToShow.length,
      // ),
    );
  }
}
