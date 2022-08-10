import 'package:get/get.dart';
import 'package:home_yogi_flutter/models/response/home/levels_response.dart';
import 'package:home_yogi_flutter/shared/constants/png_image_constant.dart';

import '../../../../../../api/api_repository.dart';
import 'model/level_model.dart';

class LevelController extends GetxController {
  final ApiRepository apiRepository;
  LevelController({required this.apiRepository});

  var levelsResponse = LevelsResponse().obs;

  List<LevelModel> levelModelList = [
    LevelModel(
      image: PngImageConstants.bez,
      levelText: "Level 1",
    ),
    LevelModel(
      image: PngImageConstants.bez2,
      levelText: "Level 2",
    ),
    LevelModel(
      image: PngImageConstants.bez3,
      levelText: "Level 3",
    ),
    LevelModel(
      image: PngImageConstants.bez4,
      levelText: "Level 4",
    ),
    LevelModel(
      image: PngImageConstants.bez5,
      levelText: "Level 5",
    ),
    LevelModel(
      image: PngImageConstants.bez,
      levelText: "Level 6",
    ),
    LevelModel(
      image: PngImageConstants.bez2,
      levelText: "Level 7",
      isLocked: true,
    ),
    LevelModel(
      image: PngImageConstants.bez3,
      levelText: "Level 8",
      isLocked: true,
    ),
    LevelModel(
      image: PngImageConstants.bez4,
      levelText: "Level 9",
      isLocked: true,
    ),
  ].obs;

  // getLevel()async{
  //   var res = await apiRepository.getLevels();
  //   if(res != null){
  //     levelsResponse.value = res;
  //   }
  //   print("levelsResponse===============${levelsResponse.value}");
  //   print("levelsResponse===============${levelsResponse.value.levels?[0].level ?? ""}");
  // }

  @override
  void onInit(){
   // getLevel();
    super.onInit();
  }

}
