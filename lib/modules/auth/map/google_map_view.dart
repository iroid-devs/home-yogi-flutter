// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:home_yogi_flutter/modules/auth/map/google_map_controller.dart';
//
// class GoogleMapView extends GetView<GoogleMapViewController> {
//   const GoogleMapView({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Obx(
//         (() {
//           printInfo(info: 'ty===================${controller.test.value}');
//           return controller.latitude.value == 0.0 ||
//                   controller.longitude.value == 0.0
//               ? Center(
//                   child: CircularProgressIndicator(),
//                 )
//               : GoogleMap(
//                   mapType: MapType.normal,
//                   initialCameraPosition: CameraPosition(
//                     target: LatLng(
//                       controller.latitude.value,
//                       controller.longitude.value,
//                     ),
//                     zoom: 15,
//                   ),
//                   myLocationEnabled: false,
//                   myLocationButtonEnabled: false,
//                   markers: controller.markers,
//                   onCameraMove: (position) {},
//                   circles: controller.circles,
//                   onMapCreated: (GoogleMapController c) async {
//                     //  controller.googleMapController.complete(c);
//                     final GoogleMapController mapController =
//                         await controller.googleMapController.future;
//                     mapController.animateCamera(
//                       CameraUpdate.newCameraPosition(
//                         CameraPosition(
//                           target: LatLng(controller.latitude.value,
//                               controller.longitude.value),
//                         ),
//                       ),
//                     );
//                   },
//                 );
//         }),
//       ),
//     );
//   }
// }
