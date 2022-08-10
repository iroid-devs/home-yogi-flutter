// import 'package:figma_squircle/figma_squircle.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:get/get.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:home_yogi_flutter/api/api_repository.dart';
// import 'dart:async';
// import 'package:home_yogi_flutter/shared/constants/png_image_constant.dart';
// import 'package:home_yogi_flutter/shared/utils/math_utils.dart';
// import 'package:permission_handler/permission_handler.dart';
//
// import '../../../shared/widgets/base_text.dart';
//
// class GoogleMapViewController extends GetxController {
//   final ApiRepository repository;
//   Completer<GoogleMapController> googleMapController = Completer();
//   GoogleMapViewController({required this.repository});
//   final GeolocatorPlatform _geolocatorPlatform = GeolocatorPlatform.instance;
//   var latitude = 0.0.obs;
//   var longitude = 0.0.obs;
//   var test = ''.obs;
//   final Set<Marker> markers = {};
//   final Set<Circle> circles = {};
//
//   Future<void> getCurrentPosition() async {
//     printInfo(info: 'getCurrentPosition()===> called');
//
//     final hasPermission = await _handlePermission();
//
//     if (!hasPermission) {
//       return;
//     }
//
//     final position = await _geolocatorPlatform.getCurrentPosition();
//     latitude.value = position.latitude;
//     longitude.value = position.longitude;
//
//     markers.add(
//       Marker(
//         markerId: MarkerId('Home'),
//         infoWindow: InfoWindow(title: "Home"),
//         //   icon: BitmapDescriptor.defaultMarkerWithHue(5),
//         position: LatLng(
//           position.latitude,
//           position.longitude,
//         ),
//       ),
//     );
//     circles.add(
//       Circle(
//         circleId: CircleId('Home'),
//         center: LatLng(
//           position.latitude,
//           position.longitude,
//         ),
//         radius: getSize(60),
//         strokeWidth: 40,
//         fillColor: Color(0xff38A8FF),
//         strokeColor: Color(0xff38A8FF).withOpacity(0.2),
//       ),
//     );
//   }
//
//   Future<bool> _handlePermission() async {
//     bool serviceEnabled;
//     LocationPermission permission;
//
//     // Test if location services are enabled.
//     serviceEnabled = await _geolocatorPlatform.isLocationServiceEnabled();
//     if (!serviceEnabled) {
//       // Location services are not enabled don't continue
//       // accessing the position and request users of the
//       // App to enable the location services.
//
//       return false;
//     }
//
//     permission = await _geolocatorPlatform.checkPermission();
//     if (permission == LocationPermission.denied) {
//       print("============1");
//       permission = await _geolocatorPlatform.requestPermission();
//       if (permission == LocationPermission.denied) {
//         await showPermissionAlertDialog();
//         print("===================2");
//         return false;
//       }
//     }
//
//     if (permission == LocationPermission.deniedForever) {
//       print("==================================3");
//       await showPermissionAlertDialog();
//       return false;
//     }
//
//     // When we reach here, permissions are granted and we can
//     // continue accessing the position of the device.
//
//     return true;
//   }
//
//   static Future<void> showPermissionAlertDialog() async {
//     return showDialog<void>(
//       context: Get.context!,
//       barrierDismissible: false, // user must tap button!
//       builder: (BuildContext context) {
//         return AlertDialog(
//           shape: SmoothRectangleBorder(
//             borderRadius: SmoothBorderRadius.all(
//               SmoothRadius(
//                 cornerRadius: getSize(20),
//                 cornerSmoothing: 1,
//               ),
//             ),
//           ),
//           title: BaseText(
//             text: 'Permission Denied!',
//             fontWeight: FontWeight.w600,
//           ),
//           content: Column(
//             mainAxisSize: MainAxisSize.min,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               BaseText(
//                   text:
//                       'Unable to open google map. Go to Settings > Permissions, then allow following permissions and try again:'),
//               SizedBox(
//                 height: getSize(20),
//               ),
//               Row(
//                 children: [
//                   Icon(Icons.location_pin),
//                   SizedBox(
//                     width: getSize(10),
//                   ),
//                   BaseText(
//                     text: 'Location',
//                     fontWeight: FontWeight.w500,
//                   ),
//                 ],
//               ),
//             ],
//           ),
//           actions: <Widget>[
//             TextButton(
//               child: BaseText(
//                 text: 'Cancel',
//                 fontWeight: FontWeight.w600,
//                 textColor: Colors.blueAccent,
//               ),
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//             ),
//             TextButton(
//               child: BaseText(
//                 text: 'Open Settings',
//                 fontWeight: FontWeight.w600,
//                 textColor: Colors.blueAccent,
//               ),
//               onPressed: () {
//                 openAppSettings();
//                 Navigator.of(context).pop();
//               },
//             ),
//           ],
//         );
//       },
//     );
//   }
//
//   @override
//   void onInit() {
//     printInfo(info: 'onInit() ===> called');
//  //   getCurrentPosition();
//     super.onInit();
//   }
// }
