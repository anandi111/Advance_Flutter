/// 1. Create an app which display Settings UI as shown in attached picture with an
/// App bar contains title of "Settings UI" which should auto-changes whole app's UI'
///' based on mobile devices's operating system. (As shown in image called "settings_ui")

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:outcaster_1/setting%20Screens/Globals.dart';
import 'package:outcaster_1/setting%20Screens/setting_screens.dart';

void main() {
  runApp((Global.isIos == false)
      ? MaterialApp(
          theme: ThemeData(
            primaryColor: Colors.red,
          ),
          home: SettingScreen(),
        )
      : CupertinoApp(
          home: SettingScreen(),
        ));
}
