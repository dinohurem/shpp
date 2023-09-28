import 'package:flutter/material.dart';
import 'package:shpp/screens/about.dart';
import 'package:shpp/screens/landing.dart';
import 'package:shpp/screens/navbar.dart';
import 'package:shpp/shared/size_config.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Container(
        width: SizeConfig.safeBlockHorizontal! * 100,
        height: SizeConfig.safeBlockVertical! * 100,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [
                const Color.fromARGB(255, 253, 252, 236),
                Theme.of(context).primaryColorLight,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: const [
                0.3,
                0.9,
              ],
              tileMode: TileMode.clamp),
        ),
        child: const Center(
          child: Column(
            children: [
              Navbar(),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Landing(),
                      About(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
