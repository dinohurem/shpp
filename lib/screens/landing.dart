import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shpp/shared/action_button.dart';
import 'package:shpp/shared/size_config.dart';

class Landing extends StatefulWidget {
  final GlobalKey globalKey;
  const Landing({
    super.key,
    required this.globalKey,
  });

  @override
  State<Landing> createState() => _LandingState();
}

class _LandingState extends State<Landing> {
  // ignore: prefer_final_fields, unused_field
  late var _isHovering = [false, false, false, false, false];

  //TODO: Get this image list from firebase.
  final List<String> images = [
    'assets/images/dhl.png',
    'assets/images/violeta.png',
    'assets/images/mba.png',
    'assets/images/migg.png',
    'assets/images/madi.png',
  ];

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Center(
      key: widget.globalKey,
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: SizeConfig.safeBlockVertical! * 2,
        ),
        child: SizedBox(
          height: SizeConfig.safeBlockVertical! * 90,
          width: SizeConfig.safeBlockHorizontal! * 70,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: SizeConfig.safeBlockVertical! * 5,
                        ),
                        Text(
                          'Putem obnovljive energije\nka održivoj budućnosti.',
                          style: GoogleFonts.mulish(
                            fontSize: SizeConfig.safeBlockVertical! * 4,
                            fontWeight: FontWeight.w800,
                            color: Theme.of(context).primaryColorDark,
                          ),
                        ),
                        SizedBox(
                          height: SizeConfig.safeBlockVertical! * 3,
                        ),
                        Text(
                          'Saznajte više o obnovljivim izvorima energije sa SHPP-om.',
                          style: GoogleFonts.mulish(
                            fontSize: SizeConfig.safeBlockVertical! * 1.75,
                            fontWeight: FontWeight.w400,
                            color: Theme.of(context).primaryColorDark,
                          ),
                        ),
                        SizedBox(
                          height: SizeConfig.safeBlockVertical! * 4,
                        ),
                        ActionButton(
                          text: 'Saznaj više',
                          onTap: () {
                            GoRouter.of(context).go('/about');
                          },
                        ),
                      ],
                    ),
                  ),
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
                                  SizeConfig.safeBlockHorizontal! * 20),
                              bottomLeft: Radius.circular(
                                  SizeConfig.safeBlockHorizontal! * 20),
                              bottomRight: Radius.circular(
                                  SizeConfig.safeBlockHorizontal! * 10),
                            ),
                            image: const DecorationImage(
                              image: AssetImage('images/panels.jpg'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(
                height: SizeConfig.safeBlockVertical! * 3,
              ),
              Text(
                'Klijenti koji su nam ukazali povjerenje',
                style: GoogleFonts.mulish(
                  fontSize: SizeConfig.safeBlockVertical! * 2,
                  fontWeight: FontWeight.w800,
                  color: Theme.of(context).primaryColorDark,
                ),
              ),
              SizedBox(
                height: SizeConfig.safeBlockVertical! * 3.15,
              ),
              Flexible(
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics(),
                  ),
                  scrollDirection: Axis.horizontal,
                  itemCount: images.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(
                        right: SizeConfig.safeBlockHorizontal! * 5,
                      ),
                      child: MouseRegion(
                        cursor: SystemMouseCursors.click,
                        onEnter: (event) {
                          setState(() {
                            _isHovering[index] = true;
                          });
                        },
                        onExit: (event) {
                          setState(() {
                            _isHovering[index] = false;
                          });
                        },
                        child: Opacity(
                          opacity: _isHovering[index] ? 1 : 0.3,
                          child: Container(
                            height: SizeConfig.safeBlockVertical! * 4,
                            width: SizeConfig.safeBlockHorizontal! * 5,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(images[index]),
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
