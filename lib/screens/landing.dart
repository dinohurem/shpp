import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shpp/shared/action_button.dart';
import 'package:shpp/shared/carousel_with_wrap_around.dart';
import 'package:shpp/shared/router.dart';
import 'package:shpp/shared/size_config.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Landing extends StatefulWidget {
  final GlobalKey aboutKey;
  const Landing({
    super.key,
    required Key globalKey,
    required this.aboutKey,
  });

  @override
  State<Landing> createState() => _LandingState();
}

class _LandingState extends State<Landing> {
  // ignore: prefer_final_fields

  final List<String> images = [
    'assets/images/att.png',
    'assets/images/promo.jpg',
    'assets/images/edelstahl.png',
    'assets/images/violeta.png',
    'assets/images/mba.png',
    'assets/images/migg.png',
    'assets/images/madi.png',
    'assets/images/mdg.png',
    'assets/images/cet.jpg',
    'assets/images/kasmir.png',
    'assets/images/kenda.png',
    'assets/images/icrni.png',
    'assets/images/saplast.png',
    'assets/images/rolling.png',
    'assets/images/genena.png',
    'assets/images/intercamp.png',
    'assets/images/alufinal.png',
    'assets/images/omc.png',
    'assets/images/ferplast.png',
    'assets/images/centrotrans.png',
    'assets/images/spectron.png',
  ];

  void _scrollToSection(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Future.delayed(Duration.zero, () {
        Scrollable.ensureVisible(
          key.currentContext!,
          duration: const Duration(seconds: 2),
          curve: Curves.easeInOutCubic,
          alignment: .5,
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Center(
      key: widget.key,
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: SizeConfig.safeBlockVertical! * 2,
        ),
        child: SizedBox(
          height: SizeConfig.safeBlockVertical! * 90,
          width: SizeConfig.safeBlockHorizontal! * 70,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: SizeConfig.safeBlockVertical! * 5,
                        ),
                        Text(
                          AppLocalizations.of(context)!
                              .putem_obnovljive_energije_ka_odrzivoj_buducnosti,
                          style: GoogleFonts.mulish(
                            fontSize: SizeConfig.safeBlockVertical! * 4,
                            fontWeight: FontWeight.w800,
                            color: Theme.of(context).primaryColorDark,
                          ),
                        ),
                        SizedBox(
                          height: SizeConfig.safeBlockVertical! * 3,
                        ),
                        Text(
                          AppLocalizations.of(context)!
                              .saznajte_vise_o_obnovljivim_izvorima_energije_sa_shppom,
                          style: GoogleFonts.mulish(
                            fontSize: SizeConfig.safeBlockVertical! * 1.75,
                            fontWeight: FontWeight.w400,
                            color: Theme.of(context).primaryColorDark,
                          ),
                        ),
                        SizedBox(
                          height: SizeConfig.safeBlockVertical! * 4,
                        ),
                        ActionButton(
                          text: AppLocalizations.of(context)!.saznaj_vise,
                          onTap: () {
                            _scrollToSection(widget.aboutKey);
                            router.goNamed(AppRouteNames.about.name);
                          },
                        ),
                      ],
                    ),
                  ),
                  Flexible(
                    child: Column(
                      children: [
                        Container(
                          height: SizeConfig.safeBlockVertical! * 65,
                          width: SizeConfig.safeBlockHorizontal! * 25,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 1.5,
                                blurRadius: 2,
                              ),
                            ],
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(
                                  SizeConfig.safeBlockHorizontal! * 20),
                              topRight: Radius.circular(
                                  SizeConfig.safeBlockHorizontal! * 20),
                              bottomLeft: Radius.circular(
                                  SizeConfig.safeBlockHorizontal! * 20),
                              bottomRight: Radius.circular(
                                  SizeConfig.safeBlockHorizontal! * 10),
                            ),
                            image: const DecorationImage(
                              image: AssetImage('images/panels.jpg'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(
                height: SizeConfig.safeBlockVertical! * 3,
              ),
              Text(
                AppLocalizations.of(context)!
                    .klijenti_koji_su_nam_ukazali_povjerenje,
                style: GoogleFonts.mulish(
                  fontSize: SizeConfig.safeBlockVertical! * 2,
                  fontWeight: FontWeight.w800,
                  color: Theme.of(context).primaryColorDark,
                ),
              ),
              SizedBox(
                height: SizeConfig.safeBlockVertical! * 3.15,
              ),
              SizedBox(
                width: SizeConfig.safeBlockHorizontal! * 50,
                height: SizeConfig.safeBlockVertical! * 10,
                child: CarouselWithWrapAround(
                  images: images,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
