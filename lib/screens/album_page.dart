import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:login/controller/album_controller.dart';

import '../repo/app_repo.dart';

class AlbumPage extends StatelessWidget {
  AlbumPage({Key? key}) : super(key: key);

  final albumController = Get.find<AlbumController>();

  @override
  Widget build(BuildContext context) {
    final albums = albumController.albums;

    return Container(
      height: Get.height,
      width: Get.width,
      child: Obx(
        () => ListView.builder(
          itemCount: albums.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: CachedNetworkImage(
                imageUrl: albums[index].thumbnailUrl ?? '',
                placeholder: (context, url) => CircularProgressIndicator(),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
              subtitle: Text(albums[index].title ?? ''),
            );
          },
        ),
      ),
    );
  }
}
