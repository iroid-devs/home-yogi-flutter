import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:home_yogi_flutter/shared/constants/colors.dart';
import 'package:home_yogi_flutter/shared/utils/math_utils.dart';
import 'package:home_yogi_flutter/shared/widgets/base_text.dart';

import '../constants/colors.dart';

class BaseAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Color backgroundColor = ColorConstants.darkScaffoldBackgroundColor;
  final Widget? leading;
  final String title;
  final List<Widget>? actions;

  /// you can add more fields that meet your needs

  BaseAppBar({
    Key? key,
    required this.title,
    this.leading,
    this.actions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: leading ?? _buildLeadingView(),
      title: BaseText(
        text: title,
        fontSize: 22,
        fontWeight: FontWeight.w500,
      ),
      backgroundColor: backgroundColor,
      elevation: 0,
      actions: actions,
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(60);

  _buildLeadingView() {
    return IconButton(
      icon: SvgPicture.asset(
        getAssetsSVGImg('arrow_left'),
      ),
      onPressed: () => Get.back(),
    );
  }
}
