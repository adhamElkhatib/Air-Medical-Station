import 'package:firebase_storage/firebase_storage.dart';

import '../Error Handling/error_handling.service.dart';
import 'src/models/storage_file.model.dart';

class FirebaseStorageService {
  //
  static final _storage = FirebaseStorage.instance;

  //

  //
  static UploadTask? uploadSingle(String path, StorageFile file) {
    try {
      // check if file exists and delete..
      Reference ref =
          _storage.ref('$path/${file.fileName}.${file.fileExtension}');
      return ref.putData(
        file.data,
        SettableMetadata(
          contentType: "image/jpeg",
        ),
      );
    } catch (e) {
      ErrorHandlingService.handle(e, 'StorageService/uploadSingle');
    }
    return null;
  }

  static UploadTask? uploadMultiple(String path, StorageFile file) {
    try {
      // check if file exists and delete..
      Reference ref =
          _storage.ref('$path/${file.fileName}.${file.fileExtension}');
      return ref.putData(
        file.data,
        SettableMetadata(
          contentType: "image/jpeg",
        ),
      );
    } catch (e) {
      ErrorHandlingService.handle(e, 'StorageService/uploadSingle');
    }
    return null;
  }

  static Future<String?> downloadSingle(String path) async {
    try {
      var urlRef = _storage.ref(path);
      var imgUrl = await urlRef.getDownloadURL();
      return imgUrl;
    } catch (e) {
      return null;
    }
  }

  static Future<List<String?>> downloadMultiple(List<String> paths) async {
    List<String?> downloadUrls = [];
    List<Future<String?>> downloadTasks = [];

    for (String path in paths) {
      downloadTasks.add(downloadSingle(path));
    }

    try {
      downloadUrls = await Future.wait(downloadTasks);
    } catch (e) {
      ErrorHandlingService.handle(e, 'StorageService/downloadMultiple');
    }

    return downloadUrls;
  }

  static Future<List<Map<String, dynamic>>> downloadImagesInDirectory(
      String directoryPath) async {
    try {
      final listResult = await _storage.ref(directoryPath).listAll();
      final imageDetails = <Map<String, dynamic>>[];

      for (var itemRef in listResult.items) {
        final filePath = itemRef.fullPath;

        // Check if the file is an image
        if (filePath.endsWith('.jpg') ||
            filePath.endsWith('.jpeg') ||
            filePath.endsWith('.png')) {
          final metadata = await itemRef.getMetadata();
          final url = await downloadSingle(filePath);

          imageDetails.add({
            'fileName': itemRef.name,
            'uploadDate': metadata.timeCreated,
            'url': url,
          });
        }
      }

      return imageDetails;
    } catch (e) {
      ErrorHandlingService.handle(
          e, 'StorageService/downloadImagesInDirectory');
      return [];
    }
  }
}
