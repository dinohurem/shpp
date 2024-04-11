import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';
import 'package:shpp/shared/action_button.dart';
import 'package:shpp/shared/size_config.dart';

class Showcase extends StatefulWidget {
  GlobalKey globalKey;
  Showcase({
    super.key,
    required this.globalKey,
  });

  @override
  State<Showcase> createState() => _ShowcaseState();
}

class _ShowcaseState extends State<Showcase> {
  int _focusedIndex = 0;
  final List<String> _images = [
    'assets/images/panels.jpg',
    'assets/images/panels2.jpg',
    'assets/images/panels3.jpg',
    'assets/images/panels.jpg',
    'assets/images/panels2.jpg',
  ];

  final ScrollController _scrollController = ScrollController();

  void _onItemFocus(int index) {
    setState(() {
      _focusedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: SizeConfig.safeBlockVertical! * 5,
      ),
      child: SizedBox(
        key: widget.globalKey,
        width: SizeConfig.safeBlockHorizontal! * 70,
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'PROJEKTI'.toUpperCase(),
                style: GoogleFonts.mulish(
                  fontSize: SizeConfig.safeBlockVertical! * 1.5,
                  fontWeight: FontWeight.w700,
                  color: Theme.of(context).primaryColorDark,
                ),
              ),
              SizedBox(
                height: SizeConfig.safeBlockVertical! * 3,
              ),
              SizedBox(
                height: SizeConfig.safeBlockVertical! * 70,
                child: Row(
                  children: [
                    InkWell(
                        onTap: () {
                          _scrollController.animateTo(
                              _scrollController.offset +
                                  SizeConfig.safeBlockHorizontal! * -60,
                              duration: const Duration(seconds: 1),
                              curve: Curves.easeInOutCubic);
                        },
                        child: const Icon(
                          FontAwesomeIcons.arrowLeft,
                        )),
                    Flexible(
                      child: SizedBox(
                        height: SizeConfig.safeBlockVertical! * 60,
                        child: ScrollSnapList(
                          onItemFocus: _onItemFocus,
                          listController: _scrollController,
                          shrinkWrap: true,
                          itemCount: 5,
                          itemSize: SizeConfig.safeBlockHorizontal! * 60,
                          focusOnItemTap: true,
                          curve: Curves.ease,
                          scrollDirection: Axis.horizontal,
                          padding: EdgeInsets.symmetric(
                            horizontal: SizeConfig.safeBlockHorizontal! * 3,
                          ),
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: SizeConfig.safeBlockHorizontal! * 2,
                              ),
                              child: MouseRegion(
                                cursor: SystemMouseCursors.click,
                                child: Container(
                                  height: SizeConfig.safeBlockVertical! * 60,
                                  width: SizeConfig.safeBlockHorizontal! * 55,
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 2,
                                        blurRadius: 3,
                                      ),
                                    ],
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(
                                          SizeConfig.safeBlockHorizontal! * 5),
                                    ),
                                    image: DecorationImage(
                                      image: AssetImage(_images[index]),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    InkWell(
                        onTap: () {
                          _scrollController.animateTo(
                              _scrollController.offset +
                                  SizeConfig.safeBlockHorizontal! * 50,
                              duration: const Duration(seconds: 1),
                              curve: Curves.easeInOutCubic);
                        },
                        child: const Icon(
                          FontAwesomeIcons.arrowRight,
                        )),
                  ],
                ),
              ),
              SizedBox(
                height: SizeConfig.safeBlockVertical! * 3,
              ),
              SizedBox(
                height: SizeConfig.safeBlockVertical! * 10,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: AutoSizeText(
                        'Očuvanje prirode i zaštita okoline su\naktivnosti koje nemaju alternativu',
                        presetFontSizes: [
                          SizeConfig.safeBlockVertical! * 3,
                          SizeConfig.safeBlockVertical! * 1.5,
                          SizeConfig.safeBlockVertical! * 1.25,
                          SizeConfig.safeBlockVertical! * 0.75,
                        ],
                        overflowReplacement: const SizedBox(),
                        maxLines: 4,
                        style: GoogleFonts.mulish(
                          fontWeight: FontWeight.w800,
                          color: Theme.of(context).primaryColorDark,
                        ),
                      ),
                    ),
                    Flexible(
                      child: AutoSizeText(
                        'Proizvodnjom iz obnovljivih izvora čuvamo prirodu i štitimo okolinu. Mi ćemo biti Vaš najbolji saveznik u smanjenju Vaših troškova.\nUgradnjom najnovijih svjetskih tehnologija do bolje energetske efikasnosti.',
                        presetFontSizes: [
                          SizeConfig.safeBlockVertical! * 1.5,
                          SizeConfig.safeBlockVertical! * 1.25,
                          SizeConfig.safeBlockVertical! * 0.75,
                          SizeConfig.safeBlockVertical! * 0.5,
                        ],
                        overflowReplacement: const SizedBox(),
                        maxLines: 5,
                        style: GoogleFonts.mulish(
                          fontWeight: FontWeight.w500,
                          color: Theme.of(context).primaryColorDark,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: SizeConfig.safeBlockVertical! * 3,
              ),
              ActionButton(
                text: 'Svi naši projekti',
                onTap: () {
                  GoRouter.of(context).go('/about');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
