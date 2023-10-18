import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shpp/shared/icon_card.dart';
import 'package:shpp/shared/size_config.dart';

class About extends StatelessWidget {
  final GlobalKey globalKey;
  const About({
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
        width: SizeConfig.safeBlockHorizontal! * 70,
        child: Center(
          key: globalKey,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
                            spreadRadius: 2,
                            blurRadius: 3,
                          ),
                        ],
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(
                              SizeConfig.safeBlockHorizontal! * 20),
                          topRight: Radius.circular(
                              SizeConfig.safeBlockHorizontal! * 10),
                          bottomLeft: Radius.circular(
                              SizeConfig.safeBlockHorizontal! * 20),
                          bottomRight: Radius.circular(
                              SizeConfig.safeBlockHorizontal! * 20),
                        ),
                        image: const DecorationImage(
                          image: AssetImage('images/panels2.jpg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: SizeConfig.safeBlockVertical! * 5,
                    ),
                    Text(
                      'o nama'.toUpperCase(),
                      style: GoogleFonts.mulish(
                        fontSize: SizeConfig.safeBlockVertical! * 1.5,
                        fontWeight: FontWeight.w700,
                        color: Theme.of(context).primaryColorDark,
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.safeBlockVertical! * 3,
                    ),
                    AutoSizeText(
                      'Proizvodimo električnu energiju\niz obnovljivih izvora',
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.mulish(
                        fontSize: SizeConfig.safeBlockVertical! * 3,
                        fontWeight: FontWeight.w800,
                        color: Theme.of(context).primaryColorDark,
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.safeBlockVertical! * 3,
                    ),
                    AutoSizeText(
                      'SHPP d.o.o. Sarajevo je nastao kao potreba za zaštitom čovjekove okoline i potenciranja ulaganja u obnovljive izvore električne energije, bilo da se radi o malim hidroelektranama, fotovoltaik postrojenjima, elektranama na vjetar, kogeneraciji ili postrojenjima na biogas.',
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.mulish(
                        fontSize: SizeConfig.safeBlockVertical! * 1.5,
                        fontWeight: FontWeight.w500,
                        color: Theme.of(context).primaryColorDark,
                      ),
                      maxLines: 4,
                    ),
                    SizedBox(
                      height: SizeConfig.safeBlockVertical! * 3,
                    ),
                    Text(
                      'Energetska efikasnost je dio našeg portfolia i instaliranjem i upotrebom najsavremenijih svjetskih uređaja za štednju električne energije, štedite energiju i smanjujete Vaše troškove.\nMi ćemo biti Vaš sagovornik, Vaš savjetnik i Vaš partner.',
                      style: GoogleFonts.mulish(
                        fontSize: SizeConfig.safeBlockVertical! * 1.5,
                        fontWeight: FontWeight.w500,
                        color: Theme.of(context).primaryColorDark,
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.safeBlockVertical! * 6,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Flexible(
                              child: IconCard(
                                title: 'MISIJA',
                                icon: FontAwesomeIcons.bullseye,
                                text:
                                    'Proizvodnjom iz obnovljivih izvora čuvamo prirodu i štitimo okolinu.\n\nMi ćemo biti Vaš najbolji saveznik u smanjenju Vaših troškova.\n\nUgradnjom najnovijih svjetskih tehnologija do bolje energetske efikasnosti.',
                              ),
                            ),
                            SizedBox(
                              width: SizeConfig.safeBlockHorizontal! * 0.75,
                            ),
                            const IconCard(
                              title: 'VIZIJA',
                              icon: FontAwesomeIcons.seedling,
                              text:
                                  'Naš cilj je smanjiti potrošnju električne energije u Bosni i Hercegovini do 5 % i nuditi najbolja rješenja energetske efikasnosti.\n\nU ambijentu liberaliziranog tržišta električne energije biti vodeći u posredovanju prodaje električnom energijom.',
                            ),
                          ],
                        ),
                      ],
                    )
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
