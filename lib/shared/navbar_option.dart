import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shpp/shared/size_config.dart';

class NavbarOption extends StatefulWidget {
  final String text;
  const NavbarOption({
    super.key,
    required this.text,
  });

  @override
  NavbarOptionState createState() => NavbarOptionState();
}

class NavbarOptionState extends State<NavbarOption> {
  bool _isHovering = false;

  void _onHover(bool hovering) {
    setState(() {
      _isHovering = hovering;
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => _onHover(true),
      onExit: (_) => _onHover(false),
      child: Text(
        widget.text,
        style: GoogleFonts.mulish(
          fontSize: SizeConfig.safeBlockVertical! * 1.55,
          fontWeight: _isHovering ? FontWeight.w800 : FontWeight.w600,
          color: Theme.of(context).primaryColorDark,
        ),
      ),
    );
  }
}
