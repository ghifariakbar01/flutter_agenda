import 'package:login/model/album_model.dart';
import 'package:login/model/user_model.dart';

abstract class AppInterface {
  Future<List<UserModel>?> getUser();
  Future<List<AlbumModel>?> getAlbum();
}
