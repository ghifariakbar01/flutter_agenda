import 'package:flutter_riverpod/flutter_riverpod.dart';

class AgendaDateProvider extends StateNotifier<DateTime> {
  AgendaDateProvider() : super(DateTime.now());

  DateTime get picked => state;

  void setDate(DateTime date) {
    state = date;
  }
}
