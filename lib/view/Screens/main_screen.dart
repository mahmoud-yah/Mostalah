import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mostalah/config/app_theme.dart';
import 'package:mostalah/logic/controllers/settings_controller.dart';
import 'package:mostalah/view/Screens/term_screen.dart';
import 'package:mostalah/logic/controllers/main_controller.dart';
import 'package:mostalah/config/database.dart';
import 'package:mostalah/data/data.dart';
import 'package:mostalah/models/term.dart';
import 'package:get/get.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  initState() {
    super.initState();
    // db = FirebaseFirestore.instance;
    allTerms = controller.termsList;
    termsToShow = controller.termsList;
    // termsToShow = terms;
  }

  List<dynamic> termsToShow = terms;
  List<dynamic> allTerms = terms;
  bool isSearch = false;
  FirebaseFirestore db = FirebaseFirestore.instance;
  final controller = Get.find<MainController>();
  final settingsController = Get.find<SettingsController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawer: CustomDrawer(),
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: isSearch
          ? AppBar(
              automaticallyImplyLeading: false,
              flexibleSpace: Container(
                decoration: BoxDecoration(
                  gradient: Get.isDarkMode
                      ? AppTheme.appBarGradientDark
                      : AppTheme.appBarGradient,
                ),
              ),
              actions: [
                IconButton(
                  onPressed: () {
                    setState(() {
                      // getTermsFromFirebase();
                      isSearch = false;
                      termsToShow = allTerms;
                    });
                  },
                  icon: const Icon(Icons.arrow_back),
                ),
                Expanded(
                  child: TextField(
                    // ignore: prefer_const_constructors
                    style: TextStyle(color: Colors.white70),
                    decoration: const InputDecoration(
                        hintText: 'ابحث...',
                        hintStyle: TextStyle(color: Colors.white70),
                        border: InputBorder.none),
                    onChanged: (text) {
                      text = text.toLowerCase();
                      setState(() {
                        termsToShow = allTerms.where((element) {
                          var elementTitle = settingsController.isSyrian.value
                              ? element.syrianTerm.toLowerCase()
                              : element.egyptianTerm.toLowerCase();
                          return elementTitle.contains(text);
                        }).toList();
                      });
                    },
                  ),
                ),
              ],
            )
          : AppBar(
              title: Text(
                'مصطلح',
                // style: GoogleFonts.parisienne(fontSize: 35),
                style: GoogleFonts.reemKufi(fontSize: 40),
                // style: TextStyle(fontFamily: 'Marhey',fontSize: 35,color: Colors.yellowAccent),
              ),
              flexibleSpace: Container(
                decoration: BoxDecoration(
                  gradient: Get.isDarkMode
                      ? AppTheme.appBarGradientDark
                      : AppTheme.appBarGradient,
                ),
              ),
              actions: [
                IconButton(
                  onPressed: () {
                    setState(() {
                      // DBProvider.db.deleteAll();
                      // termsToShow.clear();
                      isSearch = true;
                    });
                  },
                  icon: const Icon(Icons.search),
                ),
              ],
            ),
      body: RefreshIndicator(
        onRefresh: () async {
          // allTerms = await DBProvider.db.getAllTerms();
          // return Future<void>.delayed(const Duration(seconds: 0));
          await onRefresh();
          setState(() {});
        },

        child: Obx(
          () => ListView.builder(
              itemCount: termsToShow.length,
              itemBuilder: (BuildContext context, int index) {
                Term term = termsToShow[index];
                // print(term.id);
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () => Get.to(() => TermScreen(
                            term: term,
                            isSyrian: settingsController.isSyrian.value,
                          ),transition: Transition.zoom),
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
                              settingsController.isSyrian.value
                                  ? term.syrianTerm
                                  : term.egyptianTerm,
                              style: const TextStyle(fontSize: 25),
                            ),
                            IconButton(
                              onPressed: () {
                                DBProvider.db.toggleFavorite(term);
                                controller.refreshFavoriteTermsList();
                                controller.refreshTermsList();
                              },
                              icon: term.isFavorite
                                  ? const Icon(
                                      Icons.favorite,
                                      color: Colors.red,
                                    )
                                  : const Icon(Icons.favorite_border),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Divider(
                      height: 0.09,
                      // color: Colors.blueGrey,
                      indent: MediaQuery.of(context).size.width * 0.04,
                      endIndent: MediaQuery.of(context).size.width * 0.04,
                    ),
                  ],
                );
              }),
        ),
        // FutureBuilder<dynamic>(
        //   // future: readTerms(),
        //   future: DBProvider.db.getAllTerms(),
        //   builder: (context, snapshot) {
        //     if (snapshot.hasData) {
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
        //                   onTap: () => Get.to(() => TermScreen(
        //                         term: term,
        //                       )),
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
        //                         IconButton(
        //                           onPressed: () {
        //                             DBProvider.db.toggleFavorite(term);
        //                             setState(() {});
        //                           },
        //                           icon: term.isFavorite
        //                               ? const Icon(
        //                                   Icons.favorite,
        //                                   color: Colors.red,
        //                                 )
        //                               : const Icon(Icons.favorite_border),
        //                         ),
        //                       ],
        //                     ),
        //                   ),
        //                 ),
        //                 Divider(
        //                   height: 0.09,
        //                   // color: Colors.blueGrey,
        //                   indent: MediaQuery.of(context).size.width * 0.04,
        //                   endIndent: MediaQuery.of(context).size.width * 0.04,
        //                 ),
        //               ],
        //             );
        //           });
        //     } else {
        //       return const Center(
        //         child: Text('no data'),
        //       );
        //     }
        //   },
        // ),
      ),
      // FutureBuilder(
      //   future: DBProvider.db.getAllTerms(),
      //   builder: (BuildContext context, AsyncSnapshot snapshot) {
      //     if (snapshot.hasData) {
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
      //                   onTap: () => Get.to(TermScreen(
      //                     syrianTerm: term.syrianTerm,
      //                     egyptianTerm: term.egyptianTerm,
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
      //                         IconButton(
      //                           onPressed: () {
      //                             DBProvider.db.toggleFavorite(term);
      //                             setState(() {});
      //                           },
      //                           icon: term.isFavorite
      //                               ? const Icon(
      //                                   Icons.favorite,
      //                                   color: Colors.red,
      //                                 )
      //                               : const Icon(Icons.favorite_border),
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
      //       return const Center(
      //         child: SizedBox.shrink(),
      //       );
      //     }
      //   },
      // ),
    );
  }

  void getTermsFromFirebase() async {
    // await db.collection("users").get();
    await db.collection("terms").get().then((event) {
      for (var doc in event.docs) {
        print("${doc.id} => ${doc.data()}");
      }
    });
  }

  Stream<List<Term>> readTerms() => FirebaseFirestore.instance
      .collection('terms')
      .snapshots()
      .map((snapshot) =>
          snapshot.docs.map((doc) => Term.fromMap(doc.data())).toList());

  void testingFB() async {
    await db.collection("terms").get().then((event) {
      for (var doc in event.docs) {
        Term term = Term.fromMap(doc.data());
        print(term.egyptianTerm);
        // print(doc.data());
      }
    });
  }

  Future<void> onRefresh() async {
    List<Term> termsFromFirebase = [];
    List<Term> termsFromSQLite = [];
    bool isFound = false;
    await db.collection("terms").get().then((event) {
      for (var doc in event.docs) {
        termsFromFirebase.add(Term.fromMapWithID(doc.data(), doc.id));
      }
    });
    termsFromSQLite = await DBProvider.db.getAllTerms();

    if (termsFromSQLite.isEmpty) {
      print('empty');
      for (var element in termsFromFirebase) {
        DBProvider.db.insertTerm(element);
      }
    } else {
      for (var element in termsFromFirebase) {
        isFound = false;
        for (var sqlElement in termsFromSQLite) {
          if (element.compareTerms(sqlElement)) {
            print('found it: ${element.syrianTerm}');
            isFound = true;
            break;
          }
        }
        if (!isFound) {
          DBProvider.db.insertTerm(element);
        }
      }
    }
    controller.refreshTermsList();
    return Future<void>.delayed(const Duration(seconds: 0));
  }
}
