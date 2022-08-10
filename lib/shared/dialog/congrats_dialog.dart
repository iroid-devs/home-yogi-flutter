import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:home_yogi_flutter/shared/constants/colors.dart';
import 'package:home_yogi_flutter/shared/shared.dart';
import 'package:home_yogi_flutter/shared/utils/math_utils.dart';
import 'package:home_yogi_flutter/shared/widgets/base_text.dart';

import '../widgets/base_elevated_button.dart';

class CongratsDialog extends StatelessWidget {
  const CongratsDialog({
    Key? key,
    required this.continueCallBack,
    required this.coin,
    required this.offerText,
  }) : super(key: key);

  final VoidCallback continueCallBack;

  final double borderRadius = 25.0;
  final int coin;
  final String offerText;

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
      child: Dialog(
        insetPadding: EdgeInsets.all(getSize(32.0)),
        elevation: 0,
        backgroundColor: Color(0xffffffff),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            getSize(borderRadius),
          ),
        ),
        child: Container(
          padding: EdgeInsets.all(getSize(0.0)),
          decoration: BoxDecoration(
              color: ColorConstants.dialogBlack,
              borderRadius: BorderRadius.circular(
                getSize(borderRadius),
              ),
              border: Border.all(
                color: ColorConstants.lightYellow,
                width: 1,
              ),
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 0),
                  blurRadius: 25,
                  color: ColorConstants.lightYellow.withOpacity(0.6),
                ),
              ]),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(borderRadius),
                  topRight: Radius.circular(borderRadius),
                ),
                child: Image.asset(
                  getAssetsGif('point'),
                  //width: 200,
                  //height: 200,
                  fit: BoxFit.contain,
                ),
              ),
              BaseText(
                text: 'Congratulations',
                fontWeight: FontWeight.w700,
                textAlign: TextAlign.center,
                fontSize: 24,
              ),
              SizedBox(
                height: getSize(15.0),
              ),
              BaseText(
                text: offerText,
                fontWeight: FontWeight.w500,
                textAlign: TextAlign.center,
                fontSize: 14,
              ),
              SizedBox(
                height: getSize(10.0),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Image.asset(
                      getAssetsPNGImg(
                        'coin',
                      ),
                      height: getSize(35),
                      width: getSize(35),
                    ),
                  ),
                  BaseText(
                    text: '+$coin',
                    fontWeight: FontWeight.w700,
                    textAlign: TextAlign.center,
                    fontSize: 32,
                  ),
                ],
              ),
              SizedBox(
                height: getSize(15.0),
              ),
              BaseElevatedButton(
                //width: getSize(113.0),
                onPressed: () {
                  continueCallBack();
                },
                borderRadius: BorderRadius.circular(15.0),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: BaseText(text: 'CONTINUE'),
                ),
                /* gradient: LinearGradient(
                  colors: [
                    ColorConstants.red1,
                    ColorConstants.red3,
                  ],
                ),*/
              ),
              SizedBox(
                height: getSize(20.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
