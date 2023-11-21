// import 'package:email_auth/email_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:get/get.dart';

// class EmailAuthController extends GetxController {
//   EmailAuth emailAuth = EmailAuth(sessionName: "coffee shop session");
//   var remoteServerConfiguration = {
//     "server": "https://carvaan.herokuapp.com",
//     "serverKey": "UDujOQ",
//   };
//   var status = "".obs;

//   void sendOtp(String email) async {
//     try {
//       var res = await emailAuth.sendOtp(recipientMail: email, otpLength: 6);
//       if (res) {
//         debugPrint("sendOtp");
//       } else {
//         debugPrint("error");
//       }
//     } on Exception catch (e) {
//       Fluttertoast.showToast(msg: e.toString());
//       debugPrint(e.toString());
//     }
//     // if (res) {
//     //   status.value = "Otp sent";
//     // }
//   }

//   void verifyOtp(String email, String otp) {
//     try {
//       emailAuth.validateOtp(recipientMail: email, userOtp: otp);
//     } on Exception catch (e) {
//       Fluttertoast.showToast(msg: "$e");
//     }
//     // if (res) {
//     //   status.value = "Email Verified";
//     // }
//   }
// }

import 'package:email_otp/email_otp.dart';
import 'package:get/get.dart';

class EmailAuthController extends GetxController {
  EmailOTP otp = EmailOTP();
  void config(String email) async {
    otp.setConfig(
        appEmail: 'developer.harshadghadge@gmail.com',
        appName: 'Surf Tree',
        otpLength: 6,
        otpType: OTPType.digitsOnly,
        userEmail: email);
  }

  void verifyOtp(String code) {
    otp.verifyOTP(otp: code);
  }
}
