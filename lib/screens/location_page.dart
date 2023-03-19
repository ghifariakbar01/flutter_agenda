import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';
import 'package:login/constant.dart';
import 'package:login/controller/user_provider.dart';
import 'package:login/model/user_model.dart';

class LocationPage extends ConsumerStatefulWidget {
  LocationPage({Key? key}) : super(key: key);

  @override
  ConsumerState<LocationPage> createState() => _LocationPageState();
}

class _LocationPageState extends ConsumerState<LocationPage> {
  late UserModel user;

  @override
  Widget build(BuildContext context) {
    user = ref.watch(userStateNotifierProvider);

    return Stack(
      children: [
        FlutterMap(
          options: MapOptions(
              minZoom: 3,
              maxZoom: 4,
              zoom: 3,
              center: LatLng(double.parse(user.address?.geo?.lat ?? ''),
                  double.parse(user.address?.geo?.lng ?? ''))),
          layers: [
            TileLayerOptions(
              urlTemplate:
                  "https://api.mapbox.com/styles/v1/ghifariakbar/{mapStyleId}/tiles/256/{z}/{x}/{y}@2x?access_token={accessToken}",
              additionalOptions: {
                'mapStyleId': mapBoxStyleId,
                'accessToken': mapBoxAccessToken,
              },
            ),
            MarkerLayerOptions(
              markers: [
                Marker(
                  width: 80.0,
                  height: 80.0,
                  point: LatLng(double.parse(user.address?.geo?.lat ?? ''),
                      double.parse(user.address?.geo?.lng ?? '')),
                  builder: (ctx) => Container(
                    child: const Icon(
                      Icons.location_on,
                      color: Colors.red,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ],
    );
  }
}
