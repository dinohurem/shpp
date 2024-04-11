import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shpp/shared/action_button.dart';
import 'package:shpp/shared/icon_card.dart';
import 'package:shpp/shared/size_config.dart';

class Services extends StatelessWidget {
  GlobalKey globalKey;
  Services({
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
                          const IconCard(
                            narrowText: false,
                            title:
                                'PROIZVODNJA ELEKTRIČNE ENERGIJE IZ OBNOVLJIVIH IZVORA',
                            icon: FontAwesomeIcons.solidSun,
                            text:
                                'Proizvodnja električne energije bazirana isključivo na obnovljivim izvorima električne energije, prije svega na obnovljivom potencijalu Bosne i Hercegovine.',
                          ),
                          SizedBox(
                            height: SizeConfig.safeBlockVertical! * 10,
                          ),
                          const IconCard(
                            narrowText: false,
                            title:
                                'PROJEKTOVANJE I UGRADNJA PUNIONICA ZA ELEKTROMOBILE',
                            icon: FontAwesomeIcons.chargingStation,
                            text:
                                'Proizvodnja električne energije bazirana isključivo na obnovljivim izvorima električne energije, prije svega na obnovljivom potencijalu Bosne i Hercegovine.',
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
                              'PROJEKTOVANJE, INŽENJERING I CONSULTING U OBLASTI FOTONAPONSKIH-SOLARNIH ELEKTRANA',
                          icon: FontAwesomeIcons.solarPanel,
                          text:
                              'Proizvodnja električne energije bazirana isključivo na obnovljivim izvorima električne energije, prije svega na obnovljivom potencijalu Bosne i Hercegovine.',
                        ),
                        SizedBox(
                          height: SizeConfig.safeBlockVertical! * 10,
                        ),
                        const IconCard(
                          narrowText: false,
                          title: 'KOMPENZACIJA REAKTIVNE ENERGIJE',
                          icon: FontAwesomeIcons.batteryFull,
                          text:
                              'U saradnji sa našim partnerima nudimo Vam usluge kompenzacije reaktivne energije po sistemu "ključ u ruke". Investicija u kompenzaciju reaktivne energije je ulaganje koje ima najkraći povrat investicije.',
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
                          title:
                              'PROJEKTOVANJE I UGRADNJA OPREME ZA USTEDU ELEKTRIČNE ENERGIJE',
                          icon: FontAwesomeIcons.plugCircleCheck,
                          text:
                              'SHPP d.o.o. je partner u posredovanju u prodaji i snabdijevanju električnom energijom kompaniji Proenergy d.o.o.',
                        ),
                        SizedBox(
                          height: SizeConfig.safeBlockVertical! * 10,
                        ),
                        const IconCard(
                          narrowText: false,
                          title: 'POSREDOVANJE U PRODAJI ELEKTRIČNE ENERGIJE',
                          icon: FontAwesomeIcons.handshake,
                          text:
                              'SHPP d.o.o. je partner u posredovanju u prodaji i snabdijevanju električnom energijom kompaniji Proenergy d.o.o.\n\nProenergy d.o.o. je lider po broju kupaca u Bosni i Hercegovini, nakon tri elektroprivrede sa većinskim državnim kapitalom.',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              // SizedBox(
              //   height: SizeConfig.safeBlockVertical! * 10,
              // ),
              // ActionButton(
              //   text: 'Više informacija',
              //   onTap: () {
              //     GoRouter.of(context).go('/services-details');
              //   },
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
