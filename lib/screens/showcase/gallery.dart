// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shpp/models/project.dart';
import 'package:shpp/screens/showcase/gallery_item.dart';
import 'package:shpp/shared/size_config.dart';

class Gallery extends StatefulWidget {
  final Project project;
  const Gallery({
    super.key,
    required this.project,
  });

  @override
  _GalleryState createState() => _GalleryState();
}

class _GalleryState extends State<Gallery> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.project.title.toUpperCase(),
          style: GoogleFonts.mulish(
            fontSize: SizeConfig.safeBlockVertical! * 1.5,
            fontWeight: FontWeight.w700,
            color: Theme.of(context).primaryColorDark,
          ),
        ),
        automaticallyImplyLeading: true,
      ),
      body: Center(
        child: SizedBox(
          height: SizeConfig.safeBlockVertical! * 90,
          width: SizeConfig.safeBlockHorizontal! * 70,
          child: GridView.count(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            crossAxisCount: 4,
            mainAxisSpacing: SizeConfig.safeBlockVertical! * 2,
            crossAxisSpacing: SizeConfig.safeBlockVertical! * 2,
            children: List.generate(widget.project.urls.length, (index) {
              return GestureDetector(
                onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => GalleryItem(
                    imageUrl: widget.project.urls[index],
                  ),
                )),
                child: Hero(
                  tag: widget.project.urls[index],
                  child: MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: SizedBox(
                      width: SizeConfig.safeBlockHorizontal! * 15,
                      height: SizeConfig.safeBlockVertical! * 15,
                      child: Image.network(
                        widget.project.urls[index],
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
