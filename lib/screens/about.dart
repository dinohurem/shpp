import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shpp/shared/size_config.dart';

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: SizeConfig.safeBlockVertical! * 5,
        ),
        child: SizedBox(
          height: SizeConfig.safeBlockVertical! * 90,
          width: SizeConfig.safeBlockHorizontal! * 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                child: Column(
                  children: [
                    Container(
                      height: SizeConfig.safeBlockVertical! * 65,
                      width: SizeConfig.safeBlockHorizontal! * 25,
                      decoration: BoxDecoration(
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
                          image: AssetImage('images/panels.jpg'),
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
                    Text(
                      'Proizvodimo električnu energiju\niz obnovljivih izvora',
                      style: GoogleFonts.mulish(
                        fontSize: SizeConfig.safeBlockVertical! * 3,
                        fontWeight: FontWeight.w800,
                        color: Theme.of(context).primaryColorDark,
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.safeBlockVertical! * 3,
                    ),
                    Text(
                      'SHPP d.o.o. Sarajevo je nastao kao potreba za zaštitom čovjekove okoline i potenciranja ulaganja u obnovljive izvore električne energije, bilo da se radi o malim hidroelektranama, fotovoltaik postrojenjima, elektranama na vjetar, kogeneraciji ili postrojenjima na bio gas.',
                      style: GoogleFonts.mulish(
                        fontSize: SizeConfig.safeBlockVertical! * 1.5,
                        fontWeight: FontWeight.w500,
                        color: Theme.of(context).primaryColorDark,
                      ),
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
                      height: SizeConfig.safeBlockVertical! * 3,
                    ),
                    SizedBox(
                      height: SizeConfig.safeBlockVertical! * 30,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Icon(
                                    Icons.recycling,
                                    color: Theme.of(context).primaryColorDark,
                                    size: SizeConfig.safeBlockVertical! * 3,
                                  ),
                                  SizedBox(
                                    width:
                                        SizeConfig.safeBlockHorizontal! * 0.25,
                                  ),
                                  Text(
                                    'Koristimo obnovljive izvore energije',
                                    style: GoogleFonts.mulish(
                                      fontSize:
                                          SizeConfig.safeBlockVertical! * 1.5,
                                      fontWeight: FontWeight.w900,
                                      color: Theme.of(context).primaryColorDark,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: SizeConfig.safeBlockVertical! * 0.5,
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  left: SizeConfig.safeBlockHorizontal! * 1.75,
                                ),
                                child: Text(
                                  'Ugradnjom najnovijih svjetskih tehnologija\ndo bolje energetske efikasnosti.',
                                  style: GoogleFonts.mulish(
                                    fontSize:
                                        SizeConfig.safeBlockVertical! * 1.25,
                                    fontWeight: FontWeight.w400,
                                    color: Theme.of(context).primaryColorDark,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: SizeConfig.safeBlockHorizontal! * 0.5,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Icon(
                                    Icons.energy_savings_leaf,
                                    color: Theme.of(context).primaryColorDark,
                                    size: SizeConfig.safeBlockVertical! * 3,
                                  ),
                                  SizedBox(
                                    width:
                                        SizeConfig.safeBlockHorizontal! * 0.25,
                                  ),
                                  Text(
                                    'Koristimo obnovljive izvore energije',
                                    style: GoogleFonts.mulish(
                                      fontSize:
                                          SizeConfig.safeBlockVertical! * 1.5,
                                      fontWeight: FontWeight.w900,
                                      color: Theme.of(context).primaryColorDark,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: SizeConfig.safeBlockVertical! * 0.5,
                              ),
                              Text(
                                'Ugradnjom najnovijih svjetskih tehnologija\ndo bolje energetske efikasnosti.',
                                style: GoogleFonts.mulish(
                                  fontSize:
                                      SizeConfig.safeBlockVertical! * 1.25,
                                  fontWeight: FontWeight.w400,
                                  color: Theme.of(context).primaryColorDark,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
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
