import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shpp/shared/action_button.dart';
import 'package:shpp/shared/icon_card_showcase.dart';
import 'package:shpp/shared/size_config.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ShowcaseItem extends StatelessWidget {
  final String title;
  final String text;
  final String url;
  const ShowcaseItem({
    super.key,
    required this.title,
    required this.text,
    required this.url,
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
                      image: url.contains('http')
                          ? NetworkImage(
                              url,
                            )
                          : AssetImage(
                              url,
                            ) as ImageProvider<Object>,
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
                IconCardShowcase(title: title, text: text),
                Padding(
                  padding: EdgeInsets.only(
                    left: SizeConfig.safeBlockHorizontal! * 1.5,
                  ),
                  child: ActionButton(
                      text: AppLocalizations.of(context)!.pogledaj_slike,
                      onTap: () {
                        context.go('/projects-details');
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
