import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';
import 'package:shpp/screens/news_item.dart';
import 'package:shpp/shared/size_config.dart';

class News extends StatefulWidget {
  GlobalKey globalKey;
  News({
    super.key,
    required this.globalKey,
  });

  @override
  State<News> createState() => _NewsState();
}

class _NewsState extends State<News> {
  int _focusedIndex = 0;

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
                'NOVOSTI'.toUpperCase(),
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
                height: SizeConfig.safeBlockVertical! * 34,
                child: Row(
                  children: [
                    InkWell(
                        onTap: () {
                          _scrollController.animateTo(
                              _scrollController.offset +
                                  SizeConfig.safeBlockHorizontal! * -28,
                              duration: const Duration(seconds: 1),
                              curve: Curves.easeIn);
                        },
                        child: const Icon(
                          FontAwesomeIcons.arrowLeft,
                        )),
                    Flexible(
                      child: SizedBox(
                        height: SizeConfig.safeBlockVertical! * 32,
                        child: ScrollSnapList(
                          onItemFocus: _onItemFocus,
                          listController: _scrollController,
                          shrinkWrap: true,
                          itemCount: 5,
                          itemSize: SizeConfig.safeBlockHorizontal! * 30,
                          focusOnItemTap: true,
                          curve: Curves.easeOut,
                          scrollDirection: Axis.horizontal,
                          padding: EdgeInsets.symmetric(
                            horizontal: SizeConfig.safeBlockHorizontal! * 3,
                          ),
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: SizeConfig.safeBlockHorizontal!,
                              ),
                              child: MouseRegion(
                                cursor: SystemMouseCursors.click,
                                child: NewsItem(
                                  title: titles[index],
                                  text: texts[index],
                                  url: links[index],
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
                                  SizeConfig.safeBlockHorizontal! * 28,
                              duration: const Duration(seconds: 1),
                              curve: Curves.easeIn);
                        },
                        child: const Icon(
                          FontAwesomeIcons.arrowRight,
                        )),
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
