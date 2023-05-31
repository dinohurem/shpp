import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shpp/shared/size_config.dart';

class Navbar extends StatelessWidget {
  const Navbar({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SizedBox(
      height: SizeConfig.safeBlockVertical! * 8,
      child: Row(
        children: [
          SizedBox(
            width: SizeConfig.safeBlockHorizontal! * 20,
          ),
          Flexible(child: Image.asset('assets/images/logo.png')),
          SizedBox(
            width: SizeConfig.safeBlockHorizontal! * 31,
          ),
          Flexible(
            child: Text(
              'O nama',
              style: GoogleFonts.mulish(
                fontSize: SizeConfig.safeBlockVertical! * 1.5,
                fontWeight: FontWeight.w400,
                color: Theme.of(context).primaryColorDark,
              ),
            ),
          ),
          SizedBox(
            width: SizeConfig.safeBlockHorizontal! * 2,
          ),
          Flexible(
            child: Text(
              'Usluge',
              style: GoogleFonts.mulish(
                fontSize: SizeConfig.safeBlockVertical! * 1.5,
                fontWeight: FontWeight.w400,
                color: Theme.of(context).primaryColorDark,
              ),
            ),
          ),
          SizedBox(
            width: SizeConfig.safeBlockHorizontal! * 2,
          ),
          Flexible(
            child: Text(
              'Projekti',
              style: GoogleFonts.mulish(
                fontSize: SizeConfig.safeBlockVertical! * 1.5,
                fontWeight: FontWeight.w400,
                color: Theme.of(context).primaryColorDark,
              ),
            ),
          ),
          SizedBox(
            width: SizeConfig.safeBlockHorizontal! * 2,
          ),
          Flexible(
            child: Text(
              'Preporuke',
              style: GoogleFonts.mulish(
                fontSize: SizeConfig.safeBlockVertical! * 1.5,
                fontWeight: FontWeight.w400,
                color: Theme.of(context).primaryColorDark,
              ),
            ),
          ),
          SizedBox(
            width: SizeConfig.safeBlockHorizontal! * 2,
          ),
          Flexible(
            child: Text(
              'Kontakt',
              style: GoogleFonts.mulish(
                fontSize: SizeConfig.safeBlockVertical! * 1.5,
                fontWeight: FontWeight.w400,
                color: Theme.of(context).primaryColorDark,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
