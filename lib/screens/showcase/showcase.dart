import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:shpp/models/project.dart';
import 'package:shpp/screens/showcase/showcase_details.dart';
import 'package:shpp/shared/action_button.dart';
import 'package:shpp/shared/size_config.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Showcase extends StatefulWidget {
  GlobalKey globalKey;
  Showcase({
    super.key,
    required this.globalKey,
  });

  @override
  State<Showcase> createState() => _ShowcaseState();
}

class _ShowcaseState extends State<Showcase> {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final double _topLeft = SizeConfig.safeBlockHorizontal! * 4;
  final double _topRight = SizeConfig.safeBlockHorizontal! * 4;
  final double _bottomLeft = SizeConfig.safeBlockHorizontal! * 4;
  final double _bottomRight = SizeConfig.safeBlockHorizontal! * 2;

  final ItemScrollController itemScrollController = ItemScrollController();
  final ScrollOffsetController scrollOffsetController =
      ScrollOffsetController();
  final ItemPositionsListener itemPositionsListener =
      ItemPositionsListener.create();
  final ScrollOffsetListener scrollOffsetListener =
      ScrollOffsetListener.create();

  Future<List<Project>> fetchProjects() async {
    QuerySnapshot querySnapshot = await firestore.collection('projects').get();

    return querySnapshot.docs.map((doc) {
      return Project.fromMap(doc.data() as Map<String, dynamic>);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: SizeConfig.safeBlockVertical! * 5,
      ),
      child: SizedBox(
        key: widget.globalKey,
        width: SizeConfig.safeBlockHorizontal! * 70,
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppLocalizations.of(context)!.projekti.toUpperCase(),
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
                child: FutureBuilder(
                  future: fetchProjects(),
                  builder: (streamContext, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      }
                      if (!snapshot.hasData) {
                        return const Center(child: CircularProgressIndicator());
                      }

                      final projects = snapshot.data!;
                      return Row(
                        children: [
                          InkWell(
                            onTap: () {
                              scrollOffsetController.animateScroll(
                                  offset: SizeConfig.safeBlockHorizontal! * -60,
                                  duration: const Duration(seconds: 2),
                                  curve: Curves.easeInOutCubic);
                            },
                            child: const Icon(
                              FontAwesomeIcons.arrowLeft,
                            ),
                          ),
                          Flexible(
                            child: SizedBox(
                                height: SizeConfig.safeBlockVertical! * 60,
                                child: ScrollablePositionedList.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: projects.length,
                                  itemScrollController: itemScrollController,
                                  scrollOffsetController:
                                      scrollOffsetController,
                                  itemPositionsListener: itemPositionsListener,
                                  scrollOffsetListener: scrollOffsetListener,
                                  itemBuilder: (context, index) => Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal:
                                          SizeConfig.safeBlockHorizontal! * 2,
                                    ),
                                    child: MouseRegion(
                                      cursor: SystemMouseCursors.click,
                                      child: Stack(
                                        children: [
                                          Container(
                                            height:
                                                SizeConfig.safeBlockVertical! *
                                                    60,
                                            width: SizeConfig
                                                    .safeBlockHorizontal! *
                                                55,
                                            decoration: BoxDecoration(
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.grey
                                                      .withOpacity(0.5),
                                                  spreadRadius: 2,
                                                  blurRadius: 3,
                                                ),
                                              ],
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(SizeConfig
                                                        .safeBlockHorizontal! *
                                                    5),
                                              ),
                                              image: DecorationImage(
                                                image: projects[index]
                                                        .urls
                                                        .isNotEmpty
                                                    ? projects[index]
                                                            .urls[0]
                                                            .contains('http')
                                                        ? NetworkImage(
                                                            projects[index]
                                                                .urls[0],
                                                          )
                                                        : AssetImage(
                                                            projects[index]
                                                                .urls[0],
                                                          ) as ImageProvider<
                                                            Object>
                                                    : const AssetImage(
                                                            'assets/images/panels.jpg')
                                                        as ImageProvider<
                                                            Object>,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                            bottom:
                                                SizeConfig.safeBlockVertical! *
                                                    10,
                                            child: Container(
                                              width: SizeConfig
                                                      .safeBlockHorizontal! *
                                                  15,
                                              decoration: BoxDecoration(
                                                color: Theme.of(context)
                                                    .primaryColorLight
                                                    .withOpacity(0.7),
                                                borderRadius: BorderRadius.only(
                                                  topRight: Radius.circular(
                                                      _topRight),
                                                  bottomRight: Radius.circular(
                                                      _bottomRight),
                                                ),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsets.only(
                                                  left: SizeConfig
                                                          .safeBlockHorizontal! *
                                                      2,
                                                ),
                                                child: Text(
                                                  projects[index].title,
                                                  style: GoogleFonts.mulish(
                                                    fontSize: SizeConfig
                                                            .safeBlockVertical! *
                                                        2.5,
                                                    fontWeight: FontWeight.w700,
                                                    color: Theme.of(context)
                                                        .primaryColorDark,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                )

                                // ListView.builder(
                                //   shrinkWrap: true,
                                //   itemCount: projects.length,
                                //   scrollDirection: Axis.horizontal,
                                //   padding: EdgeInsets.symmetric(
                                //     horizontal:
                                //         SizeConfig.safeBlockHorizontal! * 3,
                                //   ),
                                //   itemBuilder:
                                //       (BuildContext context, int index) {
                                //     return ;
                                //   },
                                // )),
                                ),
                          ),
                          InkWell(
                            onTap: () {
                              scrollOffsetController.animateScroll(
                                  offset: SizeConfig.safeBlockHorizontal! * 60,
                                  duration: const Duration(seconds: 2),
                                  curve: Curves.easeInOutCubic);
                            },
                            child: const Icon(
                              FontAwesomeIcons.arrowRight,
                            ),
                          )
                        ],
                      );
                    }
                  },
                ),
              ),
              SizedBox(
                height: SizeConfig.safeBlockVertical! * 3,
              ),
              ActionButton(
                text: AppLocalizations.of(context)!.svi_nasi_projekti,
                onTap: () {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (_, __, ___) => const ShowcaseDetails(),
                      transitionDuration: Duration.zero,
                      reverseTransitionDuration: Duration.zero,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
