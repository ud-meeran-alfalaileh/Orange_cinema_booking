import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:get/get.dart';

class UploadTestController extends GetxController {
  RxString imagePath = ''.obs;
  Rx<PlatformFile?> selectedFile = Rx<PlatformFile?>(null);

  Future<void> pickImage() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image,
    );

    if (result != null) {
      selectedFile.value = result.files.single;
      imagePath.value = result.files.single.path!;
    }
  }

  Future<void> saveToFirebase({required String userId}) async {
    if (selectedFile.value == null) {
      // Handle case where no file is selected
      return;
    }
    String imageFileName = 'user_${DateTime.now().millisecondsSinceEpoch}.jpg';
    await firebase_storage.FirebaseStorage.instance
        .ref('images/$imageFileName')
        .putFile(File(imagePath.value));

    String downloadURL = await firebase_storage.FirebaseStorage.instance
        .ref('images/$imageFileName')
        .getDownloadURL();

    final FirebaseFirestore firestore = FirebaseFirestore.instance;

    CollectionReference users = firestore.collection('User');

    await users.doc(userId).update({
      'imageUrl': downloadURL,
    });

    // Reset form fields
    imagePath.value = '';
    selectedFile.value = null;
  }

  void deleteSelectedFile() {
    if (selectedFile.value != null) {
      selectedFile.value = null;
      imagePath.value = '';
    }
  }
}
