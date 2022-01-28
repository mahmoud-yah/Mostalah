import 'package:flutter/material.dart';
import 'package:stacked_themes/stacked_themes.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('الاعدادات'),
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                children: const [
                  Icon(Icons.workspaces_outline),
                  Text(
                    'اختر النمط: ',
                    style: TextStyle(fontSize: 25),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                CircleAvatar(backgroundColor: Colors.red,radius: 25,),
                CircleAvatar(backgroundColor: Colors.blue,radius: 25,),
                CircleAvatar(backgroundColor: Colors.lightGreen,radius: 25,),
                // CircleAvatar(backgroundColor: Colors.yellowAccent,),
              ],
            ),
            const SizedBox(height: 30,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                CircleAvatar(backgroundColor: Colors.deepPurple,radius: 25,),
                CircleAvatar(backgroundColor: Colors.deepOrange,radius: 25,),
                CircleAvatar(backgroundColor: Colors.yellowAccent,radius: 25,),
                // CircleAvatar(backgroundColor: Colors.yellowAccent,),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
