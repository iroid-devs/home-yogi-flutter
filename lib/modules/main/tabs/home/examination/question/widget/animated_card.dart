import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:home_yogi_flutter/modules/main/tabs/home/examination/question/model/question_model.dart';
import 'package:home_yogi_flutter/modules/main/tabs/home/examination/question/viewphoto/view_photo.dart';

import '../../../../../../../models/response/home/examination_question_response.dart';
import '../../../../../../../shared/constants/colors.dart';
import '../../../../../../../shared/utils/math_utils.dart';
import '../../../../../../../shared/widgets/base_text.dart';
import '../../../../../../../shared/widgets/common_container_shadow.dart';
import '../card_animation/infinite_card_view.dart';
import '../card_animation/infinite_cards_controller.dart';
import '../question_controller.dart';
import '../takephoto/take_photo_binding.dart';
import '../takephoto/take_photo_view.dart';

class AnimatedCard extends GetView<QuestionController> {
  final ExaminationQuestionResponse questionModel;
  const AnimatedCard({Key? key, required this.questionModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    InfiniteCardsController? _infiniteCardsController;
      printInfo(info: 'build() called...');
      return _buildAnimationSlider(
          questionModel.answer!.length, _infiniteCardsController);
  }

  _buildAnimationSlider(
      int imageCount, InfiniteCardsController? _infiniteCardsController) {
    _infiniteCardsController = InfiniteCardsController(
      itemCount: _getItemCount(),
      itemBuilder: (BuildContext context, int index) {
        return questionModel.answer!.isNotEmpty
            ? _buildNetworkPhotoView(index, _infiniteCardsController)
            : questionModel.answer!.isEmpty
                ? _buildTakePhotoView1()
                : _buildTakePhotoView2(
                    imagePath: questionModel.answer![index].toString(),
                    index: index,
                    infiniteCardsController: _infiniteCardsController!);
      },
      animType: AnimType.SWITCH,
    );

    GlobalKey<State> key = GlobalKey();

    InfiniteCards infiniteCards = InfiniteCards(
      key: key,
      //width: Get.width,
      height: getSize(140),
      controller: _infiniteCardsController,
    );
    return infiniteCards;
  }

  int _getItemCount() {
    int totalItem = 0;

    if (questionModel.answer!.isNotEmpty) {
      totalItem = questionModel.answer!.length;
    } else {
      totalItem = questionModel.answer!.isEmpty
          ? 1
          : questionModel.answer!.length;
    }

    return totalItem;
  }

  Widget _buildNetworkPhotoView(
      int index, InfiniteCardsController? _infiniteCardsController) {
    return CommonContainerWithShadow(
      width: double.maxFinite,
      child: GestureDetector(
        onTap: () {
          Get.to(
            ViewPhotoScreen(
              networkImagePath: questionModel.answer![index].toString(),
            ),
          );
        },
        onPanUpdate: (details) {
          if (details.delta.dy > 0 && _infiniteCardsController!.itemCount > 1) {
            _infiniteCardsController.reset(animType: AnimType.TO_END);
            _infiniteCardsController.next();
          }
        },
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fill,
              image: NetworkImage(
                questionModel.answer![index].toString(),
              ),
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(
                getSize(14),
              ),
            ),
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  _buildTakePhotoView1() {
    return GestureDetector(
      onTap: () {
        _openCameraScreen(imagePath: '');
      },
      child: CommonContainerWithShadow(
        width: Get.width,
        height: getSize(140),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                getAssetsSVGImg('add_photo'),
              ),
              SizedBox(
                width: getSize(10.0),
              ),
              BaseText(text: 'Take Photo'),
            ],
          ),
        ),
      ),
    );
  }

  _buildTakePhotoView2(
      {required String imagePath,
      required int index,
      required InfiniteCardsController infiniteCardsController}) {
    printInfo(info: 'imagePath = $imagePath');

    return GestureDetector(
      onTap: () {
        _openCameraScreen(imagePath: imagePath, index: index);
      },
      onPanUpdate: (details) {
        if (details.delta.dy > 0 && infiniteCardsController.itemCount > 1) {
          infiniteCardsController.reset(animType: AnimType.TO_END);
          infiniteCardsController.next();
        }
      },
      child: CommonContainerWithShadow(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(
            getSize(14.0),
          ),
          child: Stack(
            children: <Widget>[
              Image.file(
                File(imagePath),
                fit: BoxFit.cover,
                width: Get.width,
                height: getSize(140),
              ),
              questionModel.answer!.length < 3
                  ? Container(
                      height: getSize(140),
                      width: Get.size.width,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            ColorConstants.darkContainerBlack.withOpacity(0),
                            ColorConstants.darkContainerBlack.withOpacity(0.8),
                          ],
                        ),
                      ),
                    )
                  : Container(),
              questionModel.answer!.length < 3
                  ? Positioned(
                      bottom: getSize(12),
                      right: getSize(12),
                      child: GestureDetector(
                        onTap: () {
                          _openCameraScreen(imagePath: '');
                        },
                        child: SvgPicture.asset(
                          getAssetsSVGImg('add_photo'),
                        ),
                      ),
                    )
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }

  _openCameraScreen({required String imagePath, int index = 0}) async {
    printInfo(info: 'imagePath = $imagePath');

    final cameras = await availableCameras();

    //Get.to(TakePhotoView(camera: cameras.first),binding: TakePhotoBinding());

    var result = await Get.to(
      TakePhotoView(
        cameraDescription: cameras.first,
        photoPath: imagePath,
      ),
      binding: TakePhotoBinding(),

      // TakePictureScreen(
      //   camera: cameras.first,
      //   imagePath: imagePath,
      // ),
    );

    printInfo(info: 'result ===> $result');

    try {
      if (result != null) {
        if (result['action'] == 'ADD') {
          printInfo(info: 'photoPath = ${result['imagePath']}');

          //controller.addImagePath(imagePath: photoPath);

          if (imagePath.isEmpty) {
            questionModel.answer!.insert(0, result['imagePath']);
          } else {
            questionModel.answer!.isNotEmpty
                ? questionModel.answer!
                    .removeAt(index) //removes the item at index
                : null;
            questionModel.answer!.insert(
              index,
              result['imagePath'],
            );
          }
        } else if (result['action'] == 'DELETE') {
          questionModel.answer!.isNotEmpty
              ? questionModel.answer!
                  .removeAt(index) //removes the item at index
              : null;
        }
      }
    } catch (e) {
      printInfo(info: e.toString());
    }
  }
}
