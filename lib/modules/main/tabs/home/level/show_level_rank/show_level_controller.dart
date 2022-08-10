import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_yogi_flutter/api/api_repository.dart';
import 'package:home_yogi_flutter/models/response/home/levels_top_response.dart';
import 'package:home_yogi_flutter/modules/main/tabs/home/level/show_level_rank/model/show_level_rank_model.dart';
import 'package:home_yogi_flutter/shared/constants/colors.dart';
import 'package:home_yogi_flutter/shared/constants/png_image_constant.dart';

class ShowLevelController extends GetxController {
  final ApiRepository apiRepository;
  ShowLevelController({required this.apiRepository});

  var levelsTopResponse = LevelsTopResponse().obs;

  final List<ShowLevelRankModel> showTop3LevelRankMdel = [
    ShowLevelRankModel(
      name: 'Jane Cooper',
      rank: '2',
      medal: PngImageConstants.silver_medal,
      coin: '3050',
      colors: [
        Color(0xffEFF1F2),
        Color(0xff9E9E9E),
        Color(0xffCFCFCF),
        Color(0xff8B8682),
      ],
    ),
    ShowLevelRankModel(
      name: 'Jenny Wilson',
      rank: '1',
      medal: PngImageConstants.gold_medal,
      coin: '4000',
      colors: [
        Color(0xffFEF0A5),
        Color(0xffC9923D),
        Color(0xffFBEB81),
        Color(0xffE4A44C),
      ],
    ),
    ShowLevelRankModel(
      name: 'Esther Howard',
      rank: '3',
      medal: PngImageConstants.bronze_medal,
      coin: '2850',
      colors: [
        Color(0xffFCBB72),
        Color(0xffC37945),
        Color(0xffFEBD77),
        Color(0xffD6772F),
      ],
    ),
  ].obs;

  final List<ShowLevelRankModel> showOtherUsersLevelRankModel = [
    ShowLevelRankModel(
      name: 'Jane Cooper',
      rank: '1',
      medal: PngImageConstants.silver_medal,
      coin: '3050',
    ),
    ShowLevelRankModel(
      name: 'Jenny Wilson',
      rank: '2',
      medal: PngImageConstants.gold_medal,
      coin: '4000',
    ),
    ShowLevelRankModel(
      name: 'Esther Howard',
      rank: '3',
      medal: PngImageConstants.bronze_medal,
      coin: '2850',
    ),
    ShowLevelRankModel(
      name: 'Jane Cooper',
      rank: '4',
      medal: PngImageConstants.silver_medal,
      coin: '3050',
    ),
    ShowLevelRankModel(
      name: 'Jenny Wilson',
      rank: '5',
      medal: PngImageConstants.gold_medal,
      coin: '350',
    ),
    ShowLevelRankModel(
      name: 'Esther Howard',
      rank: '6',
      medal: PngImageConstants.bronze_medal,
      coin: '2850',
    ),
    ShowLevelRankModel(
      name: 'Jane Cooper',
      rank: '7',
      medal: PngImageConstants.silver_medal,
      coin: '3050',
      isCurrentUser: true,
    ),
    ShowLevelRankModel(
      name: 'Jenny Wilson',
      rank: '8',
      medal: PngImageConstants.gold_medal,
      coin: '350',
    ),
    ShowLevelRankModel(
      name: 'Esther Howard',
      rank: '9',
      medal: PngImageConstants.bronze_medal,
      coin: '2850',
    ),
    ShowLevelRankModel(
      name: 'Jane Cooper',
      rank: '10',
      medal: PngImageConstants.silver_medal,
      coin: '3050',
    ),
    ShowLevelRankModel(
      name: 'Jenny Wilson',
      rank: '11',
      medal: PngImageConstants.gold_medal,
      coin: '350',
    ),
    ShowLevelRankModel(
      name: 'Esther Howard',
      rank: '12',
      medal: PngImageConstants.bronze_medal,
      coin: '2850',
    ),
  ];
  getTop3RankContainerColor(int index) {
    switch (index) {
      case 0:
        return ColorConstants.silverRankColor;
      case 1:
        return ColorConstants.yellow;
      case 2:
        return ColorConstants.bronzeRankColor;
      default:
        return ColorConstants.black;
    }
  }

  getLevelsTop()async{
    var res = await apiRepository.getLevelsTop();
    if(res != null){
      levelsTopResponse.value = res;
    }
    print("levelsTopResponse List===============${levelsTopResponse.map((e) => e?.toJson())}");
  }


  @override
  void onInit() {
    getLevelsTop();
    super.onInit();
  }
}
