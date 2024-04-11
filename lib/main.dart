// ignore_for_file: depend_on_referenced_packages, prefer_const_constructors

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shpp/config/firebase_options.dart';
import 'package:shpp/services/app_language.dart';
import 'package:shpp/shared/router.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  AppLanguage appLanguage = AppLanguage();
  await appLanguage.fetchLocale();

  usePathUrlStrategy();
  final goRouter = router;
  runApp(MyApp(goRouter: goRouter, language: appLanguage));
}

class MyApp extends StatelessWidget {
  final AppLanguage language;
  final GoRouter goRouter;
  const MyApp({
    super.key,
    required this.goRouter,
    required this.language,
  });

  @override
  Widget build(BuildContext context) {
    // final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    // final FirebaseStorage firebaseStorage = FirebaseStorage.instance;

    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AppLanguage>(
          create: (context) => language,
        ),
      ],
      child: Consumer<AppLanguage>(
        builder: (context, model, child) {
          return MaterialApp.router(
            scrollBehavior: const MaterialScrollBehavior().copyWith(
              dragDevices: {PointerDeviceKind.mouse},
            ),
            debugShowCheckedModeBanner: false,
            title: 'SHPP',
            locale: model.appLocale,
            supportedLocales: const [
              Locale('bs'),
              Locale('en'),
            ],
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            theme: ThemeData(
              primarySwatch: Colors.lightBlue,
              textTheme: GoogleFonts.mulishTextTheme(
                Theme.of(context).textTheme,
              ),
              primaryColor: const Color(0xFFfcf8f5),
              primaryColorLight: const Color.fromARGB(255, 229, 236, 253),
              primaryColorDark: const Color(0xFF2e3b4c),
            ),
            routerConfig: router,
          );
        },
      ),
    );
  }
}
