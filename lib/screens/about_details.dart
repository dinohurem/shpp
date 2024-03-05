import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shpp/shared/size_config.dart';
import 'package:visibility_detector/visibility_detector.dart';

class AboutDetails extends StatefulWidget {
  const AboutDetails({
    super.key,
  });

  @override
  State<AboutDetails> createState() => _AboutDetailsState();
}

class _AboutDetailsState extends State<AboutDetails>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<int> _animationPower;
  late Animation<int> _animationProjects;
  late Animation<int> _animationYears;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );

    _animationPower = StepTween(begin: 0, end: 8200).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeIn),
    );
    _animationProjects = StepTween(begin: 0, end: 37).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeIn),
    );
    _animationYears = StepTween(begin: 0, end: 2011).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeIn),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _startAnimation() {
    _controller.reset();
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: SizeConfig.safeBlockVertical! * 5,
      ),
      child: VisibilityDetector(
        key: const Key('counter'),
        onVisibilityChanged: (info) {
          if (info.visibleFraction > 0.5) _startAnimation();
        },
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
                          'instalirana snaga (kWp)'.toUpperCase(),
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
                    AnimatedBuilder(
                        animation: _animationPower,
                        builder: (context, snapshot) {
                          return AutoSizeText(
                            '${_animationPower.value}',
                            presetFontSizes: [
                              SizeConfig.safeBlockVertical! * 1.75,
                              SizeConfig.safeBlockVertical! * 1.25,
                              SizeConfig.safeBlockVertical! * 0.5,
                            ],
                            overflowReplacement: const SizedBox(),
                            maxLines: 5,
                            style: GoogleFonts.mulish(
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).primaryColorDark,
                            ),
                          );
                        }),
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
                    AnimatedBuilder(
                        animation: _animationProjects,
                        builder: (context, snapshot) {
                          return AutoSizeText(
                            '${_animationProjects.value}',
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
                          );
                        }),
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
                    AnimatedBuilder(
                        animation: _animationYears,
                        builder: (context, snapshot) {
                          return AutoSizeText(
                            '${_animationYears.value}',
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
                          );
                        }),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
