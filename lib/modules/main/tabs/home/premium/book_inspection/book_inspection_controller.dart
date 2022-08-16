import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:home_yogi_flutter/models/response/premium/book_inspection_response.dart';
import '../../../../../../api/api_repository.dart';
import '../../../../../../shared/constants/colors.dart';
import '../../../../../../shared/constants/string_constant.dart';
import '../../../../../../shared/constants/svg_image_constant.dart';

class BookInspectionController extends GetxController {
  final ApiRepository apiRepository;
  BookInspectionController({required this.apiRepository});
  TextEditingController locationController = TextEditingController(
      text: '2873 Mulberry Lane, Fort Lauderdale,Florida, 33301');

  var bookInspectionResponse = <BookInspectionResponse>[].obs;

  List<InspectionExamModel> examinationModelList = [

    InspectionExamModel(
      image: SvgImageConstants.spring,
      titleText: StringConstants.spring,
      imageHeight: 45,
      imageWidth: 38,
      isLocked: false,
      gradientContainerColor: [
        ColorConstants.springGradiant1,
        ColorConstants.springlGradiant2,
      ],
      date: '25 May 2022',
      time: '9 AM',
    ),

    InspectionExamModel(
      image: SvgImageConstants.summer,
      titleText: StringConstants.summer,
      imageHeight: 28,
      imageWidth: 39.02,
      isLocked: true,
      gradientContainerColor: [
        ColorConstants.summerGradient1,
        ColorConstants.summerGradient2,
      ],
      date: '25 Aug 2022',
      time: '9 AM',
    ),
    InspectionExamModel(
      image: SvgImageConstants.fall,
      titleText: StringConstants.fall,
      imageHeight: 32.4,
      imageWidth: 32.43,
      isLocked: true,
      gradientContainerColor: [
        ColorConstants.fallGradiant1,
        ColorConstants.fallGradiant2,
      ],
      date: '25 Nov 2022',
      time: '9 AM',
    ),
    InspectionExamModel(
      image: SvgImageConstants.winter,
      titleText: StringConstants.winter,
      imageHeight: 38,
      imageWidth: 32.43,
      isLocked: true,
      gradientContainerColor: [
        ColorConstants.winterGradiant1,
        ColorConstants.winterGradiant2,
      ],
      date: '25 Feb 2023',
      time: '9 AM',
    ),
  ];

  getBookInspection() async {
    var res1 = await apiRepository.getBookInspection();
    if (res1 != null && res1.isNotEmpty) {
    bookInspectionResponse.value = res1;
    }
    // currentMonthRange.value =
    // ("${bookInspectionResponse.firstWhere((element) => element.isLocked == false).startMonth ?? ""} - ${examinationResponse.firstWhere((element) => element.isLocked == false).endMonth ?? ""}");
    // currentMonthRange1.value =
    // ("${bookInspectionResponse.firstWhere((element) => element.isLocked == true).startMonth ?? ""} - ${examinationResponse.firstWhere((element) => element.isLocked == true).endMonth ?? ""}");

    // for (var i = 0; i < examinationResponse.length; i++) {
    //   if (examinationResponse[i].isLocked == false) {
    //     currentMonthRange.value = examinationResponse[i].startMonth??"mjh";
    //   }
    // }
    //  // print("examinationResponse===============$examinationResponse");
    //  print("examinationResponse List===============${examinationResponse.map((e) => e.toJson())}");
  }

  @override
  void onInit() {
    getBookInspection();
    super.onInit();
  }

}

class InspectionExamModel {
  final String image;
  final String titleText;
  final List<Color>? gradientBorderColor;
  final List<Color>? gradientContainerColor;
  final double imageHeight;
  final double imageWidth;
  final bool isLocked;
  final String date;
  final String time;

  InspectionExamModel({
    required this.image,
    required this.titleText,
    required this.isLocked,
    this.gradientBorderColor,
    this.gradientContainerColor,
    required this.imageHeight,
    required this.imageWidth,
    required this.date,
    required this.time,
  });



}
