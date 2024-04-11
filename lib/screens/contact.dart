// ignore_for_file: must_be_immutable, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shpp/shared/action_button.dart';
import 'package:shpp/shared/size_config.dart';
import 'package:url_launcher/url_launcher.dart';

class Contact extends StatefulWidget {
  GlobalKey globalKey;
  Contact({
    required this.globalKey,
  });

  @override
  State<Contact> createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  late String email, text;
  final _formKey = GlobalKey<FormState>();

  String? encodeQueryParameters(Map<String, String> params) {
    return params.entries
        .map((MapEntry<String, String> e) =>
            '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
        .join('&');
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: SizeConfig.safeBlockVertical! * 10,
      ),
      child: SizedBox(
        key: widget.globalKey,
        width: SizeConfig.safeBlockHorizontal! * 70,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Kontaktirajte nas'.toUpperCase(),
              style: GoogleFonts.mulish(
                fontSize: SizeConfig.safeBlockVertical! * 1.5,
                fontWeight: FontWeight.w700,
                color: Theme.of(context).primaryColorDark,
              ),
            ),
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: SizeConfig.safeBlockVertical! * 3,
                  ),
                  Text(
                    'Spremni smo odgovoriti na sve Vaše upite',
                    style: GoogleFonts.mulish(
                      fontSize: SizeConfig.safeBlockVertical! * 3,
                      fontWeight: FontWeight.w800,
                      color: Theme.of(context).primaryColorDark,
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.safeBlockVertical! * 2,
                  ),
                  Center(
                    child: SizedBox(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(
                                    FontAwesomeIcons.phone,
                                    size: SizeConfig.safeBlockVertical! * 2,
                                    color: Theme.of(context).primaryColorDark,
                                  ),
                                  SizedBox(
                                    width:
                                        SizeConfig.safeBlockHorizontal! * 0.5,
                                  ),
                                  Text(
                                    '+387 61 214 113',
                                    style: GoogleFonts.mulish(
                                      fontSize:
                                          SizeConfig.safeBlockVertical! * 1.5,
                                      fontWeight: FontWeight.w500,
                                      color: Theme.of(context).primaryColorDark,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: SizeConfig.safeBlockVertical! * 2,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(
                                    FontAwesomeIcons.envelope,
                                    size: SizeConfig.safeBlockVertical! * 2,
                                    color: Theme.of(context).primaryColorDark,
                                  ),
                                  SizedBox(
                                    width:
                                        SizeConfig.safeBlockHorizontal! * 0.5,
                                  ),
                                  Text(
                                    'shpp@shpp.ba',
                                    style: GoogleFonts.mulish(
                                      fontSize:
                                          SizeConfig.safeBlockVertical! * 1.5,
                                      fontWeight: FontWeight.w500,
                                      color: Theme.of(context).primaryColorDark,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: SizeConfig.safeBlockVertical! * 2,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(
                                    FontAwesomeIcons.locationDot,
                                    size: SizeConfig.safeBlockVertical! * 2,
                                    color: Theme.of(context).primaryColorDark,
                                  ),
                                  SizedBox(
                                    width:
                                        SizeConfig.safeBlockHorizontal! * 0.5,
                                  ),
                                  Text(
                                    'Safvet-bega Bašagića 24\n71000 Sarajevo\nBosna i Hercegovina',
                                    style: GoogleFonts.mulish(
                                      fontSize:
                                          SizeConfig.safeBlockVertical! * 1.5,
                                      fontWeight: FontWeight.w500,
                                      color: Theme.of(context).primaryColorDark,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            width: SizeConfig.safeBlockHorizontal! * 2,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(
                                    FontAwesomeIcons.phone,
                                    size: SizeConfig.safeBlockVertical! * 2,
                                    color: Theme.of(context).primaryColorDark,
                                  ),
                                  SizedBox(
                                    width:
                                        SizeConfig.safeBlockHorizontal! * 0.5,
                                  ),
                                  Text(
                                    '+387 62 451 737',
                                    style: GoogleFonts.mulish(
                                      fontSize:
                                          SizeConfig.safeBlockVertical! * 1.5,
                                      fontWeight: FontWeight.w500,
                                      color: Theme.of(context).primaryColorDark,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: SizeConfig.safeBlockVertical! * 2,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Icon(
                                    FontAwesomeIcons.envelope,
                                    size: SizeConfig.safeBlockVertical! * 2,
                                    color: Theme.of(context).primaryColorDark,
                                  ),
                                  SizedBox(
                                    width:
                                        SizeConfig.safeBlockHorizontal! * 0.5,
                                  ),
                                  Text(
                                    'amer.jerlagic@shpp.ba',
                                    style: GoogleFonts.mulish(
                                      fontSize:
                                          SizeConfig.safeBlockVertical! * 1.5,
                                      fontWeight: FontWeight.w500,
                                      color: Theme.of(context).primaryColorDark,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            width: SizeConfig.safeBlockHorizontal! * 2,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    FontAwesomeIcons.phone,
                                    size: SizeConfig.safeBlockVertical! * 2,
                                    color: Theme.of(context).primaryColorDark,
                                  ),
                                  SizedBox(
                                    width:
                                        SizeConfig.safeBlockHorizontal! * 0.5,
                                  ),
                                  Text(
                                    '+387 61 526 066',
                                    style: GoogleFonts.mulish(
                                      fontSize:
                                          SizeConfig.safeBlockVertical! * 1.5,
                                      fontWeight: FontWeight.w500,
                                      color: Theme.of(context).primaryColorDark,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.safeBlockVertical! * 4,
                  ),
                  Form(
                    key: _formKey,
                    child: SizedBox(
                      width: SizeConfig.safeBlockHorizontal! * 32,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Email',
                            style: GoogleFonts.mulish(
                              fontSize: SizeConfig.safeBlockVertical! * 1.5,
                              fontWeight: FontWeight.w500,
                              color: Theme.of(context).primaryColorDark,
                            ),
                          ),
                          SizedBox(
                            height: SizeConfig.safeBlockVertical!,
                          ),
                          TextFormField(
                            validator: (value) {
                              if (value!.isEmpty ||
                                  !RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
                                      .hasMatch(value)) {
                                return 'Molimo unesite validnu email adresu.';
                              } else {
                                return null;
                              }
                            },
                            decoration: InputDecoration(
                              hintText: 'Email',
                              hintStyle: const TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.w500,
                              ),
                              fillColor: Theme.of(context).primaryColorDark,
                              contentPadding: EdgeInsets.symmetric(
                                vertical: SizeConfig.safeBlockVertical! * 2.5,
                                horizontal: SizeConfig.safeBlockHorizontal! * 2,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                  SizeConfig.safeBlockVertical!,
                                ),
                                borderSide: BorderSide(
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                ),
                              ),
                            ),
                            onChanged: (val) {
                              setState(() => email = val);
                            },
                          ),
                          SizedBox(
                            height: SizeConfig.safeBlockVertical! * 3,
                          ),
                          Text(
                            'Poruka',
                            style: GoogleFonts.mulish(
                              fontSize: SizeConfig.safeBlockVertical! * 1.5,
                              fontWeight: FontWeight.w500,
                              color: Theme.of(context).primaryColorDark,
                            ),
                          ),
                          SizedBox(
                            height: SizeConfig.safeBlockVertical!,
                          ),
                          TextFormField(
                            minLines:
                                5, //Normal textInputField will be displayed
                            maxLines: 8,
                            decoration: InputDecoration(
                              hintText: 'Unesite poruku...',
                              hintStyle: const TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.w500,
                              ),
                              fillColor: Theme.of(context).primaryColorDark,
                              contentPadding: EdgeInsets.symmetric(
                                vertical: SizeConfig.safeBlockVertical! * 2.5,
                                horizontal: SizeConfig.safeBlockHorizontal! * 2,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                  SizeConfig.safeBlockVertical!,
                                ),
                                borderSide: BorderSide(
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                ),
                              ),
                            ),
                            onChanged: (val) {
                              setState(() => text = val);
                            },
                          ),
                          SizedBox(
                            height: SizeConfig.safeBlockVertical! * 3,
                          ),
                          ActionButton(
                            text: 'Pošalji poruku',
                            onTap: () async {
                              if (_formKey.currentState!.validate()) {
                                final Uri emailLaunchUri = Uri(
                                  scheme: 'mailto',
                                  path: 'shpp@shpp.ba',
                                  query: encodeQueryParameters(<String, String>{
                                    'subject': 'Zdravo SHPP - kontakt',
                                    'body': text,
                                  }),
                                );

                                if (await launchUrl(emailLaunchUri)) {
                                  //email app opened
                                } else {
                                  //email app is not opened
                                }
                              }
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
