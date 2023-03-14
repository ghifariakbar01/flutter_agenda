import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:login/provider/all_provider.dart';
import 'package:login/widgets/profile_edit_form.dart';

class ProfileEditPage extends ConsumerWidget {
  const ProfileEditPage({Key? key}) : super(key: key);
  static String tag = 'profile-edit-page';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(getUserDataProvider);

    return user.when(
        data: (user) {
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
              child: UserForm(user));

          return KeyboardDismisser(
            gestures: [
              GestureType.onTap,
              GestureType.onPanUpdateDownDirection,
            ],
            child: Scaffold(
              appBar: AppBar(
                iconTheme: IconThemeData(color: Colors.white),
              ),
              body: body,
            ),
          );
        },
        error: (e, s) => Text('$e $s'),
        loading: () => Center(child: const CircularProgressIndicator()));
  }
}
