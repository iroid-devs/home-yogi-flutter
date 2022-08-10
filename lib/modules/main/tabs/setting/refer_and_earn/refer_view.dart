import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:home_yogi_flutter/shared/constants/colors.dart';
import 'package:home_yogi_flutter/shared/constants/string_constant.dart';
import 'package:home_yogi_flutter/shared/widgets/base_elevated_button.dart';
import 'package:home_yogi_flutter/shared/widgets/base_text.dart';
import 'package:share_plus/share_plus.dart';
import '../../../../../shared/utils/math_utils.dart';
import '../../../../../shared/widgets/common_app_bar.dart';
import '../../../../../shared/widgets/common_container_shadow.dart';

class ReferScreen extends StatelessWidget {
  const ReferScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        title: StringConstants.referAndEarn,
      ),
      body: SingleChildScrollView(
        child: _buildMainBody(),
        physics: BouncingScrollPhysics(),
      ),
    );
  }

  _buildMainBody() {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: getSize(40.0),
        vertical: getSize(0.0),
      ),
      child: Column(
        children: [
          Center(
            /*child: Image.asset(
              getAssetsPNGImg('refer'),
            ),*/
            child: Image.asset(
              getAssetsGif('reward'),
              //width: 200,
              //height: 200,
              fit: BoxFit.contain,
            ),
          ),
          Text.rich(
            TextSpan(
              children: <InlineSpan>[
                TextSpan(
                  text: 'Refer to get',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                WidgetSpan(
                  //alignment: ui.PlaceholderAlignment.middle,
                  /*child: Icon(
                    Icons.ten_k,
                    color: Colors.red,
                    size: 30,
                  ),*/
                  child: Image.asset(
                    getAssetsPNGImg('coin'),
                  ),
                ),
                TextSpan(
                  text: '100 points',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 40),
          ),
          SizedBox(
            height: getSize(15.0),
          ),
          BaseText(
            text:
                'Share your referral code to get 100 points once your friends activate their account.',
            textAlign: TextAlign.center,
            fontSize: 14,
            textColor: ColorConstants.white.withOpacity(0.8),
          ),
          SizedBox(
            height: getSize(40.0),
          ),
          CommonContainerWithShadow(
            height: 50,
            width: double.maxFinite,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                BaseText(
                  text: 'HY2022045',
                  fontSize: 18,
                ),
                SizedBox(
                  width: 10,
                ),
                InkWell(
                  onTap: () {
                    Clipboard.setData(
                      ClipboardData(text: "HY2022045"),
                    );
                    Fluttertoast.showToast(
                      msg: "Copied Successfully",
                      textColor: ColorConstants.greenColor,// message
                      toastLength: Toast.LENGTH_SHORT, // length
                      gravity: ToastGravity.BOTTOM, // location// duration
                    );
                  },
                  child: SvgPicture.asset(
                    getAssetsSVGImg('copy'),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: getSize(30.0),
          ),
          BaseElevatedButton(
            onPressed: () {
              _onShare(Get.context!);
            },
            child: BaseText(
              text: StringConstants.buttonShare.toUpperCase(),
            ),
            width: double.maxFinite,
            borderRadius: BorderRadius.circular(getSize(10.0),),
          ),
        ],
      ),
    );
  }

  _onShare(BuildContext context) async {
    Share.share('check out my app https://example.com',
        subject: 'Look what I made!');
  }
}
