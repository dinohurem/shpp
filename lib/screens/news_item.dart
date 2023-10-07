import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shpp/shared/action_button.dart';
import 'package:shpp/shared/icon_card.dart';
import 'package:shpp/shared/size_config.dart';

class NewsItem extends StatelessWidget {
  final String title;
  final String text;
  final String url;
  const NewsItem({
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
      width: SizeConfig.safeBlockHorizontal! * 33,
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
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Flexible(
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft:
                        Radius.circular(SizeConfig.safeBlockHorizontal! * 3),
                    bottomRight: Radius.zero,
                    topLeft:
                        Radius.circular(SizeConfig.safeBlockHorizontal! * 3),
                    topRight: Radius.zero,
                  ),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      url,
                    ),
                  )),
              width: SizeConfig.safeBlockHorizontal! * 28,
            ),
          ),
          SizedBox(
            width: SizeConfig.safeBlockHorizontal!,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: SizeConfig.safeBlockVertical! * 1.5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconCard(
                    title: title,
                    icon: FontAwesomeIcons.solarPanel,
                    text: text),
                Padding(
                  padding: EdgeInsets.only(
                    left: SizeConfig.safeBlockHorizontal! * 1.5,
                  ),
                  child: ActionButton(
                      text: 'Saznaj više',
                      onTap: () {
                        //TODO: Add functions to see details of news.
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
