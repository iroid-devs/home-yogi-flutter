import 'package:flutter/material.dart';

import '../../../../../shared/widgets/common_app_bar.dart';

class VoiceAssistantsScreen extends StatelessWidget {
  const VoiceAssistantsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        title: 'Voice assistant',

      ),
      body: SingleChildScrollView(child: _buildMainBody(),physics: BouncingScrollPhysics(),),
    );
  }

  _buildMainBody() {
    return Center(
      child: Text(
        'Voice Assistants Here...',
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
