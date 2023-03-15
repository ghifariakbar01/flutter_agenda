import 'package:get/get.dart';
import 'package:login/model/album_model.dart';
import 'package:login/repo/app_repo.dart';

class AlbumController extends GetxController {
  AlbumController(this._appRepo);

  List<AlbumModel> albums = <AlbumModel>[].obs;

  final AppRepo _appRepo;

  @override
  void onReady() async {
    super.onReady();

    albums = (await _appRepo.getAlbum())!;
  }
}
