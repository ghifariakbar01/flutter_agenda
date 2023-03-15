import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:login/controller/user_controller.dart';
import 'package:login/login_page.dart';
import 'package:login/screens/album_page.dart';

import 'package:login/widgets/v_image.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:login/screens/location_page.dart';

class HomePage extends StatefulWidget {
  static String tag = 'home-page';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final UserController _userController = Get.find();

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _userController.onReady();
    });
    return Obx(() {
      final user = _userController.users[_userController.userSelected.value];

      final welcome = Padding(
        padding: EdgeInsets.all(8.0),
        child: Text(
          'Welcome ${user.email}',
          style: TextStyle(fontSize: 28.0, color: Colors.white),
        ),
      );

      final address = Padding(
        padding: EdgeInsets.all(8.0),
        child: Text(
          'Address: ${user.address?.street}, ${user.address?.suite}, ${user.address?.city}, ${user.address?.zipcode}',
          style: TextStyle(fontSize: 28.0, color: Colors.white),
        ),
      );

      final phone = Padding(
        padding: EdgeInsets.all(8.0),
        child: Text(
          'Phone: ${user.phone}',
          style: TextStyle(fontSize: 28.0, color: Colors.white),
        ),
      );

      final website = Padding(
        padding: EdgeInsets.all(8.0),
        child: Text(
          'Website: ${user.website}',
          style: TextStyle(fontSize: 28.0, color: Colors.white),
        ),
      );

      final company = Padding(
        padding: EdgeInsets.all(8.0),
        child: Text(
          'Company: ${user.company?.name}, ${user.company?.catchPhrase}, ${user.company?.bs}',
          style: TextStyle(fontSize: 28.0, color: Colors.white),
        ),
      );

      final logout = Padding(
        padding: EdgeInsets.all(8.0),
        child: ElevatedButton(
          onPressed: () async {
            final prefs = await SharedPreferences.getInstance();
            prefs.setBool('login', false);

            _userController.userSelected.value = 0;

            Get.offAll(() => LoginPage());
          },
          child: Text('Logout'),
        ),
      );

      final body = Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.all(28.0),
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Colors.blue,
            Colors.lightBlueAccent,
          ]),
        ),
        child: ListView(
          physics: const BouncingScrollPhysics(),
          children: <Widget>[welcome, address, phone, website, company, logout],
        ),
      );

      return Scaffold(
          body: body,
          drawer: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                DrawerHeader(
                  child: Text('User'),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                  ),
                ),
                ListTile(
                  title: Text('User'),
                  onTap: () async {
                    Get.to(() => HomePage());
                  },
                ),
                ListTile(
                  title: Text('Album'),
                  onTap: () async {
                    Get.to(() => AlbumPage());
                  },
                ),
                ListTile(
                  title: Text('Location'),
                  onTap: () async {
                    Get.to(() => LocationPage());
                  },
                ),
                ListTile(
                  title: Text('Logout'),
                  onTap: () async {
                    final prefs = await SharedPreferences.getInstance();
                    prefs.setBool('login', false);

                    _userController.userSelected.value = 0;

                    Get.offAll(() => LoginPage());
                  },
                ),
              ],
            ),
          ));
    });
  }
}
