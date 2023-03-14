import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:login/model/agenda_model.dart';
import 'package:login/model/user_model.dart';
import 'package:login/provider/agenda/agenda_date_provider.dart';
import 'package:login/provider/agenda/agenda_provider.dart';
import 'package:login/provider/firestorage_provider.dart';
import 'package:login/provider/firestore_provider.dart';
import 'package:login/provider/notif/notif_provider.dart';
import 'package:login/provider/user/fireauth_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ========= NOTIF ========== //
final notifProvider = StateNotifierProvider((ref) => NotifProvider(1));

final isSwitch = FutureProvider<bool>((ref) async {
  return await SharedPreferences.getInstance().then((value) {
    final condition1 = value.getBool('isNotif') ?? false;
    final condition2 = value.getInt('isNotifInterval') ?? 0;
    if (condition2 != 0) {
      ref.read(notifProvider.notifier).setNotif(condition2);
    }

    return condition1 && condition2 != 0;
  });
});

// ============= AUTH ======== //

final isEmaillPassChangedProvider =
    StateProvider<List<bool>>((ref) => [false, false]);

final fireAuthProvider =
    StateNotifierProvider((ref) => FireAuthProvider(FirebaseAuth.instance));

// ============= DB =========== //

final fireStoreProvider = StateNotifierProvider(
    (ref) => FireStoreProvider(FirebaseFirestore.instance));

final fileStorageProvider =
    StateNotifierProvider<FileStorageProvider, String>((ref) {
  return FileStorageProvider('');
});

// ============= REQUEST =========== //

final getDetailAgendaById =
    FutureProvider.autoDispose.family<AgendaModel, String>((ref, docId) async {
  final db = ref.watch(fireStoreProvider.notifier);
  return await db.getAgendaById('agenda', docId);
});

final getUserDataProvider = FutureProvider.autoDispose<UserModel>((ref) async {
  final data = await ref
      .read(fireStoreProvider.notifier)
      .getUserById('users', 'fvcZjC3UL5M2T2WkbOdg');
  return data;
});

// ============= AGENDA =========== //

final agendaDateNotifierProvider = StateNotifierProvider.autoDispose((ref) {
  return AgendaDateProvider();
});

final agendaNotifierProvider = StateNotifierProvider.autoDispose<AgendaProvider,
    AsyncValue<List<AgendaModel>>>((ref) {
  final fireStore = ref.watch(fireStoreProvider.notifier);

  return AgendaProvider(fireStore);
});
