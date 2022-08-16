import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:home_yogi_flutter/modules/main/tabs/home/premium/book_inspection/book_inspection_detail/book_inspection_detail_binding.dart';
import 'package:home_yogi_flutter/modules/main/tabs/home/premium/book_inspection/book_inspection_detail/book_inspection_detail_view.dart';
import 'package:home_yogi_flutter/modules/main/tabs/home/premium/book_inspection/widget/common_examination_widget.dart';
import 'package:intl/intl.dart';

import '../../../../../../models/response/premium/book_inspection_response.dart';
import '../../../../../../routes/app_pages.dart';
import '../../../../../../shared/constants/colors.dart';
import '../../../../../../shared/constants/string_constant.dart';
import '../../../../../../shared/utils/math_utils.dart';
import '../../../../../../shared/widgets/base_text.dart';
import '../../../../../../shared/widgets/common_app_bar.dart';
import '../../../../../../shared/widgets/common_container_shadow.dart';
import 'book_inspection_controller.dart';

class BookInspectionView extends GetView<BookInspectionController> {
  const BookInspectionView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        title: 'Book inspection',
      ),
      body: SingleChildScrollView(
        child: _buildMainBody(),
        physics: BouncingScrollPhysics(),
      ),
    );
  }

  _buildMainBody() {
    return Container(
      margin: EdgeInsets.all(
        getSize(20.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BaseText(
                text: StringConstants.address,
                fontSize: 14,
                textColor: Colors.white,
              ),
              GestureDetector(
                onTap: () {
                  Get.toNamed(Routes.EDIT_PROFILE);
                },
                child: BaseText(
                  text: 'Edit',
                  fontSize: 14,
                  textColor: ColorConstants.progressColor,
                ),
              ),
            ],
          ),
          SizedBox(
            height: getSize(15.0),
          ),
          CommonContainerWithShadow(
            padding: EdgeInsets.all(
              getSize(10.0),
            ),
            height: getSize(70),
            child: Row(
              children: [
                SvgPicture.asset(
                  getAssetsSVGImg('location'),
                ),
                SizedBox(
                  width: getSize(10.0),
                ),
                Expanded(
                  child: BaseText(
                    text: '2873 Mulberry Lane, Fort Lauderdale,Florida, 33301',
                    maxLines: 2,
                    fontSize: 14,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: getSize(30.0),
          ),
          BaseText(
            text: 'Our propose exam dates',
            fontSize: 14,
          ),
          SizedBox(
            height: getSize(10.0),
          ),
          Obx(() {
            return _buildListView();
          }),
        ],
      ),
    );
  }

  _buildListView() {
    return ListView.builder(
      shrinkWrap: true,
      physics: BouncingScrollPhysics(),
      itemCount: controller.bookInspectionResponse.length,
      itemBuilder: (context, index) {
        return _buildListItem(controller.bookInspectionResponse[index]);
      },
    );
  }

  _buildListItem(BookInspectionResponse bookInspectionResponse) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: getSize(12)),
      child: CommonExaminationWidget(
        image: Image.network(
          bookInspectionResponse.iconImage.toString(),
          height: getSize(39),
        ),
        // SvgPicture.asset(
        //   bookInspectionResponse.image,
        //   height: inspectionExamModel.imageHeight,
        //   width: inspectionExamModel.imageWidth,
        // ),
        titleText: bookInspectionResponse.name.toString(),
        isLocked: bookInspectionResponse.isLocked!,
        height: getSize(73),
        width: getSize(73),
        gradientContainerColor: bookInspectionResponse.gradientContainerColor,
        onClickCallback: bookInspectionResponse.isLocked!
            ? null
            : () {
          //Get.toNamed(Routes.BOOK_INSPECTION_DETAIL);
          Get.to(BookInspectionDetailView(
            bookInspectionResponse: bookInspectionResponse,),
              binding: BookInspectionDetailBinding());
        },
        date: DateFormat('dd/MM/yyyy').format(
            DateTime.fromMillisecondsSinceEpoch(bookInspectionResponse.inspectionDate ?? 0)),
        time:  DateFormat('hh:mm').format(
          DateTime.fromMillisecondsSinceEpoch(bookInspectionResponse.inspectionDate ?? 0),
        ),
        //time: inspectionExamModel.time,
      ),
    );
  }

}


// class BookInspectionView extends GetView<BookInspectionController> {
//   const BookInspectionView({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: BaseAppBar(
//         title: 'Book inspection',
//       ),
//       body: SingleChildScrollView(
//         child: _buildMainBody(),
//         physics: BouncingScrollPhysics(),
//       ),
//     );
//   }
//
//   _buildMainBody() {
//     return Container(
//       margin: EdgeInsets.all(
//         getSize(20.0),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               BaseText(
//                 text: StringConstants.address,
//                 fontSize: 14,
//                 textColor: Colors.white,
//               ),
//               GestureDetector(
//                 onTap: (){
//                   Get.toNamed(Routes.EDIT_PROFILE);
//                 },
//                 child: BaseText(
//                   text: 'Edit',
//                   fontSize: 14,
//                   textColor: ColorConstants.progressColor,
//                 ),
//               ),
//             ],
//           ),
//           SizedBox(
//             height: getSize(15.0),
//           ),
//           CommonContainerWithShadow(
//             padding: EdgeInsets.all(
//               getSize(10.0),
//             ),
//             height: getSize(70),
//             child: Row(
//               children: [
//                 SvgPicture.asset(
//                   getAssetsSVGImg('location'),
//                 ),
//                 SizedBox(
//                   width: getSize(10.0),
//                 ),
//                 Expanded(
//                   child: BaseText(
//                     text: '2873 Mulberry Lane, Fort Lauderdale,Florida, 33301',
//                     maxLines: 2,
//                     fontSize: 14,
//                     overflow: TextOverflow.ellipsis,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           SizedBox(
//             height: getSize(30.0),
//           ),
//           BaseText(
//             text: 'Our propose exam dates',
//             fontSize: 14,
//           ),
//           SizedBox(
//             height: getSize(10.0),
//           ),
//           _buildListView(),
//         ],
//       ),
//     );
//   }
//
//   _buildListView() {
//     return ListView.builder(
//       shrinkWrap: true,
//       physics: BouncingScrollPhysics(),
//       itemCount: controller.examinationModelList.length,
//       itemBuilder: (context, index) {
//         return _buildListItem(controller.examinationModelList[index]);
//       },
//     );
//   }
//
//   _buildListItem(InspectionExamModel inspectionExamModel) {
//     return Padding(
//       padding: EdgeInsets.symmetric(vertical: getSize(12)),
//       child: CommonExaminationWidget(
//         image: SvgPicture.asset(
//           inspectionExamModel.image,
//           height: inspectionExamModel.imageHeight,
//           width: inspectionExamModel.imageWidth,
//         ),
//         titleText: inspectionExamModel.titleText,
//         isLocked: inspectionExamModel.isLocked,
//         height: getSize(73),
//         width: getSize(73),
//         gradientContainerColor: inspectionExamModel.gradientContainerColor,
//         onClickCallback: inspectionExamModel.isLocked
//             ? null
//             : () {
//           //Get.toNamed(Routes.BOOK_INSPECTION_DETAIL);
//           Get.to(BookInspectionDetailView(inspectionExamModel: inspectionExamModel,),binding: BookInspectionDetailBinding());
//         },
//         date: inspectionExamModel.date,
//         time: inspectionExamModel.time,
//       ),
//     );
//   }
// }
