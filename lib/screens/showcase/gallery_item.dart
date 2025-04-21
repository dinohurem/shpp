import 'package:firebase_storage/firebase_storage.dart';
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
              child: FutureBuilder(
                future: FirebaseStorage.instance.ref(imageUrl).getDownloadURL(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  }
                  if (snapshot.hasError || !snapshot.hasData) {
                    return const Icon(Icons.broken_image,
                        size: 60, color: Colors.red);
                  }
                  return Image.network(
                    snapshot.data!,
                    width: MediaQuery.of(context).size.width * 0.7,
                    fit: BoxFit.contain,
                  );
                },
              )),
        ),
      ),
    );
  }
}
