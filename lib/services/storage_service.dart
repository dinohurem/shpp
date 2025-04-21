import 'package:firebase_storage/firebase_storage.dart';

class StorageService {
  final FirebaseStorage _storage = FirebaseStorage.instance;

  Future<String> getImageUrl(String path) async {
    final ref = _storage.ref(path);
    return await ref.getDownloadURL();
  }
}
