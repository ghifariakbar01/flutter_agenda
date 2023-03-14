// ignore_for_file: non_constant_identifier_names

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:login/screens/agenda_edit_page.dart';
import 'package:login/screens/profile_edit_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:workmanager/workmanager.dart';
import 'login_page.dart';
import 'home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  print('app restart');
  await SharedPreferences.getInstance().then((prefs) {
    var isNotif = prefs.getBool('isNotif');
    var isNotifInterval = prefs.getInt('isNotifInterval');

    if (isNotif == true && isNotifInterval != 0) {
      Workmanager().initialize(callbackDispatcher, isInDebugMode: true);

      Workmanager().registerPeriodicTask(
        "2",
        "simplePeriodicTask",
        frequency: Duration(hours: isNotifInterval ?? 1),
      );
    }
  });

  runApp(ProviderScope(child: GetMaterialApp(home: MyApp())));
}

void callbackDispatcher() {
  Workmanager().executeTask((task, inputData) {
    FlutterLocalNotificationsPlugin flip =
        new FlutterLocalNotificationsPlugin();

    var android = new AndroidInitializationSettings('@mipmap/ic_launcher');
    var IOS = new DarwinInitializationSettings();

    var settings = new InitializationSettings(android: android, iOS: IOS);
    flip.initialize(settings);
    _showNotificationWithDefaultSound(flip);
    return Future.value(true);
  });
}

Future _showNotificationWithDefaultSound(flip) async {
  var androidPlatformChannelSpecifics = new AndroidNotificationDetails(
      'your channel id', 'your channel name',
      importance: Importance.max, priority: Priority.high);
  var iOSPlatformChannelSpecifics = new DarwinNotificationDetails();

  var platformChannelSpecifics = new NotificationDetails(
      android: androidPlatformChannelSpecifics,
      iOS: iOSPlatformChannelSpecifics);
  await flip.show(0, 'Check your agenda', 'You have an agenda today',
      platformChannelSpecifics,
      payload: 'Default_Sound');
}

class MyApp extends StatelessWidget {
  final routes = <String, WidgetBuilder>{
    LoginPage.tag: (context) => LoginPage(),
    HomePage.tag: (context) => HomePage(),
    ProfileEditPage.tag: (context) => ProfileEditPage(),
    AgendaEditPage.tag: (context) => AgendaEditPage(false),
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kodeversitas',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
        fontFamily: 'Nunito',
      ),
      home: HomePage(),
      routes: routes,
    );
  }
}
