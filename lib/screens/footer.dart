// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shpp/shared/navbar_option.dart';
import 'package:shpp/shared/size_config.dart';

class Footer extends StatefulWidget {
  final Function(int index) onOptionSelected;
  const Footer({
    super.key,
    required this.onOptionSelected,
  });

  @override
  State<Footer> createState() => _FooterState();
}

class _FooterState extends State<Footer> {
  final List<bool> _isHovering = [false, false, false];

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Padding(
      padding: EdgeInsets.only(
        top: SizeConfig.safeBlockVertical! * 5,
        bottom: SizeConfig.safeBlockVertical! * 2,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                  onTap: () => widget.onOptionSelected(0),
                  child: Image.asset('assets/images/logo.png')),
              SizedBox(
                width: SizeConfig.safeBlockHorizontal! * 5,
              ),
              Flexible(
                child: GestureDetector(
                  onTap: () => widget.onOptionSelected(0),
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
                  onTap: () => widget.onOptionSelected(1),
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
                  onTap: () => widget.onOptionSelected(2),
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
                  onTap: () => widget.onOptionSelected(3),
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
                  onTap: () => widget.onOptionSelected(4),
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
                  onTap: () => widget.onOptionSelected(5),
                  child: const NavbarOption(
                    text: 'Kontakt',
                  ),
                ),
              ),
              SizedBox(
                width: SizeConfig.safeBlockHorizontal! * 15,
              ),
              InkWell(
                onHover: (value) {
                  setState(() {
                    _isHovering[0] = !_isHovering[0];
                  });
                },
                onTap: () {
                  html.window.open(
                      'https://www.facebook.com/profile.php?id=100095698955411',
                      'facebook');
                },
                child: Icon(
                  FontAwesomeIcons.facebook,
                  size: SizeConfig.safeBlockVertical! * 2,
                  color: _isHovering[0]
                      ? Colors.grey
                      : Theme.of(context).primaryColorDark,
                ),
              ),
              SizedBox(
                width: SizeConfig.safeBlockHorizontal! * 0.5,
              ),
              InkWell(
                onHover: (value) {
                  setState(() {
                    _isHovering[1] = !_isHovering[1];
                  });
                },
                onTap: () {
                  html.window.open(
                      'https://www.instagram.com/shppsarajevo/', 'instagram');
                },
                child: Icon(
                  FontAwesomeIcons.instagram,
                  size: SizeConfig.safeBlockVertical! * 2,
                  color: _isHovering[1]
                      ? Colors.grey
                      : Theme.of(context).primaryColorDark,
                ),
              ),
              SizedBox(
                width: SizeConfig.safeBlockHorizontal! * 0.5,
              ),
              InkWell(
                onHover: (value) {
                  setState(() {
                    _isHovering[2] = !_isHovering[2];
                  });
                },
                onTap: () {
                  html.window.open(
                      'https://www.linkedin.com/company/shpp-d-o-o-sarajevo/',
                      'linkedIn');
                },
                child: Icon(
                  FontAwesomeIcons.linkedinIn,
                  size: SizeConfig.safeBlockVertical! * 2,
                  color: _isHovering[2]
                      ? Colors.grey
                      : Theme.of(context).primaryColorDark,
                ),
              ),
            ],
          ),
          SizedBox(
            height: SizeConfig.safeBlockVertical! * 2,
          ),
          SizedBox(
            width: SizeConfig.safeBlockHorizontal! * 10,
            child: Row(
              children: [
                InkWell(
                  onTap: () {
                    html.window.open('https://codiaq.io/', 'codiaq');
                  },
                  child: Text(
                    'Codiaq.io ',
                    style: GoogleFonts.mulish(
                      fontSize: SizeConfig.safeBlockVertical! * 1.25,
                      fontWeight: FontWeight.w400,
                      color: Theme.of(context).primaryColorDark,
                    ),
                  ),
                ),
                Icon(
                  FontAwesomeIcons.copyright,
                  size: SizeConfig.safeBlockVertical! * 1.5,
                  color: Theme.of(context).primaryColorDark,
                ),
                Text(
                  ' ${DateTime.now().year}',
                  style: GoogleFonts.mulish(
                    fontSize: SizeConfig.safeBlockVertical! * 1.25,
                    fontWeight: FontWeight.w400,
                    color: Theme.of(context).primaryColorDark,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
