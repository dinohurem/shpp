import 'package:flutter/material.dart';
import 'package:shpp/shared/size_config.dart';

class GalleryItem extends StatelessWidget {
  final String imageUrl;

  const GalleryItem({Key? key, required this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          GestureDetector(
            onTap: () => Navigator.of(context).pop(),
            child: MouseRegion(
              cursor: SystemMouseCursors.click,
              child: Padding(
                padding: EdgeInsets.only(
                  right: SizeConfig.safeBlockHorizontal! * 1,
                  top: SizeConfig.safeBlockVertical! * 1,
                ),
                child: Icon(Icons.close,
                    color: Theme.of(context).primaryColorDark,
                    size: SizeConfig.safeBlockVertical! * 3),
              ),
            ),
          )
        ],
      ),
      body: GestureDetector(
        onTap: () => Navigator.of(context).pop(),
        child: Center(
          child: Hero(
            tag: imageUrl,
            child: Image.network(
              imageUrl,
              width: MediaQuery.of(context).size.width * 0.7,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}
