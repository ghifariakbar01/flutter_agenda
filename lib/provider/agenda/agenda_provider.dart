// ignore_for_file: unnecessary_question_mark, unnecessary_cast

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:login/model/agenda_model.dart';
import 'package:login/provider/firestore_provider.dart';

class AgendaProvider extends StateNotifier<AsyncValue<List<AgendaModel>>> {
  AgendaProvider(this.service) : super(const AsyncValue.loading()) {
    load();
  }

  final FireStoreProvider service;

  Future<void> load() async {
    state = AsyncValue.loading();

    try {
      final data = service.state.collection('agenda');
      state = AsyncValue.data(
        (await data.get())
            .docs
            .map((e) => AgendaModel.fromJson(e.data() as Map<String, dynamic?>))
            .toList(),
      );

      final ids = [];

      await data.get().then((value) {
        for (var i = 0; i < value.docs.length; i++) {
          ids.add(value.docs[i].id);
        }
      });

      final List<AgendaModel> temp = [];

      state.whenData((value) {
        for (var i = 0; i < value.length; i++) {
          temp.add(value[i].copyWith(id: ids[i]));
        }
        state = AsyncValue.data(temp);
      });
    } catch (e) {
      print('Error: $e');
      state = AsyncValue.error(e, StackTrace.current);
    }
  }

  void add(AgendaModel agenda) {
    state.whenData((value) {
      state = AsyncValue.data([...value, agenda]);
    });
  }

  void update(AgendaModel agenda) {
    state.whenData((value) {
      state = AsyncValue.data(
          [...value.where((element) => element.id != agenda.id), agenda]);
    });
  }
}
