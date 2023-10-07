import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shpp/shared/size_config.dart';

class ActionButton extends StatefulWidget {
  final String text;
  final void Function()? onTap;
  const ActionButton({super.key, required this.text, required this.onTap});

  @override
  ActionButtonState createState() => ActionButtonState();
}

class ActionButtonState extends State<ActionButton> {
  bool _isHovering = false;

  void _onHover(bool isHovering) {
    setState(() {
      _isHovering = isHovering;
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return InkWell(
      onTap: widget.onTap,
      onHover: _onHover,
      child: Material(
        elevation: _isHovering ? 10 : 2,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(SizeConfig.safeBlockHorizontal! * 4),
          topRight: Radius.circular(SizeConfig.safeBlockHorizontal! * 4),
          bottomLeft: Radius.circular(SizeConfig.safeBlockHorizontal! * 4),
          bottomRight: Radius.circular(SizeConfig.safeBlockHorizontal! * 2),
        ),
        color: _isHovering
            ? Theme.of(context).primaryColorDark.withOpacity(0.8)
            : Theme.of(context).primaryColorDark,
        child: Container(
          padding: EdgeInsets.symmetric(
              vertical: SizeConfig.safeBlockVertical! * 2,
              horizontal: SizeConfig.safeBlockHorizontal! * 3),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(SizeConfig.safeBlockHorizontal! * 4),
              topRight: Radius.circular(SizeConfig.safeBlockHorizontal! * 4),
              bottomLeft: Radius.circular(SizeConfig.safeBlockHorizontal! * 4),
              bottomRight: Radius.circular(SizeConfig.safeBlockHorizontal! * 2),
            ),
          ),
          child: Text(
            widget.text.toUpperCase(),
            style: GoogleFonts.mulish(
              fontSize: SizeConfig.safeBlockVertical! * 1.5,
              fontWeight: FontWeight.w400,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
