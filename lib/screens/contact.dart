import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shpp/shared/action_button.dart';
import 'package:shpp/shared/size_config.dart';
import 'package:url_launcher/url_launcher.dart';

class Contact extends StatefulWidget {
  final GlobalKey globalKey;
  const Contact({
    super.key,
    required this.globalKey,
  });

  @override
  State<Contact> createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  late String email, text;

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
                  SizedBox(
                    width: SizeConfig.safeBlockHorizontal! * 32,
                    child: Row(
                      children: [
                        Icon(
                          FontAwesomeIcons.phone,
                          size: SizeConfig.safeBlockVertical! * 2,
                          color: Theme.of(context).primaryColorDark,
                        ),
                        SizedBox(
                          width: SizeConfig.safeBlockHorizontal! * 1.25,
                        ),
                        Text(
                          '+387 61 214 113',
                          style: GoogleFonts.mulish(
                            fontSize: SizeConfig.safeBlockVertical! * 1.5,
                            fontWeight: FontWeight.w500,
                            color: Theme.of(context).primaryColorDark,
                          ),
                        ),
                        SizedBox(
                          width: SizeConfig.safeBlockHorizontal! * 3,
                        ),
                        Icon(
                          FontAwesomeIcons.phone,
                          size: SizeConfig.safeBlockVertical! * 2,
                          color: Theme.of(context).primaryColorDark,
                        ),
                        SizedBox(
                          width: SizeConfig.safeBlockHorizontal! * 1.25,
                        ),
                        Text(
                          '+387 62 451 737',
                          style: GoogleFonts.mulish(
                            fontSize: SizeConfig.safeBlockVertical! * 1.5,
                            fontWeight: FontWeight.w500,
                            color: Theme.of(context).primaryColorDark,
                          ),
                        ),
                        SizedBox(
                          width: SizeConfig.safeBlockHorizontal! * 3,
                        ),
                        Icon(
                          FontAwesomeIcons.phone,
                          size: SizeConfig.safeBlockVertical! * 2,
                          color: Theme.of(context).primaryColorDark,
                        ),
                        SizedBox(
                          width: SizeConfig.safeBlockHorizontal! * 1.25,
                        ),
                        Text(
                          '+387 63 343 320',
                          style: GoogleFonts.mulish(
                            fontSize: SizeConfig.safeBlockVertical! * 1.5,
                            fontWeight: FontWeight.w500,
                            color: Theme.of(context).primaryColorDark,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.safeBlockVertical! * 4,
                  ),
                  SizedBox(
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
                                color: Theme.of(context).colorScheme.secondary,
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
                          minLines: 5, //Normal textInputField will be displayed
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
                                color: Theme.of(context).colorScheme.secondary,
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
                            String email = Uri.encodeComponent("shpp@shpp.ba");
                            String subject =
                                Uri.encodeComponent("Zdravo SHPP - $email");
                            String body = Uri.encodeComponent(text);
                            Uri mail = Uri.parse(
                                "mailto:$email?subject=$subject&body=$body");

                            final Uri emailLaunchUri = Uri(
                              scheme: 'mailto',
                              path: 'shpp@shpp.ba',
                              query: encodeQueryParameters(<String, String>{
                                'subject': 'Zdravo SHPP - $email',
                              }),
                            );

                            if (await launchUrl(emailLaunchUri)) {
                              //email app opened
                            } else {
                              //email app is not opened
                            }
                          },
                        )
                      ],
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
