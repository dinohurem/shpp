import 'package:flutter/material.dart';
import 'package:shpp/models/project.dart';
import 'package:shpp/screens/showcase/gallery.dart';
import 'package:shpp/shared/action_button.dart';
import 'package:shpp/shared/icon_card_showcase.dart';
import 'package:shpp/shared/size_config.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ShowcaseItem extends StatelessWidget {
  final Project project;
  const ShowcaseItem({
    super.key,
    required this.project,
  });

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      height: SizeConfig.safeBlockVertical! * 33,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(SizeConfig.safeBlockHorizontal! * 3),
        ),
        border: Border.all(
          color: Theme.of(context).primaryColorDark.withOpacity(0.35),
          width: 0.35,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft:
                          Radius.circular(SizeConfig.safeBlockHorizontal! * 2),
                      bottomRight: Radius.zero,
                      topLeft:
                          Radius.circular(SizeConfig.safeBlockHorizontal! * 2),
                      topRight: Radius.zero,
                    ),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: project.urls.isNotEmpty
                          ? project.urls[0].contains('http')
                              ? NetworkImage(
                                  project.urls[0],
                                )
                              : AssetImage(
                                  project.urls[0],
                                ) as ImageProvider<Object>
                          : const AssetImage('assets/images/panels.jpg')
                              as ImageProvider<Object>,
                    )),
                width: SizeConfig.safeBlockHorizontal! * 35),
          ),
          SizedBox(
            width: SizeConfig.safeBlockHorizontal!,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: SizeConfig.safeBlockVertical! * 1.5,
                horizontal: SizeConfig.safeBlockHorizontal! * 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconCardShowcase(title: project.title, text: project.content),
                Padding(
                  padding: EdgeInsets.only(
                    left: SizeConfig.safeBlockHorizontal! * 1.5,
                  ),
                  child: ActionButton(
                      text: AppLocalizations.of(context)!.pogledaj_slike,
                      onTap: () {
                        Navigator.of(context).push(
                          PageRouteBuilder(
                            pageBuilder: (_, __, ___) => Gallery(
                              project: project,
                            ),
                            transitionDuration: Duration.zero,
                            reverseTransitionDuration: Duration.zero,
                          ),
                        );
                      }),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
