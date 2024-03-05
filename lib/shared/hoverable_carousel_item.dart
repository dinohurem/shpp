import 'package:flutter/material.dart';

class HoverableCarouselItem extends StatefulWidget {
  final Widget child;

  const HoverableCarouselItem({
    super.key,
    required this.child,
  });

  @override
  HoverableCarouselItemState createState() => HoverableCarouselItemState();
}

class HoverableCarouselItemState extends State<HoverableCarouselItem> {
  bool _isHovered = false;

  void _onHover(bool isHovered) {
    setState(() {
      _isHovered = isHovered;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => _onHover(true),
      onExit: (_) => _onHover(false),
      child: Opacity(
        opacity: _isHovered ? 1.0 : 0.3,
        child: widget.child,
      ),
    );
  }
}
