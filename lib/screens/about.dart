// ignore_for_file: must_be_immutable, use_key_in_widget_constructors

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shpp/shared/icon_card_about.dart';
import 'package:shpp/shared/size_config.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class About extends StatelessWidget {
  GlobalKey globalKey;
  About({
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
                          image: AssetImage('assets/images/panels2.jpg'),
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
                      AppLocalizations.of(context)!.onama.toUpperCase(),
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
                      AppLocalizations.of(context)!
                          .proizvodimo_elektricnu_energiju_iz_obnovljivih_izvora,
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
                      AppLocalizations.of(context)!.onama_tekst,
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
                      AppLocalizations.of(context)!.onama_tekst2,
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
                            Flexible(
                              child: IconCardAbout(
                                title: AppLocalizations.of(context)!
                                    .misija
                                    .toUpperCase(),
                                icon: FontAwesomeIcons.bullseye,
                                text:
                                    AppLocalizations.of(context)!.misija_tekst,
                              ),
                            ),
                            SizedBox(
                              width: SizeConfig.safeBlockHorizontal! * 0.75,
                            ),
                            IconCardAbout(
                                title: AppLocalizations.of(context)!
                                    .vizija
                                    .toUpperCase(),
                                icon: FontAwesomeIcons.seedling,
                                text:
                                    AppLocalizations.of(context)!.vizija_tekst),
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
