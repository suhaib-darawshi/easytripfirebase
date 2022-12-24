import 'dart:developer';
import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

class StorageHelper {
  StorageHelper._();
  static StorageHelper storageHelper = StorageHelper._();
  FirebaseStorage firebaseStorage = FirebaseStorage.instance;
  Future<String> uploadNewImage(String folderName, File file) async {
    log('message');
    String filePath = file.path;
    String fileName = filePath.split('/').last;
    Reference reference = firebaseStorage.ref('$folderName/$fileName');
    await reference.putFile(file);
    String url = await reference.getDownloadURL();
    log(url);
    return url;
  }
}
