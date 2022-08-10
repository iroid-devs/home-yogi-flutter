import 'package:flutter/material.dart';
import 'package:home_yogi_flutter/shared/constants/string_constant.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../../../../../shared/widgets/common_app_bar.dart';

class TermsConditionScreen extends StatelessWidget {
  const TermsConditionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        title: StringConstants.termsAndCondition,
      ),
      body: WebView(
        initialUrl: 'https://flutter.dev',
      ),
    );
  }
}
