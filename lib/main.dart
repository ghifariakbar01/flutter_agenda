// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:login/controller/album_controller.dart';
import 'package:login/controller/user_controller.dart';
import 'package:login/repo/app_repo.dart';
import 'login_page.dart';
import 'home_page.dart';

final AppRepo _appRepo = AppRepo();

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  Get.put(UserController(_appRepo), permanent: true);
  Get.put(AlbumController(_appRepo), permanent: true);

  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  final routes = <String, WidgetBuilder>{
    LoginPage.tag: (context) => LoginPage(),
    HomePage.tag: (context) => HomePage(),
  };

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
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
