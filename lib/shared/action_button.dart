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
  double _topLeft = SizeConfig.safeBlockHorizontal! * 4;
  final double _topRight = SizeConfig.safeBlockHorizontal! * 4;
  final double _bottomLeft = SizeConfig.safeBlockHorizontal! * 4;
  double _bottomRight = SizeConfig.safeBlockHorizontal! * 2;
  bool _isHovering = false;

  void _onHover(bool isHovering) {
    setState(() {
      _isHovering = isHovering;

      _topLeft = isHovering
          ? SizeConfig.safeBlockHorizontal! * 2
          : SizeConfig.safeBlockHorizontal! * 4;
      _bottomRight = isHovering
          ? SizeConfig.safeBlockHorizontal! * 4
          : SizeConfig.safeBlockHorizontal! * 2;
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return InkWell(
      onTap: widget.onTap,
      onHover: _onHover,
      child: Material(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(_topLeft),
          topRight: Radius.circular(_topRight),
          bottomLeft: Radius.circular(_bottomLeft),
          bottomRight: Radius.circular(_bottomRight),
        ),
        elevation: _isHovering ? 2 : 0,
        color: _isHovering
            ? Theme.of(context).primaryColorDark.withBlue(100)
            : Theme.of(context).primaryColorDark,
        child: AnimatedContainer(
          duration: const Duration(seconds: 2),
          curve: Curves.fastOutSlowIn,
          padding: EdgeInsets.symmetric(
              vertical: SizeConfig.safeBlockVertical! * 2,
              horizontal: SizeConfig.safeBlockHorizontal! * 3),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(_topLeft),
              topRight: Radius.circular(_topRight),
              bottomLeft: Radius.circular(_bottomLeft),
              bottomRight: Radius.circular(_bottomRight),
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
