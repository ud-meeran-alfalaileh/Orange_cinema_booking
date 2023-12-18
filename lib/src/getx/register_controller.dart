import 'package:cinema_booking_app/src/constant/color.dart';
import 'package:cinema_booking_app/src/model/user_model.dart';
import 'package:cinema_booking_app/src/repository/auth/auth_repo.dart';
import 'package:cinema_booking_app/src/repository/user_repo/user_repo.dart';
import 'package:cinema_booking_app/src/widget/pages_widget.dart/navbar_widget.dart/navbar_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class RegisterController extends GetxController {
  static RegisterController get instance => Get.find();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();
  final TextEditingController phoneNumber = TextEditingController();
  final TextEditingController userName = TextEditingController();
  final fromKey = GlobalKey<FormState>();
  late UserModel user;
  RxString selectedItem = "".obs;

  var maskFormatterPhone = MaskTextInputFormatter(
      mask: '### ### ####',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);

  void registerUser(String email, String password) {
    AuthenticationRepository().createUserWithEmailAndPassword(email, password);
  }

  Future<void> createUser(UserModel user) async {
    await UserRepo().createUser(user);
    Get.to(const NavBarWidget());
  }

  validateEmail(String? email) {
    if (GetUtils.isEmail(email!)) {
      return null;
    }
    return 'Email is not vaild';
  }

  validateAge(String? age) {
    if (age!.isNotEmpty) {
      return null;
    }
    return 'Date of Birth is not vaild';
  }

  vaildatePassword(String? password) {
    if (!GetUtils.isLengthGreaterOrEqual(password, 6)) {
      return 'Password is not vaild';
    }
    return null;
  }

  validConfirmPassword(String? value) {
    if (value!.isEmpty) {
      return "Please Re-Enter New Password";
    } else if (value != password.text) {
      return "Password must be same as above";
    } else {
      return null;
    }
  }

  vaildateUserName(String? userName) {
    if (GetUtils.isUsername(userName!)) {
      return null;
    }
    return 'UserName is not vaild';
  }

  vaildPhoneNumber(String? phoneNumber) {
    if (GetUtils.isPhoneNumber(phoneNumber!)) {
      return null;
    }
    return 'Phone Number is not vaild';
  }

  Future<bool> isUsernameTaken(String username) async {
    try {
      FirebaseFirestore firestore = FirebaseFirestore.instance;
      QuerySnapshot querySnapshot = await firestore
          .collection('User')
          .where('UserName', isEqualTo: username)
          .get();
      return querySnapshot.docs.isNotEmpty;
    } catch (error) {
      Get.snackbar("Error", "Error checking username: $error",
          snackPosition: SnackPosition.BOTTOM,
          colorText: ColorConstant.mainScaffoldBackgroundColor,
          backgroundColor: Colors.red);
      return false;
    }
  }

  Future<void> onSignup(UserModel user) async {
    if (fromKey.currentState!.validate()) {
      bool usernameCheck = await isUsernameTaken(user.name);
      if (!usernameCheck) {
        Future<bool> code = AuthenticationRepository()
            .createUserWithEmailAndPassword(user.email, user.password);
        if (await code) {
          createUser(user);
          Get.snackbar("Success", " Account  Created Successfullly",
              snackPosition: SnackPosition.BOTTOM,
              colorText: ColorConstant.mainScaffoldBackgroundColor,
              backgroundColor: Colors.green);
        }
      } else {
        Get.snackbar("ERROR", "Username  is taken",
            snackPosition: SnackPosition.BOTTOM,
            colorText: ColorConstant.mainScaffoldBackgroundColor,
            backgroundColor: Colors.red);
      }
    }
  }
}
