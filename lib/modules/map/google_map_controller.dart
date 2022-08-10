import 'dart:math';
import 'package:figma_squircle/figma_squircle.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:home_yogi_flutter/api/api_repository.dart';
import 'dart:async';

import 'package:home_yogi_flutter/shared/constants/png_image_constant.dart';
import 'package:home_yogi_flutter/shared/utils/math_utils.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../shared/widgets/base_text.dart';

class GoogleMapViewController extends GetxController {
  final ApiRepository repository;
  Completer<GoogleMapController> googleMapController = Completer();
  GoogleMapController? m1;
  GoogleMapViewController({required this.repository});
  final GeolocatorPlatform _geolocatorPlatform = GeolocatorPlatform.instance;
  var latitude = 0.0.obs;
  var longitude = 0.0.obs;
  var fullAddress = ''.obs;
  var markers = <Marker>{}.obs;
  final Set<Circle> circles = {};
  BitmapDescriptor? pinLocationIcon;
  var place = Placemark().obs;
  void setCustomMapPin() async {
    pinLocationIcon = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(size: Size(20, 20), devicePixelRatio: 2),
        PngImageConstants.googleMapMarker);
  }

  Future<void> getCurrentPosition() async {
    final hasPermission = await _handlePermission();

    if (!hasPermission) {
      return;
    }

    final position = await _geolocatorPlatform.getCurrentPosition();
    latitude.value = position.latitude;
    longitude.value = position.longitude;
    await getAddressFromLatLong(position.latitude, position.longitude);
    markers.add(
      Marker(
        markerId: MarkerId('Home'),
        onTap: () {
          print(' Marker Tapped');
        },
        draggable: true,
        infoWindow: InfoWindow(title: "Home"),
        position: LatLng(
          position.latitude,
          position.longitude,
        ),
        onDragEnd: ((newPosition) {
          print(newPosition.latitude);
          print(newPosition.longitude);
        }),
      ),
    );

    final GoogleMapController mapController = await googleMapController.future;
    await mapController.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: LatLng(
            latitude.value,
            longitude.value,
          ),
          zoom: 15,
        ),
      ),
    );
    circles.add(
      Circle(
        circleId: CircleId('Home'),
        center: LatLng(
          position.latitude,
          position.longitude,
        ),
        radius: getSize(60),
        strokeWidth: 40,
        fillColor: Color(0xff38A8FF),
        strokeColor: Color(0xff38A8FF).withOpacity(0.2),
      ),
    );
  }

  double getZoomLevel(double radius) {
    double zoomLevel = 11;
    if (radius > 0) {
      double radiusElevated = radius + radius / 2;
      double scale = radiusElevated / 500;
      zoomLevel = 16 - log(scale) / log(2);
    }
    zoomLevel = double.parse(zoomLevel.toStringAsFixed(2));
    return zoomLevel;
  }

  Future<bool> _handlePermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await _geolocatorPlatform.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.

      return false;
    }

    permission = await _geolocatorPlatform.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await _geolocatorPlatform.requestPermission();
      if (permission == LocationPermission.denied) {
        await showPermissionAlertDialog();
        return false;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      await showPermissionAlertDialog();
      return false;
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.

    return true;
  }

  Future<String> getAddressFromLatLong(double lat, double long) async {
    List<Placemark> placemarks = await placemarkFromCoordinates(lat, long);
    print(placemarks);
    place.value = placemarks[0];
    print(place.value.subLocality);
    fullAddress.value =
        '${place.value.street}, ${place.value.subLocality}, ${place.value.locality}, ${place.value.country}, ${place.value.postalCode}';

    return '${place.value.street}, ${place.value.subLocality}, ${place.value.locality}, ${place.value.country}, ${place.value.postalCode}';
    //   Get.back(result: fullAddress.value);
  }

  static Future<void> showPermissionAlertDialog() async {
    return showDialog<void>(
      context: Get.context!,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          shape: SmoothRectangleBorder(
            borderRadius: SmoothBorderRadius.all(
              SmoothRadius(
                cornerRadius: getSize(20),
                cornerSmoothing: 1,
              ),
            ),
          ),
          title: BaseText(
            text: 'Permission Denied!',
            fontWeight: FontWeight.w600,
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BaseText(
                  text:
                  'Unable to open google map. Go to Settings > Permissions, then allow following permissions and try again:'),
              SizedBox(
                height: getSize(20),
              ),
              Row(
                children: [
                  Icon(Icons.location_pin),
                  SizedBox(
                    width: getSize(10),
                  ),
                  BaseText(
                    text: 'Location',
                    fontWeight: FontWeight.w500,
                  ),
                ],
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: BaseText(
                text: 'Cancel',
                fontWeight: FontWeight.w600,
                textColor: Colors.blueAccent,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: BaseText(
                text: 'Open Settings',
                fontWeight: FontWeight.w600,
                textColor: Colors.blueAccent,
              ),
              onPressed: () {
                openAppSettings();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  void onInit() {
    setCustomMapPin();
    getCurrentPosition();

    super.onInit();
  }
}
