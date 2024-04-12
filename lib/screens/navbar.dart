import 'package:country_flags/country_flags.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:shpp/screens/admin/login.dart';
import 'package:shpp/services/app_language.dart';
import 'package:shpp/shared/navbar_option.dart';
import 'package:shpp/shared/size_config.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Navbar extends StatelessWidget {
  final Function(int index) onOptionSelected;
  const Navbar({
    super.key,
    required this.onOptionSelected,
  });

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    var appLanguage = Provider.of<AppLanguage>(context);
    return SizedBox(
      height: SizeConfig.safeBlockVertical! * 8,
      child: Row(
        children: [
          SizedBox(
            width: SizeConfig.safeBlockHorizontal! * 20,
          ),
          InkWell(
              onTap: () => onOptionSelected(0),
              child: Image.asset('assets/images/logo.png')),
          SizedBox(
            width: SizeConfig.safeBlockHorizontal! * 23.5,
          ),
          Flexible(
            child: GestureDetector(
              onTap: () => onOptionSelected(0),
              child: NavbarOption(
                text: AppLocalizations.of(context)!.pocetna,
              ),
            ),
          ),
          SizedBox(
            width: SizeConfig.safeBlockHorizontal! * 2,
          ),
          Flexible(
            child: GestureDetector(
              onTap: () => onOptionSelected(1),
              child: NavbarOption(
                text: AppLocalizations.of(context)!.onama,
              ),
            ),
          ),
          SizedBox(
            width: SizeConfig.safeBlockHorizontal! * 2,
          ),
          Flexible(
            child: GestureDetector(
              onTap: () => onOptionSelected(2),
              child: NavbarOption(
                text: AppLocalizations.of(context)!.usluge,
              ),
            ),
          ),
          SizedBox(
            width: SizeConfig.safeBlockHorizontal! * 2,
          ),
          Flexible(
            child: GestureDetector(
              onTap: () => onOptionSelected(3),
              child: NavbarOption(
                text: AppLocalizations.of(context)!.projekti,
              ),
            ),
          ),
          // SizedBox(
          //   width: SizeConfig.safeBlockHorizontal! * 2,
          // ),
          // Flexible(
          //   child: GestureDetector(
          //     onTap: () => onOptionSelected(4),
          //     child: NavbarOption(
          //       text: AppLocalizations.of(context)!.novosti,
          //     ),
          //   ),
          // ),
          SizedBox(
            width: SizeConfig.safeBlockHorizontal! * 2,
          ),
          Flexible(
            child: GestureDetector(
              onTap: () => onOptionSelected(5),
              child: NavbarOption(
                text: AppLocalizations.of(context)!.kontakt,
              ),
            ),
          ),
          SizedBox(
            width: SizeConfig.safeBlockHorizontal! * 1,
          ),
          Flexible(
            child: GestureDetector(
              onTap: () => appLanguage.changeLanguage(
                appLanguage.appLocale == const Locale('en')
                    ? const Locale('bs')
                    : const Locale('en'),
              ),
              child: MouseRegion(
                cursor: SystemMouseCursors.click,
                child: CountryFlag.fromCountryCode(
                  appLanguage.appLocale == const Locale('en') ? 'BA' : 'US',
                  height: SizeConfig.safeBlockVertical! * 1.25,
                  width: SizeConfig.safeBlockHorizontal! * 4,
                  borderRadius: SizeConfig.safeBlockVertical!,
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                PageRouteBuilder(
                  pageBuilder: (_, __, ___) => const Login(),
                  transitionDuration: Duration.zero,
                  reverseTransitionDuration: Duration.zero,
                ),
              );
            },
            child: MouseRegion(
              cursor: SystemMouseCursors.click,
              child: Icon(
                FontAwesomeIcons.userShield,
                size: SizeConfig.safeBlockVertical! * 1.25,
                color: Theme.of(context).primaryColorDark,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
