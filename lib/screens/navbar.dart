import 'package:flutter/material.dart';
import 'package:shpp/shared/navbar_option.dart';
import 'package:shpp/shared/size_config.dart';

class Navbar extends StatelessWidget {
  final Function(int index) onOptionSelected;
  const Navbar({
    super.key,
    required this.onOptionSelected,
  });

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
          InkWell(
              onTap: () => onOptionSelected(0),
              child: Image.asset('assets/images/logo.png')),
          SizedBox(
            width: SizeConfig.safeBlockHorizontal! * 23.5,
          ),
          Flexible(
            child: GestureDetector(
              onTap: () => onOptionSelected(0),
              child: const NavbarOption(
                text: 'Početna',
              ),
            ),
          ),
          SizedBox(
            width: SizeConfig.safeBlockHorizontal! * 2,
          ),
          Flexible(
            child: GestureDetector(
              onTap: () => onOptionSelected(1),
              child: const NavbarOption(
                text: 'O nama',
              ),
            ),
          ),
          SizedBox(
            width: SizeConfig.safeBlockHorizontal! * 2,
          ),
          Flexible(
            child: GestureDetector(
              onTap: () => onOptionSelected(2),
              child: const NavbarOption(
                text: 'Usluge',
              ),
            ),
          ),
          SizedBox(
            width: SizeConfig.safeBlockHorizontal! * 2,
          ),
          Flexible(
            child: GestureDetector(
              onTap: () => onOptionSelected(3),
              child: const NavbarOption(
                text: 'Projekti',
              ),
            ),
          ),
          SizedBox(
            width: SizeConfig.safeBlockHorizontal! * 2,
          ),
          Flexible(
            child: GestureDetector(
              onTap: () => onOptionSelected(4),
              child: const NavbarOption(
                text: 'Novosti',
              ),
            ),
          ),
          SizedBox(
            width: SizeConfig.safeBlockHorizontal! * 2,
          ),
          Flexible(
            child: GestureDetector(
              onTap: () => onOptionSelected(5),
              child: const NavbarOption(
                text: 'Kontakt',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
