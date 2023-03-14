import 'package:get/get.dart';
import 'package:login/utils/snackbar.dart';

import 'package:shared_preferences/shared_preferences.dart';

class IsNotifController extends GetxController {
  IsNotifController();

  final isNotif = false.obs;

  toggleNotif(int notifInterval) async {
    isNotif.toggle();

    if (isNotif.value) {
      await SharedPreferences.getInstance().then((prefs) {
        prefs.setBool('isNotif', true);
        prefs.setInt('isNotifInterval', notifInterval);
      });
      makeSuccessSb('Success', 'on notification');
    } else {
      await SharedPreferences.getInstance().then((prefs) {
        prefs.setBool('isNotif', false);
        prefs.setInt('isNotifInterval', notifInterval);
      });
      makeErrorSb('Success', 'off notification');
    }
  }
}
