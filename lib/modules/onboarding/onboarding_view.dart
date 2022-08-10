import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'package:home_yogi_flutter/modules/onboarding/onboarding_controller.dart';
import 'package:home_yogi_flutter/routes/app_pages.dart';
import 'package:home_yogi_flutter/shared/constants/constants.dart';
import 'package:home_yogi_flutter/shared/constants/png_image_constant.dart';
import 'package:home_yogi_flutter/shared/constants/svg_image_constant.dart';
import 'package:home_yogi_flutter/shared/utils/math_utils.dart';
import 'package:home_yogi_flutter/shared/widgets/base_elevated_button.dart';
import 'package:home_yogi_flutter/shared/widgets/base_text.dart';

import '../auth/login/sign_in_with_email/sign_in_with_email.dart';
import '../auth/login/sign_in_with_email/sign_in_with_email_binding.dart';
import 'widgets/common_onboarding_page.dart';

class OnboardingView extends GetView<OnboardingController> {
  const OnboardingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Obx(
      () => Stack(
        alignment: Alignment.center,
        children: <Widget>[
          PageView.builder(
            controller: controller.pageViewController,
            physics: BouncingScrollPhysics(),
            itemCount: controller.introImages.length,
            onPageChanged: (index) {
              controller.currentPage.value = index;
            },
            itemBuilder: (BuildContext context, int index) {
              if (index == 4) {
                return getHomeScreenImage();
              } else {
                return getIntroBackgroundImage(index);
              }
            },
          ),
          OnboardingPageWidget(
            titleText: controller.titles[controller.currentPage.value.toInt()],
            routineCount:
                controller.routineCount[controller.currentPage.value.toInt()],
          ),
          Positioned(
            bottom:
                controller.currentPage.value == 4 ? getSize(130) : getSize(110),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: indicator(),
            ),
          ),
          Positioned.fill(
            bottom: getSize(30),
            //right: getSize(35),
            child: controller.currentPage.value == 4
                ? Align(
                    alignment: Alignment.bottomCenter,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: getSize(30)),
                          child: BaseElevatedButton(
                            onPressed: () async{
                                await controller.prefs.setBool(
                                    StorageConstants.showOnBoarding, true);
                                Get.off(SignInWithEmailScreen(), binding: SignInWithEmailBindings());
                            },
                            child: BaseText(
                                text: StringConstants.continued.toUpperCase()),
                          ),
                        ),
                      ],
                    ),
                  )
                : Align(
                    alignment: Alignment.bottomRight,
                    child: InkWell(
                      onTap: () async {
                        await controller.pageViewController.nextPage(
                          duration: Duration(milliseconds: 400),
                          curve: Curves.easeIn,
                        );
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          BaseText(
                            text: "Next",
                            fontSize: 16,
                          ),
                          SizedBox(
                            width: getSize(10),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top:getSize(4), right: getSize(30)),
                            child: SvgPicture.asset(
                              SvgImageConstants.arrowRight,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
          )
        ],
      ),
      // body: PageView(
      //   children: [
      //     OnboardingPageWidget(
      //       image: PngImageConstants.intro_spring,
      //       titleText: 'Spring',
      //       routineCount: '60',
      //     ),
      //     OnboardingPageWidget(
      //       image: PngImageConstants.intro_summer,
      //       titleText: 'Summer',
      //       routineCount: '40',
      //     ),
      //     OnboardingPageWidget(
      //       image: PngImageConstants.intro_fall,
      //       titleText: 'Fall',
      //       routineCount: '50',
      //     ),
      //     OnboardingPageWidget(
      //       image: PngImageConstants.intro_winter,
      //       titleText: 'Winter',
      //       routineCount: '70',
      //     ),
      //   ],
      // ),
    ));
  }

  List<Widget> indicator() => List<Widget>.generate(
        controller.introImages.length,
        (index) => Container(
          margin: EdgeInsets.symmetric(horizontal: getSize(6)),
          height: getSize(10),
          width: getSize(10),
          decoration: BoxDecoration(
            color: controller.currentPage.round() == index
                ? ColorConstants.white
                : ColorConstants.white.withOpacity(0.2),
            shape: BoxShape.circle,
          ),
        ),
      );

  getIntroBackgroundImage(index) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(controller.introImages[index]),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  getHomeScreenImage() {
    return Padding(
      padding: EdgeInsets.only(
        bottom: getSize(140),
        left: getSize(90),
        right: getSize(90),
      ),
      child: Image.asset(
        PngImageConstants.splashHome,
      ),
    );
  }
}
// class OnBoarDingScreen extends StatefulWidget {
//   const OnBoarDingScreen({Key? key}) : super(key: key);
//   @override
//   State<OnBoarDingScreen> createState() => _OnBoarDingScreenState();
// }

// class _OnBoarDingScreenState extends State<OnBoarDingScreen> {
//   int pageIndex = 0;
//   int currentPage = 0;
//   PageController controller = PageController(
//     initialPage: 0,
//   );

