import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:login/login_page.dart';
import 'package:login/provider/all_provider.dart';
import 'package:login/provider/notif/notif_switch_provider.dart';
import 'package:login/screens/profile_edit_page.dart';
import 'package:login/widgets/agenda_grid.dart';
import 'package:login/widgets/v_image.dart';

class HomePage extends ConsumerStatefulWidget {
  static String tag = 'home-page';

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  final _notifController = Get.put(IsNotifController());

  @override
  Widget build(BuildContext context) {
    final user = ref.watch(fireAuthProvider.notifier);
    final userProvider = ref.watch(getUserDataProvider);
    final timer = ref.watch(notifProvider.notifier).notif;
    final isNotif = ref.watch(isSwitch);

    final alucard = userProvider.when(
        data: (user) {
          return Hero(
            tag: 'hero',
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: SizedBox(
                width: 144.0,
                height: 144.0,
                child: Stack(
                  children: [
                    Align(
                        alignment: Alignment.center,
                        child: SizedBox(
                          height: 144,
                          width: 144,
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(72),
                              child: VNetworkImage(
                                url: user.fotoProfil,
                                height: 144,
                                width: 144,
                              )),
                        )),
                    // edit profile
                    Positioned(
                      bottom: 0,
                      right: -65,
                      left: 0,
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).pushNamed(ProfileEditPage.tag);
                        },
                        child: Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.grey.shade200,
                          ),
                          child: Icon(
                            Icons.edit,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        error: (e, s) => Text('$e $s'),
        loading: () => Center(child: CircularProgressIndicator()));

    final welcome = Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        'Welcome ${user.getUser?.email}',
        style: TextStyle(fontSize: 28.0, color: Colors.white),
      ),
    );

    final dropdown = Padding(
      padding: EdgeInsets.all(8.0),
      child: DropdownButton<String>(
        value: timer.toString(),
        icon: const Icon(Icons.arrow_downward),
        iconSize: 24,
        elevation: 16,
        style: const TextStyle(color: Colors.deepPurple),
        underline: Container(
          height: 2,
          color: Colors.deepPurpleAccent,
        ),
        onChanged: (String? newValue) {
          setState(() {
            ref.read(notifProvider.notifier).setNotif(int.parse(newValue!));
          });
        },
        items: {1, 3, 24}.map<DropdownMenuItem<String>>((int value) {
          return DropdownMenuItem<String>(
            value: value.toString(),
            child: Text(value.toString()),
          );
        }).toList(),
      ),
    );

    final lorem = Padding(
        padding: EdgeInsets.all(8.0),
        child: isNotif.when(
            data: (notif) {
              return Switch(
                value: notif,
                onChanged: (value) {
                  // get alert dialog
                  Get.dialog(
                    AlertDialog(
                      title: Text('Restart?'),
                      content: Text(
                          'You will get notification ${ref.watch(notifProvider.notifier).notif} hours before the event\n\n To do this you must restart so notification initialize.'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Get.back();
                          },
                          child: Text('Cancel'),
                        ),
                        TextButton(
                          onPressed: () async {
                            Get.dialog(
                              Center(
                                child: CircularProgressIndicator(),
                              ),
                            );
                            await _notifController.toggleNotif(
                                ref.watch(notifProvider.notifier).notif);

                            Get.back();
                            exit(0);
                          },
                          child: Text('Ok'),
                        ),
                      ],
                    ),
                  );
                },
              );
            },
            error: (e, s) => Container(),
            loading: () => const Center(child: CircularProgressIndicator())));

    final agendaGrid = AgendaGrid();

    final logout = Padding(
      padding: EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: () async {
          await ref.read(fireAuthProvider.notifier).signOut();
          Navigator.of(context).pushReplacementNamed(LoginPage.tag);
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
        children: <Widget>[
          alucard,
          welcome,
          dropdown,
          lorem,
          agendaGrid,
          logout
        ],
      ),
    );

    return Scaffold(
      body: user.getUser != null ? body : LoginPage(),
    );
  }
}
