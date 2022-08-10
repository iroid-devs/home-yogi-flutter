import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:home_yogi_flutter/models/response/auth/user_detail_response.dart';
import 'package:home_yogi_flutter/shared/constants/png_image_constant.dart';
import 'package:home_yogi_flutter/shared/constants/storage.dart';
import 'package:home_yogi_flutter/shared/widgets/base_text.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../api/api_repository.dart';

class EditProfileController extends GetxController {
  final ApiRepository repository;
  EditProfileController({required this.repository});
  //Rx<File>? pickedImageFile =  File('path').obs ;
  final picker = ImagePicker();
  final double imageMaxWidth = Get.width;
  final double imageMaxHeight = Get.height;
  final int imageQuality = 50;
  var locationValue = ''.obs;
  var pickedImagePath = ''.obs;
  UserDetailResponse userDetailResponse = UserDetailResponse();
  String name = '';
  String email = '';
  String address = '';
  String phone = '';
  String image = '';
  TextEditingController usernameController = TextEditingController(text: '');
  TextEditingController emailController = TextEditingController(text: '');
  TextEditingController phoneController = TextEditingController(text: '21');
  TextEditingController locationController = TextEditingController(text: '');

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final prefs = Get.find<SharedPreferences>();

  void pickImage({required ImageSource imageSource}) async {
    try {
      final pickedImage = await picker.pickImage(
        source: imageSource,
        // maxWidth: imageMaxWidth,
        // maxHeight: imageMaxHeight,
        imageQuality: imageQuality,
      );

      if (pickedImage != null) {
        //pickedImageFile?.value = File(pickedImage.path) ;
        pickedImagePath.value = pickedImage.path;
        print(
            "pickedImagePath.value.....................${pickedImagePath.value}");
        File imageFile = File(pickedImage.path);

        print('File path = ${pickedImage.path}');
        print('File size = ${(imageFile.lengthSync() / 1024).toStringAsFixed(2)} KB');
      } else {
        print('No image selected.');
        Get.snackbar(
          'Error',
          'No Image Selected.',
        );
      }
    } catch (ex) {
      print('Error ===> ${ex.toString()}');
    }
  }

  getUsers() async {
   // var data = Get.put(EditProfileController);
    final prefs = Get.find<SharedPreferences>();
    if (prefs.getString(StorageConstants.userData) != null) {
      userDetailResponse = UserDetailResponse.fromJson(
        jsonDecode(prefs.getString(StorageConstants.userData)!),
      );
      name = userDetailResponse.fullname.toString();
      email = userDetailResponse.email.toString();
      address = userDetailResponse.address.toString();
      phone = userDetailResponse.phoneNumber.toString();
      image = userDetailResponse.profileImage.toString();
      if (userDetailResponse.userId != null) {
        usernameController.text = name;
        emailController.text = email;
        locationController.text = address;
        phoneController.text = phone;
        pickedImagePath.value = image;
      }
      if (userDetailResponse.phoneNumber == null) {
        phoneController.text = '';
      }
      // if(userDetailResponse.profileImage == null &&  pickedImagePath.value.isEmpty){
      //    return Image.asset(PngImageConstants.profile, fit: BoxFit.cover,);
      // }

    }
    print("userDetailResponse..........${userDetailResponse.toJson()}");
    print("profileImage..........${userDetailResponse.profileImage}");
  }

  updateProfileDetails() async {
    final formData = FormData(
      {
        //'user_id': UserMoreInfo.userInfoModel.user_id,
        "fullname": usernameController.text,
        "referralCode": "EG4GL0HE3",
        "address": locationController.text,
        "latitude": "54.26385",
        "longitude": "30.26385",
        "phoneNumber": phoneController.text,
        "profileImage": MultipartFile(pickedImagePath.value, filename: 'document.png', contentType: "multipart/png"),
       // "profileImage": pickedImagePath.value,
      },
    );
    // if(userDetailResponse.profileImage != null){
    // }
    print(
        "pickedImagePath.value....................................${pickedImagePath.value}");
    var updateUserRes = await repository.updateUserDetail(formData);
    print("userId${updateUserRes.userId}");
    if (updateUserRes.userId != null) {
      await prefs.setString(
          StorageConstants.userData, jsonEncode(updateUserRes.toJson()));
    }
  }

  @override
  void onInit() {
    getUsers();
    super.onInit();
  }
}
