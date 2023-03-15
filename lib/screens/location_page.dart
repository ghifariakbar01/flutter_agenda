import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:login/constant.dart';
import 'package:login/model/user_model.dart';

import '../controller/user_controller.dart';

class LocationPage extends StatefulWidget {
  LocationPage({Key? key}) : super(key: key);

  @override
  State<LocationPage> createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  final userController = Get.find<UserController>();
  late UserModel user;

  @override
  void initState() {
    super.initState();

    user = userController.users[userController.userSelected.value];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 33, 32, 32),
        title: const Text('Flutter MapBox'),
      ),
      body: Stack(
        children: [
          FlutterMap(
            options: MapOptions(
                minZoom: 5,
                maxZoom: 18,
                zoom: 13,
                center: LatLng(double.parse(user.address?.geo?.lat ?? ''),
                    double.parse(user.address?.geo?.lng ?? ''))),
            layers: [
              TileLayerOptions(
                urlTemplate:
                    "https://api.mapbox.com/styles/v1/dhruv25/{mapStyleId}/tiles/256/{z}/{x}/{y}@2x?access_token={accessToken}",
                additionalOptions: {
                  'mapStyleId': mapBoxStyleId,
                  'accessToken': mapBoxAccessToken,
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
