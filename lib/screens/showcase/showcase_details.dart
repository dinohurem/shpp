import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shpp/screens/home.dart';
import 'package:shpp/screens/showcase/showcase_item.dart';
import 'package:shpp/services/database_service.dart';
import 'package:shpp/shared/size_config.dart';

class ShowcaseDetails extends StatefulWidget {
  const ShowcaseDetails({super.key});

  @override
  State<ShowcaseDetails> createState() => _ShowcaseDetailsState();
}

class _ShowcaseDetailsState extends State<ShowcaseDetails> {
  final DatabaseService _db = DatabaseService();

  var titles = [
    //dhl
    //travnik
    'Ferplast d.o.o',
    'MBA d.o.o.',
    'OMC d.o.o.',
    'Jerry d.o.o.',
    'Promo d.o.o.',
    'Saplast d.o.o.',
    'Alufinal d.o.o.',
    'Eurotrans d.o.o.',
    'Eurotrans d.o.o.',
    'Mlin Nezić d.o.o.',
    'Rolling d.o.o.',
    'SHPP d.o.o.',
    'Genena d.o.o.',
    'Sedžan d.o.o.',
    'Bošnjak Velika Kladuša d.o.o.',
    'Crni stovarište d.o.o.',
    'Crvena Jabuka Cazin d.o.o.',
    'Kenda d.o.o.',
    'CetBah d.o.o.',
    'Tehnika d.o.o.',
    'Edelstahl d.o.o.',
    'MDG International d.o.o.',
    'Mostar Express d.o.o.',
  ];

  var texts = [
    'Ferplast d.o.o tekst',
    'MBA d.o.o. tekst',
    'OMC d.o.o. tekst',
    'Jerry d.o.o. tekst',
    'Promo d.o.o. tekst',
    'Saplast d.o.o. tekst',
    'Alufinal d.o.o. tekst',
    'Eurotrans d.o.o. tekst',
    'Eurotrans d.o.o. tekst',
    'Mlin Nezić d.o.o. tekst',
    'Rolling d.o.o. tekst',
    'SHPP d.o.o. tekst',
    'Genena d.o.o. tekst',
    'Sedžan d.o.o. tekst',
    'Bošnjak Velika Kladuša d.o.o. tekst',
    'Crni stovarište d.o.o. tekst',
    'Crvena Jabuka Cazin d.o.o. tekst',
    'Kenda d.o.o. tekst',
    'CetBah d.o.o. tekst',
    'Tehnika d.o.o. tekst',
    'Edelstahl d.o.o. tekst',
    'MDG International d.o.o. tekst',
    'Mostar Express d.o.o. tekst',
  ];

  var links = [
    'assets/images/news1.png',
    'assets/images/news1.png',
    'assets/images/news3.jpg',
    'assets/images/news1.png',
    'assets/images/news5.png',
  ];

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Container(
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
        child: Center(
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
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.pushReplacement(
                                  context,
                                  PageRouteBuilder(
                                    pageBuilder: (_, __, ___) => const Home(),
                                    transitionDuration: Duration.zero,
                                    reverseTransitionDuration: Duration.zero,
                                  ),
                                );
                              },
                              child: MouseRegion(
                                cursor: SystemMouseCursors.click,
                                child: Icon(
                                  Icons.arrow_back_ios,
                                  color: Theme.of(context).primaryColorDark,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: SizeConfig.safeBlockHorizontal! * 2,
                            ),
                            Text(
                              AppLocalizations.of(context)!
                                  .projekti
                                  .toUpperCase(),
                              style: GoogleFonts.mulish(
                                fontSize: SizeConfig.safeBlockVertical! * 1.5,
                                fontWeight: FontWeight.w700,
                                color: Theme.of(context).primaryColorDark,
                              ),
                            ),
                          ],
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
                        StreamBuilder(
                          stream: _db.getAllProjects(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            } else {
                              if (snapshot.hasError) {
                                return Text('Error: ${snapshot.error}');
                              }
                              if (!snapshot.hasData) {
                                return const Center(
                                    child: CircularProgressIndicator());
                              }

                              final projects = snapshot.data!;

                              return SizedBox(
                                height: SizeConfig.safeBlockVertical! * 78,
                                child: ListView.builder(
                                  itemCount: projects.length,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: EdgeInsets.symmetric(
                                        horizontal:
                                            SizeConfig.safeBlockHorizontal! * 2,
                                        vertical:
                                            SizeConfig.safeBlockVertical! * 2,
                                      ),
                                      child: MouseRegion(
                                        cursor: SystemMouseCursors.click,
                                        child: ShowcaseItem(
                                          project: projects[index],
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              );
                            }
                          },
                        ),
                      ],
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