//   @override
//   void dispose() {
//     controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       alignment: Alignment.center,
//       children: [
//         PageView(
//           physics: currentPage == 4
//               ? NeverScrollableScrollPhysics()
//               : BouncingScrollPhysics(),
//           controller: controller,
//           onPageChanged: (value) {
//             setState(
//               () {
//                 currentPage = value;
//               },
//             );
//           },
//           children: [
//             commonImage(image: PngImageConstants.intro_spring),
//             commonImage(image: PngImageConstants.intro_summer),
//             commonImage(image: PngImageConstants.intro_fall),
//             commonImage(image: PngImageConstants.intro_winter),
//             HomeYogiOnBoardingScreen(),
//           ],
//         ),
//         currentPage == 0
//             ? commonPageView(
//                 titleText: 'Spring',
//                 introText:
//                     'Your home has 60 routine tasks needing attention every spring',
//               )
//             : currentPage == 1
//                 ? commonPageView(
//                     titleText: 'Summer',
//                     introText:
//                         'Your home has 40 routine tasks needing attention every summer',
//                   )
//                 : currentPage == 2
//                     ? commonPageView(
//                         titleText: 'Fall',
//                         introText:
//                             'Your home has 50 routine tasks needing attention every fall',
//                       )
//                     : currentPage == 3
//                         ? commonPageView(
//                             titleText: 'Winter',
//                             introText:
//                                 'Your home has 70 routine tasks needing attention every winter',
//                           )
//                         : currentPage == 4
//                             ? commonPageView(
//                                 titleText: '',
//                                 introText: '',
//                               )
//                             : BaseText(
//                                 text: "NA",
//                               )
//       ],
//     );
//   }

//   commonImage({required String image}) {
//     return Container(
//       decoration: BoxDecoration(
//         image: DecorationImage(
//           image: AssetImage(image),
//           fit: BoxFit.fill,
//         ),
//       ),
//     );
//   }

//   commonPageView({required String titleText, required String introText}) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: [
//         //Spacer(),
//         SizedBox(
//           height: getSize(50),
//         ),
//         currentPage == 4
//             ? BaseText(
//                 text: "Home Yogi",
//                 fontSize: 46,
//                 textColor: ColorConstants.white,
//                 fontWeight: FontWeight.w500,
//                 // fontFamily: 'Rochester',
//               )
//             : Text(
//                 titleText,
//                 style: TextStyle(
//                   fontSize: 46,
//                   fontFamily: 'Rochester',
//                   fontWeight: FontWeight.w400,
//                   color: Colors.black,
//                   shadows: <Shadow>[
//                     Shadow(
//                       offset: Offset(4.0, 2.0),
//                       blurRadius: 3.0,
//                       color: Color.fromARGB(50, 0, 0, 0),
//                     ),
//                   ],
//                 ),
//               ),
//         Spacer(
//           flex: 6,
//         ),
//         Padding(
//           padding: EdgeInsets.symmetric(horizontal: 50),
//           child: BaseText(
//             // lineHeight: 0.5,
//             textAlign: TextAlign.center,
//             text: introText,
//             fontSize: 26,
//             fontWeight: FontWeight.w600,
//           ),
//         ),
//         currentPage == 4
//             ? Spacer(
//                 flex: 10,
//               )
//             : Spacer(),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: List.generate(5, (index) => commonCircle(index: index)),
//         ),
//         Spacer(),
//         currentPage == 4
//             ? Padding(
//                 padding: EdgeInsets.only(bottom: 34),
//                 child: BaseElevatedButton(
//                   width: getSize(375),
//                   onPressed: () {
//                     Get.to(
//                       SignInWithEmailScreen(),
//                       binding: SignInWithEmailBindings(),
//                     );
//                   },
//                   child: BaseText(
//                     text: "CONTINUE",
//                   ),
//                 ),
//               )
//             : Padding(
//                 padding: EdgeInsets.only(right: 30, bottom: 34),
//                 child: InkWell(
//                   onTap: () {
//                     controller.nextPage(
//                         duration: Duration(seconds: 1),
//                         curve: Curves.bounceInOut);
//                   },
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.end,
//                     children: [
//                       BaseText(
//                         text: "Next",
//                         fontSize: 16,
//                       ),
//                       SizedBox(
//                         width: getSize(10),
//                       ),
//                       SvgPicture.asset(
//                         SvgImageConstants.arrowRight,
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//       ],
//     );
//   }

//   commonCircle({required int index}) {
//     return Container(
//       margin: EdgeInsets.only(right: 5),
//       height: 8,
//       width: 8,
//       decoration: BoxDecoration(
//         color: currentPage == index
//             ? ColorConstants.white
//             : ColorConstants.white.withOpacity(0.2),
//         borderRadius: BorderRadius.circular(50),
//         // border: Border.all(color: ColorConstants.white),
//       ),
//     );
//   }
// }
