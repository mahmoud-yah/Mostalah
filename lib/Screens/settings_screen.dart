import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mostalah/Screens/term_screen.dart';
import 'package:mostalah/data/data.dart';
import 'package:mostalah/models/term.dart';

class SettingsScreen extends StatelessWidget {
  SettingsScreen({Key? key}) : super(key: key);

  final List<Term> termsToShow = terms;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('العناصر المحفوظة'),
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
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
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          Term term = termsToShow[index];
          return term.isFavorite?Column(
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
                      horizontal: MediaQuery.of(context).size.width * 0.035),
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
          ):const SizedBox.shrink();
        },
        itemCount: termsToShow.length,
      ),
    );
  }
}
