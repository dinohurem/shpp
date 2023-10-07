// ignore_for_file: depend_on_referenced_packages, prefer_const_constructors

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shpp/config/firebase_options.dart';
import 'package:shpp/shared/router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    name: 'SHPP',
    options: DefaultFirebaseOptions.currentPlatform,
  );

  usePathUrlStrategy();
  final goRouter = router;
  runApp(MyApp(goRouter: goRouter));
}

class MyApp extends StatelessWidget {
  final GoRouter goRouter;
  const MyApp({
    super.key,
    required this.goRouter,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      scrollBehavior: const MaterialScrollBehavior().copyWith(
        dragDevices: {PointerDeviceKind.mouse},
      ),
      debugShowCheckedModeBanner: false,
      title: 'SHPP',
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
        textTheme: GoogleFonts.mulishTextTheme(
          Theme.of(context).textTheme,
        ),
        primaryColor: const Color(0xFFfcf8f5),
        primaryColorLight: const Color.fromARGB(255, 229, 236, 253),
        primaryColorDark: const Color(0xFF2e3b4c),
      ),
      routerConfig: goRouter,
    );
  }
}
