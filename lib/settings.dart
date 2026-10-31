/*
 * Settings Page
 * Functions Include:
 * 
 */

import 'package:flutter/material.dart';

class Settings extends StatefulWidget{
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {

  TextStyle headingStyle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: const Color(0xFFE97868)
  );


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: EdgeInsets.all(12),
      alignment: Alignment.center,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text('Focus Preferences', style: headingStyle)
            ],
          ),
          ListTile(
            tileColor: const Color(0xFFFFF7E8),
            leading: Icon(Icons.lock_clock),
            title: Text('Focus Timer'),
            subtitle: Text('? minutes'),
            ),
            Divider(),
            Text(
              'App Preferences',
              style: headingStyle,
            ),
            ListTile(
              tileColor: const Color(0xFFFFF7E8),
              leading: Icon(Icons.notification_add),
              title: Text('Notifications'),
              subtitle: Text('Session invites and task reminders'),
            ),
            Divider(),
            Text(
              'More',
              style: headingStyle,
            ),
            /** TODO center buttons and add text */
            Row(
              children: [
                ElevatedButton(
                  onPressed: () {}, 
                  child: Icon(Icons.question_answer)         
                ),
                ElevatedButton(
                  onPressed: (){}, 
                  child: Icon(Icons.exit_to_app)
                )
              ],
            )
        ],
      ),
    );
  }
}