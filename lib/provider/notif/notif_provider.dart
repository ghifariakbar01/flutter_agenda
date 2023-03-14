import 'package:flutter_riverpod/flutter_riverpod.dart';

class NotifProvider extends StateNotifier<int> {
  NotifProvider(super.state);

  int get notif => state;

  void setNotif(int notif) {
    state = notif;
  }
}
