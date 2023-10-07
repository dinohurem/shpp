import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';
import 'package:shpp/screens/news_item.dart';
import 'package:shpp/shared/size_config.dart';

class News extends StatefulWidget {
  final GlobalKey globalKey;
  const News({
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
    'https://lh3.googleusercontent.com/utikIXbGl2OC6MUOe6sCVyraMWZGpK_H7r8vLViaAvNDmV1_NYWfjbp_-b8rE5lJY8hOaCoy13mJ2cGjfbqLrUvmqbnj0D3yTfuo7Zo=rw-e365-w2880',
    'https://scontent.fsjj1-1.fna.fbcdn.net/v/t39.30808-6/382459958_784773923656453_3355149574398721187_n.jpg?_nc_cat=109&ccb=1-7&_nc_sid=49d041&_nc_ohc=Ao0fdRMl8B0AX_pYVWk&_nc_oc=AQnp9gQtgVlsqHp9DisBnzwRlIn3Vs5-WyuwxyiqFNwpbvGjaeLS4v69BTileCVxY_4&_nc_ht=scontent.fsjj1-1.fna&oh=00_AfCeSTGFUE8t0RIcdhO5gpdYYYpZTt9MAiFONRjpIwLEgw&oe=6525BBF2',
    'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b8/Photovoltaik_Dachanlage_Hannover_-_Schwarze_Heide_-_1_MW.jpg/1920px-Photovoltaik_Dachanlage_Hannover_-_Schwarze_Heide_-_1_MW.jpg',
    'https://media.licdn.com/dms/image/D4D22AQHDBCy8FOipZw/feedshare-shrink_2048_1536/0/1696093426560?e=1699488000&v=beta&t=WT3Vnc9SKTQ2XG5asXSf9fG5Kd1L0RruDAuHAx6ejWY',
    'https://static.euronews.com/articles/stories/07/75/15/84/773x435_cmsv2_a7606336-c8bf-5f84-8fc2-974420a5f0d9-7751584.jpg',
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
