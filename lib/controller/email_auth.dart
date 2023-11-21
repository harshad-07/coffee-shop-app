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
