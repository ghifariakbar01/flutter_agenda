import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:login/model/agenda_model.dart';
import 'package:login/model/user_model.dart';
import 'package:login/utils/snackbar.dart';

class FireStoreProvider extends StateNotifier<FirebaseFirestore> {
  FireStoreProvider(state) : super(state);

  Future<String> addData(String collection, Map<String, dynamic> data) async {
    var id = '';
    await state.collection(collection).add(data).then((value) => id = value.id);
    return id;
  }

  Future<void> updateData(
      String collection, String docId, Map<String, dynamic> data) async {
    print('docId $docId data $data collection $collection');
    await state.collection(collection).doc(docId).update(data).then(
        (value) => makeSuccessSb('Success update', 'Successfully update data'));
  }

  Future<void> deleteData(String collection, String docId) async {
    await state.collection(collection).doc(docId).delete();
  }

  Future<AgendaModel> getAgendaById(String collection, String docId) async {
    return await state.collection(collection).doc(docId).get().then(
        (value) => AgendaModel.fromJson(value.data() as Map<String, dynamic>));
  }

  Future<UserModel> getUserById(String collection, String docId) async {
    return await state.collection(collection).doc(docId).get().then(
        (value) => UserModel.fromJson(value.data() as Map<String, dynamic>));
  }
}
