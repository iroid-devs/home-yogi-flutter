import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:home_yogi_flutter/modules/map/google_map_controller.dart';

import 'package:home_yogi_flutter/shared/constants/constants.dart';
import 'package:home_yogi_flutter/shared/constants/svg_image_constant.dart';
import 'package:home_yogi_flutter/shared/utils/math_utils.dart';
import 'package:home_yogi_flutter/shared/widgets/base_elevated_button.dart';
import 'package:home_yogi_flutter/shared/widgets/base_text.dart';
import 'package:home_yogi_flutter/shared/widgets/common_boxshadow.dart';

class GoogleMapView extends GetView<GoogleMapViewController> {
  const GoogleMapView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        (() => controller.latitude.value == 0.0 ||
                controller.longitude.value == 0.0
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Stack(
                alignment: Alignment.center,
                children: [
                  GoogleMap(
                    mapType: MapType.normal,
                    onTap: (newPosition) async {
                      print(" LAT : ${newPosition.latitude}");
                      print("LONG : ${newPosition.longitude}");

                      controller.markers.add(
                        Marker(
                          markerId: MarkerId('Home11'),
                          onTap: () async {
                            await controller.getAddressFromLatLong(
                                newPosition.latitude, newPosition.longitude);
                            print(' Marker Tapped');
                          },
                          draggable: true,
                          infoWindow: InfoWindow(
                              title: await controller.getAddressFromLatLong(
                                  newPosition.latitude, newPosition.longitude)),
                          position: LatLng(
                            newPosition.latitude,
                            newPosition.longitude,
                          ),
                          onDragEnd: ((newPosition) {
                            print(newPosition.latitude);
                            print(newPosition.longitude);
                          }),
                        ),
                      );
                    },
                    initialCameraPosition: CameraPosition(
                      target: LatLng(
                        controller.latitude.value,
                        controller.longitude.value,
                      ),
                      zoom: 15,
                    ),
                    myLocationEnabled: true,
                    myLocationButtonEnabled: false,
                    markers: controller.markers,
                    onCameraMove: (position) {},
                    compassEnabled: false,

                    // circles: controller.circles,
                    onMapCreated: (GoogleMapController c) async {
                      controller.googleMapController.complete(c);
                    },
                  ),
                  Positioned.fill(
                    bottom: getSize(40),
                    left: getSize(30),
                    right: getSize(30),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: BaseElevatedButton(
                        width: Get.width,
                        onPressed: () {
                          Get.back(result: controller.fullAddress.value);

                          // Get.bottomSheet(Container());
                        },
                        child: BaseText(
                          text: StringConstants.setHomeAddress.toUpperCase(),
                        ),
                      ),
                    ),
                  ),
                  Positioned.fill(
                    bottom: getSize(120),
                    left: getSize(30),
                    right: getSize(30),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: InkWell(
                        onTap: () async {
                          final GoogleMapController mapController =
                              await controller.googleMapController.future;
                          controller.getCurrentPosition();
                          mapController.animateCamera(
                            CameraUpdate.newCameraPosition(
                              CameraPosition(
                                target: LatLng(
                                  controller.latitude.value,
                                  controller.longitude.value,
                                ),
                                zoom: 14,
                              ),
                            ),
                          );
                        },
                        child: Container(
                          height: getSize(50),
                          width: getSize(50),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: ColorConstants.white,
                            shape: BoxShape.circle,
                            boxShadow: [
                              CommonBoxShadow.getCurrentLocationShadow()
                            ],
                          ),
                          child: SvgPicture.asset(
                            SvgImageConstants.current_location,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )),
      ),
    );
  }
}
