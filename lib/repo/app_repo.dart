// make request to https://jsonplaceholder.typicode.com/users and parse response to UserModel
import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:login/model/album_model.dart';
import 'package:login/model/user_model.dart';
import 'package:login/repo/app_interface.dart';

UserModel? user;
AlbumModel? albumModel;

class AppRepo implements AppInterface {
  // get list of users
  Future<List<UserModel>?> getUser() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    if (response.statusCode == 200) {
      return (jsonDecode(response.body) as List)
          .map((e) => UserModel.fromJson(e))
          .toList();
    } else {
      throw Exception('Failed to load user');
    }
  }

  Future<List<AlbumModel>?> getAlbum() async {
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/albums'));
    if (response.statusCode == 200) {
      return (jsonDecode(response.body) as List)
          .map((e) => AlbumModel.fromJson(e))
          .toList();
    } else {
      throw Exception('Failed to load album');
    }
  }
}
