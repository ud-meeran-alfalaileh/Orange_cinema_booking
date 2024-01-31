import 'dart:io';

import 'package:cinema_booking_app/src/constant/color.dart';
import 'package:cinema_booking_app/src/model/user_model.dart';
import 'package:cinema_booking_app/src/repository/auth/auth_repo.dart';
import 'package:cinema_booking_app/src/repository/user_repo/user_repo.dart';
import 'package:cinema_booking_app/src/view/forms/edit_profile_page.dart';
import 'package:cinema_booking_app/src/view/ticket/my_ticket.dart';
import 'package:cinema_booking_app/src/widget/custom_widget/profile_button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ProfileController extends GetxController {
  static ProfileController get instance => Get.find();
  final _authRepo = Get.put(AuthenticationRepository());
  final _userRepo = Get.put(UserRepo());
  late UserModel userModel;
  Rx<File?> image = Rx<File?>(null);

  void setImage(File? newImage) {
    image.value = newImage;
  }

  List<ProfileButton> profile = [
    ProfileButton(
        title: "My Ticket",
        ontap: () {
          Get.to(MyTicketPage());
        },
        icon: 'assets/ticket.svg'),
    ProfileButton(
        icon: 'assets/myCredit.svg', title: "My Credit Cards", ontap: () {}),
    ProfileButton(
        icon: 'assets/setting.svg',
        title: "Edit Profile",
        ontap: () {
          Get.to(const EditProfilePage());
        }),
    ProfileButton(
        icon: 'assets/history.svg',
        title: "Logout",
        ontap: () async {
          await AuthenticationRepository().logout();
        }),
  ];

  getUserData() {
    final email = _authRepo.firebaseUser.value?.email;
    if (email != null) {
      return _userRepo.getUserDetails(email);
    } else {
      Get.snackbar("Error", "Login to get email");
    }
  }

  pickImage(userId) async {
    XFile? file = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (file == null) {
      return;
    }

    Reference storageReference =
        FirebaseStorage.instance.ref().child('images').child('filename.jpg');
    await storageReference.putFile(File(file.path));

    String imageUrl = await storageReference.getDownloadURL();
    setImage(File(file.path));
    update();

    try {
      final FirebaseFirestore firestore = FirebaseFirestore.instance;

      await firestore.collection('User').doc(userId).update({
        'imageUrl': imageUrl,
      });
      update();

      // ignore: empty_catches
    } catch (e) {}
  }

  updateRecord(UserModel user) async {
    try {
      await _userRepo.updateUserRecord(user);
      Get.snackbar("Success", " Account  Created Successfullly",
          snackPosition: SnackPosition.BOTTOM,
          colorText: ColorConstant.mainScaffoldBackgroundColor,
          backgroundColor: Colors.green);
    } catch (e) {
      Get.snackbar("Error", " Something Went Wrong",
          snackPosition: SnackPosition.BOTTOM,
          colorText: ColorConstant.mainScaffoldBackgroundColor,
          backgroundColor: Colors.red);
    }
  }
}
