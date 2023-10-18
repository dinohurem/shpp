import 'package:flutter/material.dart';
import 'package:shpp/screens/navbar.dart';

class NavbarShell extends StatefulWidget {
  final bool showShadow;
  final dynamic Function(int) action;
  const NavbarShell(
      {super.key, required this.showShadow, required this.action});

  @override
  State<NavbarShell> createState() => _NavbarShellState();
}

class _NavbarShellState extends State<NavbarShell> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: !widget.showShadow
            ? null
            : LinearGradient(
                colors: [
                  const Color.fromARGB(255, 253, 252, 236),
                  Theme.of(context).primaryColorLight,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: const [
                  0.1,
                  0.6,
                ],
                tileMode: TileMode.clamp),
        boxShadow: !widget.showShadow
            ? null
            : [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 3,
                ),
              ],
      ),
      child: Navbar(
        onOptionSelected: widget.action,
      ),
    );
  }
}
