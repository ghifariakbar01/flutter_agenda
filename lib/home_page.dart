import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:login/controller/user_provider.dart';

import 'package:login/login_page.dart';
import 'package:login/model/user_model.dart';
import 'package:login/screens/album_page.dart';
import 'package:login/screens/location_page.dart';

import 'package:login/widgets/v_label.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends ConsumerStatefulWidget {
  static String tag = 'home-page';

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  var selectedIndex = 0;
  final pageController = PageController();

  @override
  Widget build(BuildContext context) {
    final user = ref.watch(userStateNotifierProvider);

    final welcome = Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          VLabel(label: 'Email'),
          Text(
            user.email ?? '',
          ),
        ],
      ),
    );

    final address = Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          VLabel(label: 'Address'),
          Text(
            '${user.address?.street}, ${user.address?.suite}, ${user.address?.city}, ${user.address?.zipcode}',
          ),
        ],
      ),
    );

    final phone = Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          VLabel(label: 'Phone'),
          Text(
            user.phone ?? '',
          ),
        ],
      ),
    );

    final website = Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          VLabel(label: 'Website'),
          Text(
            user.website ?? '',
          ),
        ],
      ),
    );

    final company = Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          VLabel(label: 'Company'),
          Text(
            '${user.company?.name}, ${user.company?.catchPhrase}, ${user.company?.bs}',
          ),
        ],
      ),
    );

    final logout = Padding(
      padding: EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: () async {
          final prefs = await SharedPreferences.getInstance();
          prefs.setBool('login', false);

          ref.read(userStateNotifierProvider.notifier).setUser(UserModel());

          Get.offAll(() => LoginPage());
        },
        child: Text('Logout'),
      ),
    );

    final body = Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          Colors.blue,
          Colors.lightBlueAccent,
        ]),
      ),
      child: PageView(
        controller: pageController,
        onPageChanged: (index) {
          setState(() => selectedIndex = index);
        },
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView(
              physics: const BouncingScrollPhysics(),
              children: <Widget>[
                welcome,
                address,
                phone,
                website,
                company,
                logout
              ],
            ),
          ),
          AlbumPage(),
          LocationPage(),
        ],
      ),
    );

    return Scaffold(
      body: body,
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: selectedIndex,
        showElevation: true, // use this to remove appBar's elevation
        onItemSelected: (index) => setState(() {
          selectedIndex = index;

          pageController.animateToPage(index,
              duration: Duration(milliseconds: 300), curve: Curves.ease);
        }),
        items: [
          BottomNavyBarItem(
            icon: Icon(Icons.person),
            title: Text('Home'),
            activeColor: Colors.red,
          ),
          BottomNavyBarItem(
              icon: Icon(Icons.photo),
              title: Text('Album'),
              activeColor: Colors.purpleAccent),
          BottomNavyBarItem(
              icon: Icon(Icons.pin_drop),
              title: Text('Location'),
              activeColor: Colors.pink),
        ],
      ),
    );
  }
}
