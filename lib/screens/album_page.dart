import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login/constant.dart';
import 'package:login/controller/album_controller.dart';
import 'package:login/repo/app_repo.dart';

final AppRepo _appRepo = AppRepo();

class AlbumPage extends StatelessWidget {
  AlbumPage({Key? key}) : super(key: key);

  final albumController = Get.put(AlbumController(_appRepo));

  @override
  Widget build(BuildContext context) {
    final albums = albumController.albums;

    return Container(
      color: kDarkBlue,
      height: Get.height,
      width: Get.width,
      child: ListView.builder(
        itemCount: albums.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: CachedNetworkImage(
              imageUrl: albums[index].thumbnailUrl ?? '',
              placeholder: (context, url) =>
                  Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
            subtitle: Text(albums[index].title ?? ''),
          );
        },
      ),
    );
  }
}
