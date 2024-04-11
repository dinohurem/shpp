import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shpp/shared/size_config.dart';

class IconCardAbout extends StatelessWidget {
  final String title;
  final String text;
  final IconData icon;
  final bool narrowText;
  const IconCardAbout({
    super.key,
    required this.title,
    required this.icon,
    required this.text,
    this.narrowText = true,
  });

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          icon,
          color: Theme.of(context).primaryColorDark,
          size: SizeConfig.safeBlockVertical! * 3,
        ),
        SizedBox(
          height: SizeConfig.safeBlockVertical! * 1.5,
        ),
        Text(
          title,
          maxLines: 2,
          style: GoogleFonts.mulish(
            fontSize: SizeConfig.safeBlockVertical! * 1.75,
            fontWeight: FontWeight.w900,
            color: Theme.of(context).primaryColorDark,
          ),
        ),
        SizedBox(
          height: SizeConfig.safeBlockVertical! * 0.75,
        ),
        SizedBox(
          width: narrowText
              ? SizeConfig.safeBlockHorizontal! * 15
              : SizeConfig.safeBlockHorizontal! * 20,
          child: Text(
            text,
            maxLines: 8,
            overflow: TextOverflow.visible,
            style: GoogleFonts.mulish(
              fontSize: SizeConfig.safeBlockVertical! * 1.25,
              fontWeight: FontWeight.w400,
              color: Theme.of(context).primaryColorDark,
            ),
          ),
        ),
      ],
    );
  }
}
