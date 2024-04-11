import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shpp/shared/icon_card.dart';
import 'package:shpp/shared/size_config.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Services extends StatefulWidget {
  GlobalKey globalKey;
  Services({
    super.key,
    required this.globalKey,
  });

  @override
  State<Services> createState() => _ServicesState();
}

class _ServicesState extends State<Services> {
  late List<String> _titles;
  late List<String> _texts;

  final _icons = [
    FontAwesomeIcons.solidSun,
    FontAwesomeIcons.chargingStation,
    FontAwesomeIcons.solarPanel,
    FontAwesomeIcons.batteryFull,
    FontAwesomeIcons.plugCircleCheck,
    FontAwesomeIcons.handshake,
  ];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _titles = [
      AppLocalizations.of(context)!.usluge_naslov1,
      AppLocalizations.of(context)!.usluge_naslov2,
      AppLocalizations.of(context)!.usluge_naslov3,
      AppLocalizations.of(context)!.usluge_naslov4,
      AppLocalizations.of(context)!.usluge_naslov5,
      AppLocalizations.of(context)!.usluge_naslov6,
    ];

    _texts = [
      AppLocalizations.of(context)!.usluge_tekst1,
      AppLocalizations.of(context)!.usluge_tekst2,
      AppLocalizations.of(context)!.usluge_tekst3,
      AppLocalizations.of(context)!.usluge_tekst4,
      AppLocalizations.of(context)!.usluge_tekst5,
      AppLocalizations.of(context)!.usluge_tekst6,
    ];
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: SizeConfig.safeBlockVertical! * 10,
      ),
      child: SizedBox(
        key: widget.globalKey,
        width: SizeConfig.safeBlockHorizontal! * 70,
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppLocalizations.of(context)!.usluge.toUpperCase(),
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
                width: SizeConfig.safeBlockHorizontal! * 70,
                child: GridView(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: SizeConfig.safeBlockHorizontal!,
                      mainAxisExtent: SizeConfig.safeBlockVertical! * 40,
                    ),
                    physics: const NeverScrollableScrollPhysics(),
                    children: List.generate(6, (index) {
                      return IconCard(
                        title: _titles[index],
                        text: _texts[index],
                        icon: _icons[index],
                      );
                    })),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
