import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shpp/responsive.dart';
import 'package:shpp/screens/navbar.dart';
import 'package:shpp/screens/showcase/showcase_item.dart';
import 'package:shpp/shared/size_config.dart';

class ShowcaseDetails extends StatefulWidget {
  const ShowcaseDetails({super.key});

  @override
  State<ShowcaseDetails> createState() => _ShowcaseDetailsState();
}

class _ShowcaseDetailsState extends State<ShowcaseDetails> {
  bool showShadow = false;

  var titles = [
    'Google predstavlja Solar API',
    'SHPP - 100 najvećih',
    '"Solarna energija - Put ka uštedama"',
    'Budućnost na Sunce Vol. 2:\nInvestiranje u solarne elektrane',
    'Energija vjetra i solarna energija\nće proizvoditi 33% svjetske energije do 2030',
  ];

  var texts = [
    'Kako solarna energija postaje pristupačnija, postoji povećan potencijal i potražnja za donošenjem informacija i tehnologije solarnim kompanijama i programerima širom svijeta. Zato smo danas lansirali naš Solar API, u okviru novog paketa API-ja okruženja sa platforme Google Maps. Solar A',
    'SHPP d.o.o. je dobila priznanje za jednu od brzorastućih kompanija za 2023. godinu.\n\n Priznanje je uručio Zlatko Mijatović, ministar privrede Kantona Sarajevo.',
    'UniCredit Bank zajedno s partnerima Deloitte BiH i preduzećem SHPP, započinje s nizom radionica usmjerenih ka informisanju klijenata fizičkih i pravnih lica o potencijalu solarne energije, predostima te izazovima pri prelasku na solarnu energiju, kao i mogućnostima finansiranja projekata od strane banke.',
    'U centralnom događaju konferencije, panel diskusiji na temu "Investicije u solarne elektrane i zakonski okviri u BiH u 2022. godini" učestvovao je član SHPP d.o.o. tima Amer Jerlagić.',
    'Eksponencijalni rast sektora znači da se predviđa da će projekti vjetra i solarne energije proizvoditi najmanje 33 posto svjetske električne energije, u odnosu na sadašnjih oko 12 posto. To će dovesti do pada proizvodnje na fosilna goriva i jeftinije energije, pokazao je izvještaj RMI.',
  ];

  var links = [
    'assets/images/news1.png',
    'assets/images/news1.png',
    'assets/images/news3.jpg',
    'assets/images/news1.png',
    'assets/images/news5.png',
  ];

  void _onOptionSelected(int index) {
    switch (index) {
      case 0:
      case 1:
      case 2:
      case 3:
      case 4:
      case 5:
        Navigator.of(context).pop();
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Responsive(
        desktop: Container(
          width: SizeConfig.safeBlockHorizontal! * 100,
          height: SizeConfig.safeBlockVertical! * 100,
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  const Color.fromARGB(255, 253, 252, 236),
                  Theme.of(context).primaryColorLight,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: const [
                  0.1,
                  0.6,
                ],
                tileMode: TileMode.clamp),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: SizedBox(
                    width: SizeConfig.safeBlockHorizontal! * 70,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: SizeConfig.safeBlockVertical! * 5,
                        ),
                        Text(
                          AppLocalizations.of(context)!.projekti.toUpperCase(),
                          style: GoogleFonts.mulish(
                            fontSize: SizeConfig.safeBlockVertical! * 1.5,
                            fontWeight: FontWeight.w700,
                            color: Theme.of(context).primaryColorDark,
                          ),
                        ),
                        SizedBox(
                          height: SizeConfig.safeBlockVertical! * 2,
                        ),
                        Divider(
                          height: 0.25,
                          color: Colors.grey.withOpacity(0.15),
                        ),
                        SizedBox(
                          height: SizeConfig.safeBlockVertical! * 2,
                        ),
                        SizedBox(
                          height: SizeConfig.safeBlockVertical! * 78,
                          child: ListView.builder(
                            itemCount: titles.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: SizeConfig.safeBlockHorizontal!,
                                  vertical: SizeConfig.safeBlockVertical! * 2,
                                ),
                                child: MouseRegion(
                                  cursor: SystemMouseCursors.click,
                                  child: ShowcaseItem(
                                    title: titles[index],
                                    text: texts[index],
                                    url: links[index],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    )),
              ),
            ],
          ),
        ),
        tablet: Container(
          color: Colors.red,
        ),
        mobile: Container(
          color: Colors.blue,
        ),
      ),
    );
  }
}
