import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shpp/shared/action_button.dart';
import 'package:shpp/shared/icon_card.dart';
import 'package:shpp/shared/size_config.dart';

class Services extends StatelessWidget {
  final GlobalKey globalKey;
  const Services({
    super.key,
    required this.globalKey,
  });

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: SizeConfig.safeBlockVertical! * 10,
      ),
      child: SizedBox(
        key: globalKey,
        width: SizeConfig.safeBlockHorizontal! * 70,
        child: Center(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    child: SizedBox(
                      width: SizeConfig.safeBlockHorizontal! * 20,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'USLUGE'.toUpperCase(),
                            style: GoogleFonts.mulish(
                              fontSize: SizeConfig.safeBlockVertical! * 1.5,
                              fontWeight: FontWeight.w700,
                              color: Theme.of(context).primaryColorDark,
                            ),
                          ),
                          SizedBox(
                            height: SizeConfig.safeBlockVertical! * 3,
                          ),
                          Text(
                            'U dobrim ste rukama',
                            style: GoogleFonts.mulish(
                              fontSize: SizeConfig.safeBlockVertical! * 3,
                              fontWeight: FontWeight.w800,
                              color: Theme.of(context).primaryColorDark,
                            ),
                          ),
                          SizedBox(
                            height: SizeConfig.safeBlockVertical! * 2,
                          ),
                          Text(
                            'Naše usluge pokrivaju čitav spektar obnovljivih izvora električne energije uz dodatne usluge koje komplementiraju vašem biznisu.\n\nNa ovaj način Vam nudimo sveobuhvatno i efikasno rješenje za dizajn i implementaciju Vaših projekata.',
                            style: GoogleFonts.mulish(
                              fontSize: SizeConfig.safeBlockVertical! * 1.5,
                              fontWeight: FontWeight.w500,
                              color: Theme.of(context).primaryColorDark,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const IconCard(
                          narrowText: false,
                          title:
                              'PROIZVODNJA ELEKTRIČNE ENERGIJE IZ OBNOVLJIVIH IZVORA',
                          icon: FontAwesomeIcons.solidLightbulb,
                          text:
                              'Proizvodnja električne energije bazirana isključivo na obnovljivim izvorima električne energije, prije svega na obnovljivom potencijalu Bosne i Hercegovine.',
                        ),
                        SizedBox(
                          height: SizeConfig.safeBlockVertical! * 10,
                        ),
                        const IconCard(
                          narrowText: false,
                          title: 'KONSALTING',
                          icon: FontAwesomeIcons.solidHandshake,
                          text:
                              'U saradnji sa Vama i u skladu sa uočenim potrebama, analizirati ćemo sve aspekte i elemente priključenja elektroenergetskih objekata.',
                        ),
                      ],
                    ),
                  ),
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const IconCard(
                          narrowText: false,
                          title: 'POSREDOVANJE U PRODAJI ELEKTRIČNE ENERGIJE',
                          icon: FontAwesomeIcons.shieldHalved,
                          text:
                              'SHPP d.o.o. je partner u posredovanju u prodaji i snabdijevanju električnom energijom kompaniji Proenergy d.o.o.\n\nProenergy d.o.o. je lider po broju kupaca u Bosni i Hercegovini, nakon tri elektroprivrede sa većinskim državnim kapitalom.',
                        ),
                        SizedBox(
                          height: SizeConfig.safeBlockVertical! * 10,
                        ),
                        const IconCard(
                          narrowText: false,
                          title: 'KOMPENZACIJA REAKTIVNE ENERGIJE',
                          icon: FontAwesomeIcons.plugCirclePlus,
                          text:
                              'U saradnji sa našim partnerima nudimo Vam usluge kompenzacije reaktivne energije po sistemu "ključ u ruke". Investicija u kompenzaciju reaktivne energije je ulaganje koje ima najkraći povrat investicije.',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: SizeConfig.safeBlockVertical! * 10,
              ),
              ActionButton(
                text: 'Više informacija',
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
