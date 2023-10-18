import 'package:flutter/material.dart';
import 'package:shpp/shared/size_config.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Divider(
      height: 0.25,
      color: Colors.grey.withOpacity(0.15),
      indent: SizeConfig.safeBlockHorizontal! * 10,
      endIndent: SizeConfig.safeBlockHorizontal! * 10,
    );
  }
}
