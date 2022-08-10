import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class BookInspectionDetailController extends GetxController{

  var familyContact = 1.obs;

  var inspectionDate = '25 May 2022'.obs;

  TextEditingController locationController = TextEditingController(text: '2873 Mulberry Lane, Fort Lauderdale,Florida, 33301');

  TextEditingController userEmailController = TextEditingController(text: 'johnandrew1@gmail.com');
  TextEditingController userPhoneController = TextEditingController(text: ' 561-807-0528');

  List<TextEditingController> familyEmailControllerList = [
    TextEditingController(),
  ];

  List<TextEditingController> familyPhoneControllerList = [
    TextEditingController(),
  ];

  addFamilyMember(){
    familyEmailControllerList.add(TextEditingController(),);
    familyPhoneControllerList.add(TextEditingController(),);
    familyContact.value = familyContact.value + 1;
  }

  removeFamilyMember(int index){
    familyEmailControllerList.removeAt(index);
    familyPhoneControllerList.removeAt(index);
    familyContact.value = familyContact.value - 1;
  }

}