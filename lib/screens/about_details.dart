import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shpp/shared/size_config.dart';

class AboutDetails extends StatefulWidget {
  const AboutDetails({
    super.key,
  });

  @override
  State<AboutDetails> createState() => _AboutDetailsState();
}

class _AboutDetailsState extends State<AboutDetails> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: SizeConfig.safeBlockVertical! * 5,
      ),
      child: SizedBox(
        width: SizeConfig.safeBlockHorizontal! * 70,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        FontAwesomeIcons.bolt,
                        size: SizeConfig.safeBlockVertical! * 3,
                      ),
                      SizedBox(
                        width: SizeConfig.safeBlockHorizontal! * 1.5,
                      ),
                      AutoSizeText(
                        'instalirana snaga (MW)'.toUpperCase(),
                        presetFontSizes: [
                          SizeConfig.safeBlockVertical! * 1.75,
                          SizeConfig.safeBlockVertical! * 1.25,
                          SizeConfig.safeBlockVertical! * 0.5,
                        ],
                        overflowReplacement: const SizedBox(),
                        maxLines: 5,
                        style: GoogleFonts.mulish(
                          fontWeight: FontWeight.w500,
                          color: Theme.of(context).primaryColorDark,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: SizeConfig.safeBlockVertical! * 2,
                  ),
                  AnimatedTextKit(
                    animatedTexts: [
                      TypewriterAnimatedText(
                        '50',
                        textStyle: GoogleFonts.mulish(
                          fontSize: SizeConfig.safeBlockVertical! * 2,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).primaryColorDark,
                        ),
                        speed: const Duration(milliseconds: 2000),
                      ),
                    ],
                    totalRepeatCount: 4,
                    pause: const Duration(milliseconds: 1500),
                    displayFullTextOnTap: true,
                    stopPauseOnTap: true,
                  )
                  // AutoSizeText(
                  //   '50',
                  //   presetFontSizes: [
                  //     SizeConfig.safeBlockVertical! * 2,
                  //     SizeConfig.safeBlockVertical! * 1.25,
                  //     SizeConfig.safeBlockVertical! * 0.5,
                  //   ],
                  //   overflowReplacement: const SizedBox(),
                  //   maxLines: 5,
                  //   style: GoogleFonts.mulish(
                  //     fontWeight: FontWeight.bold,
                  //     color: Theme.of(context).primaryColorDark,
                  //   ),
                  // ),
                ],
              ),
            ),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        FontAwesomeIcons.solarPanel,
                        size: SizeConfig.safeBlockVertical! * 3,
                      ),
                      SizedBox(
                        width: SizeConfig.safeBlockHorizontal! * 1.5,
                      ),
                      AutoSizeText(
                        'ZavrŠenih projekata'.toUpperCase(),
                        presetFontSizes: [
                          SizeConfig.safeBlockVertical! * 1.75,
                          SizeConfig.safeBlockVertical! * 1.25,
                          SizeConfig.safeBlockVertical! * 0.5,
                        ],
                        overflowReplacement: const SizedBox(),
                        maxLines: 5,
                        style: GoogleFonts.mulish(
                          fontWeight: FontWeight.w500,
                          color: Theme.of(context).primaryColorDark,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: SizeConfig.safeBlockVertical! * 2,
                  ),
                  AutoSizeText(
                    '27',
                    presetFontSizes: [
                      SizeConfig.safeBlockVertical! * 2,
                      SizeConfig.safeBlockVertical! * 1.25,
                      SizeConfig.safeBlockVertical! * 0.5,
                    ],
                    overflowReplacement: const SizedBox(),
                    maxLines: 5,
                    style: GoogleFonts.mulish(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColorDark,
                    ),
                  ),
                ],
              ),
            ),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        FontAwesomeIcons.landmark,
                        size: SizeConfig.safeBlockVertical! * 3,
                      ),
                      SizedBox(
                        width: SizeConfig.safeBlockHorizontal! * 1.5,
                      ),
                      AutoSizeText(
                        'godina osnivanja'.toUpperCase(),
                        presetFontSizes: [
                          SizeConfig.safeBlockVertical! * 1.75,
                          SizeConfig.safeBlockVertical! * 1.25,
                          SizeConfig.safeBlockVertical! * 0.5,
                        ],
                        overflowReplacement: const SizedBox(),
                        maxLines: 5,
                        style: GoogleFonts.mulish(
                          fontWeight: FontWeight.w500,
                          color: Theme.of(context).primaryColorDark,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: SizeConfig.safeBlockVertical! * 2,
                  ),
                  AutoSizeText(
                    '2011',
                    presetFontSizes: [
                      SizeConfig.safeBlockVertical! * 2,
                      SizeConfig.safeBlockVertical! * 1.25,
                      SizeConfig.safeBlockVertical! * 0.5,
                    ],
                    overflowReplacement: const SizedBox(),
                    maxLines: 5,
                    style: GoogleFonts.mulish(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColorDark,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
