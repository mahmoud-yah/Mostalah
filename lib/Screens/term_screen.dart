import 'package:flutter/material.dart';

class TermScreen extends StatelessWidget {
  final String syrianTerm;
  final String egyptianTerm;

  const TermScreen(
      {Key? key, required this.syrianTerm, required this.egyptianTerm})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 0,
      ),
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.15,
            width: double.infinity,
            color: Theme.of(context).primaryColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  syrianTerm,
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 28,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              // color: Colors.yellowAccent,
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Text(
                        'المرادف: ',
                        style: TextStyle(fontSize: 20),
                      ),
                      Text(
                        egyptianTerm,
                        style: const TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                  Divider(
                    height: 100,
                    indent: MediaQuery.of(context).size.width * 0.25,
                    endIndent: MediaQuery.of(context).size.width * 0.25,
                    color: Colors.grey,
                    thickness: 0.6,
                  ),
                  Row(
                    children: const [
                      Text(
                        'الوصف: ',
                        style: TextStyle(fontSize: 20),
                      ),
                      Text(
                        '',
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
