import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_bs.dart';
import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('bs'),
    Locale('en')
  ];

  /// No description provided for @pocetna.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get pocetna;

  /// No description provided for @onama.
  ///
  /// In en, this message translates to:
  /// **'About Us'**
  String get onama;

  /// No description provided for @usluge.
  ///
  /// In en, this message translates to:
  /// **'Services'**
  String get usluge;

  /// No description provided for @projekti.
  ///
  /// In en, this message translates to:
  /// **'Projects'**
  String get projekti;

  /// No description provided for @novosti.
  ///
  /// In en, this message translates to:
  /// **'News'**
  String get novosti;

  /// No description provided for @kontakt.
  ///
  /// In en, this message translates to:
  /// **'Contact'**
  String get kontakt;

  /// No description provided for @putem_obnovljive_energije_ka_odrzivoj_buducnosti.
  ///
  /// In en, this message translates to:
  /// **'Through renewable energy towards a sustainable future.'**
  String get putem_obnovljive_energije_ka_odrzivoj_buducnosti;

  /// No description provided for @saznajte_vise_o_obnovljivim_izvorima_energije_sa_shppom.
  ///
  /// In en, this message translates to:
  /// **'Learn more about renewable energy sources with SHPP.'**
  String get saznajte_vise_o_obnovljivim_izvorima_energije_sa_shppom;

  /// No description provided for @saznaj_vise.
  ///
  /// In en, this message translates to:
  /// **'Learn more'**
  String get saznaj_vise;

  /// No description provided for @klijenti_koji_su_nam_ukazali_povjerenje.
  ///
  /// In en, this message translates to:
  /// **'Clients who have entrusted us'**
  String get klijenti_koji_su_nam_ukazali_povjerenje;

  /// No description provided for @proizvodimo_elektricnu_energiju_iz_obnovljivih_izvora.
  ///
  /// In en, this message translates to:
  /// **'We produce electric energy from renewable sources'**
  String get proizvodimo_elektricnu_energiju_iz_obnovljivih_izvora;

  /// No description provided for @onama_tekst.
  ///
  /// In en, this message translates to:
  /// **'SHPP d.o.o. Sarajevo was established as a need for environmental protection and emphasis on investment in renewable electric energy sources, whether it concerns small hydropower plants, photovoltaic installations, wind power plants, cogeneration, or biogas plants.'**
  String get onama_tekst;

  /// No description provided for @onama_tekst2.
  ///
  /// In en, this message translates to:
  /// **'Energy efficiency is part of our portfolio, and by installing and using the most modern global devices for saving electric energy, you save energy and reduce your costs.\nWe will be your interlocutor, your advisor, and your partner.'**
  String get onama_tekst2;

  /// No description provided for @misija.
  ///
  /// In en, this message translates to:
  /// **'Mission'**
  String get misija;

  /// No description provided for @vizija.
  ///
  /// In en, this message translates to:
  /// **'Vision'**
  String get vizija;

  /// No description provided for @misija_tekst.
  ///
  /// In en, this message translates to:
  /// **'By producing from renewable sources, we preserve nature and protect the environment.\n\nWe will be your best ally in reducing your costs.\n\nBy installing the latest global technologies for better energy efficiency.'**
  String get misija_tekst;

  /// No description provided for @vizija_tekst.
  ///
  /// In en, this message translates to:
  /// **'Our goal is to reduce the consumption of electric energy in Bosnia and Herzegovina by 5% and offer the best solutions for energy efficiency.\n\nIn the environment of a liberalized electric energy market, to be leading in mediating the sale of electric energy.'**
  String get vizija_tekst;

  /// No description provided for @instalirana_snaga.
  ///
  /// In en, this message translates to:
  /// **'installed power (kWp)'**
  String get instalirana_snaga;

  /// No description provided for @zavrsenih_projekata.
  ///
  /// In en, this message translates to:
  /// **'finished projects'**
  String get zavrsenih_projekata;

  /// No description provided for @godina_osnivanja.
  ///
  /// In en, this message translates to:
  /// **'year of establishment'**
  String get godina_osnivanja;

  /// No description provided for @usluge_naslov1.
  ///
  /// In en, this message translates to:
  /// **'ELECTRIC ENERGY PRODUCTION FROM RENEWABLE SOURCES'**
  String get usluge_naslov1;

  /// No description provided for @usluge_naslov2.
  ///
  /// In en, this message translates to:
  /// **'DESIGN AND INSTALLATION OF ELECTRIC VEHICLE CHARGING STATIONS'**
  String get usluge_naslov2;

  /// No description provided for @usluge_naslov3.
  ///
  /// In en, this message translates to:
  /// **'DESIGN, ENGINEERING, AND CONSULTING IN THE FIELD OF PHOTOVOLTAIC SOLAR POWER PLANTS'**
  String get usluge_naslov3;

  /// No description provided for @usluge_naslov4.
  ///
  /// In en, this message translates to:
  /// **'REACTIVE ENERGY COMPENSATION'**
  String get usluge_naslov4;

  /// No description provided for @usluge_naslov5.
  ///
  /// In en, this message translates to:
  /// **'DESIGN AND INSTALLATION OF ELECTRIC ENERGY SAVING EQUIPMENT'**
  String get usluge_naslov5;

  /// No description provided for @usluge_naslov6.
  ///
  /// In en, this message translates to:
  /// **'BROKERING IN ELECTRICITY SALES'**
  String get usluge_naslov6;

  /// No description provided for @usluge_tekst1.
  ///
  /// In en, this message translates to:
  /// **'Electric energy production based solely on renewable energy sources, primarily utilizing the renewable potential of Bosnia and Herzegovina.'**
  String get usluge_tekst1;

  /// No description provided for @usluge_tekst2.
  ///
  /// In en, this message translates to:
  /// **'The design and installation of electric vehicle charging stations offer innovative solutions for the electric vehicle infrastructure, including the installation of advanced fast and ultra-fast chargers.\n\nOur approach integrates the latest technologies and smart systems for efficient energy management and performance monitoring of the charging stations. Through our services, we contribute to sustainable transport and the promotion of environmental awareness.'**
  String get usluge_tekst2;

  /// No description provided for @usluge_tekst3.
  ///
  /// In en, this message translates to:
  /// **'Design, engineering, and consulting in the field of photovoltaic solar power plants encompass the development of solar projects, from initial site analysis to the final system implementation.\n\nOur team of experienced engineers and consultants employs the latest technologies and approaches to optimize the efficiency of solar power plants, including terrain analysis, equipment selection, and integration with energy grids. Innovative solutions support the transition to renewable energy sources, contributing to the reduction of the carbon footprint and promoting sustainable development.'**
  String get usluge_tekst3;

  /// No description provided for @usluge_tekst4.
  ///
  /// In en, this message translates to:
  /// **'SHPP d.o.o., in collaboration with our partners, offers you reactive energy compensation services on a turnkey basis.\n\nInvesting in reactive energy compensation is an investment with the shortest return on investment.'**
  String get usluge_tekst4;

  /// No description provided for @usluge_tekst5.
  ///
  /// In en, this message translates to:
  /// **'This method of production not only reduces dependence on fossil fuels but also significantly decreases the emission of harmful gases, contributing to global efforts in combating climate change.\n\nThe production of electric energy from renewable sources is becoming increasingly competitive, paving the way for a more sustainable and environmentally responsible energy future.'**
  String get usluge_tekst5;

  /// No description provided for @usluge_tekst6.
  ///
  /// In en, this message translates to:
  /// **'We approach our clients individually, guaranteeing them cost minimization and rationalization in energy use.'**
  String get usluge_tekst6;

  /// No description provided for @svi_nasi_projekti.
  ///
  /// In en, this message translates to:
  /// **'All our projects'**
  String get svi_nasi_projekti;

  /// No description provided for @kontaktirajte_nas.
  ///
  /// In en, this message translates to:
  /// **'Contact us'**
  String get kontaktirajte_nas;

  /// No description provided for @spremni_smo_odgovoriti_na_sve_vase_upite.
  ///
  /// In en, this message translates to:
  /// **'We are ready to answer all your inquiries.'**
  String get spremni_smo_odgovoriti_na_sve_vase_upite;

  /// No description provided for @validna_adresa.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid email address.'**
  String get validna_adresa;

  /// No description provided for @poruka.
  ///
  /// In en, this message translates to:
  /// **'Message'**
  String get poruka;

  /// No description provided for @unesite_poruku.
  ///
  /// In en, this message translates to:
  /// **'Add a message...'**
  String get unesite_poruku;

  /// No description provided for @posalji_poruku.
  ///
  /// In en, this message translates to:
  /// **'Send'**
  String get posalji_poruku;

  /// No description provided for @zdravo.
  ///
  /// In en, this message translates to:
  /// **'Hello SHPP - contact'**
  String get zdravo;

  /// No description provided for @pogledaj_slike.
  ///
  /// In en, this message translates to:
  /// **'view photos'**
  String get pogledaj_slike;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['bs', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'bs':
      return AppLocalizationsBs();
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
