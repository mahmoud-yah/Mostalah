import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mostalah/Screens/term_screen.dart';
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
  List<Term> termsToShow = terms;
  List<Term> allTerms = terms;
  bool isSearch = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: isSearch
          ? AppBar(
              // backgroundColor: Theme.of(context).primaryColor,
              backgroundColor: Theme.of(context).primaryColor,
              actions: [
                IconButton(
                  onPressed: () {
                    setState(() {
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
                          var elementTitle = element.syrianTerm.toLowerCase();
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
                'Mostalah',
                style: GoogleFonts.parisienne(fontSize: 35),
              ),
              backgroundColor: Theme.of(context).primaryColor,
              actions: [
                IconButton(
                  onPressed: () {
                    setState(() {
                      isSearch = true;
                    });
                  },
                  icon: const Icon(Icons.search),
                ),
              ],
            ),
      body: FutureBuilder(
        future: DBProvider.db.getAllTerms(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (BuildContext context, int index) {
                  Term term = snapshot.data![index];
                  // print(term.id);
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: () => Get.to(TermScreen(
                          syrianTerm: term.syrianTerm,
                          egyptianTerm: term.egyptianTerm,
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
                              IconButton(
                                  onPressed: () {
                                    DBProvider.db.toggleFavorite(term);
                                    setState(() {});
                                  },
                                  icon: term.isFavorite
                                      ? const Icon(
                                          Icons.favorite,
                                          color: Colors.red,
                                        )
                                      : const Icon(Icons.favorite_border)),
                            ],
                          ),
                        ),
                      ),
                      Divider(
                        height: 0.005,
                        // color: Colors.blueGrey,
                        indent: MediaQuery.of(context).size.width * 0.04,
                        endIndent: MediaQuery.of(context).size.width * 0.04,
                      ),
                    ],
                  );
                });
          } else {
            return const Center(
              child: Text(
                'No Data!',
              ),
            );
          }
        },
      ),
    );
  }
}
