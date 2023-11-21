// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

import '../../controller/email_auth.dart';
import '../home/home.dart';

class Otp extends StatefulWidget {
  final String? emailId;

  const Otp({super.key, this.emailId});

  @override
  State<Otp> createState() => _OtpState();
}

class _OtpState extends State<Otp> {
  String? otpCode;
  late bool isLoading;

  final _formKey = GlobalKey<FormState>();
  TextEditingController number = TextEditingController();
  EmailAuthController emailAuthController = Get.put(EmailAuthController());
  // final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: const IconThemeData(color: Colors.white)),
      body:
          // isLoading == true
          //     ? const Center(
          //         child: CircularProgressIndicator(
          //           color: Colors.green,
          //         ),
          //       )
          //     :
          Form(
        key: _formKey,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: ListView(
              shrinkWrap: true,
              children: [
                SvgPicture.asset(
                  'assets/otp.svg',
                  width: MediaQuery.sizeOf(context).width * 0.44,
                ),
                const SizedBox(
                  height: 16,
                ),
                const Text(
                  "We gotch you!",
                  style: TextStyle(fontSize: 22),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                    "Please enter the verification code sent to your Email address : ${widget.emailId}",
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.center),
                const SizedBox(
                  height: 30,
                ),
                Pinput(
                  onTapOutside: (event) =>
                      FocusManager.instance.primaryFocus?.unfocus(),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Enter the verification code";
                    } else if (value.length < 6) {
                      return "Enter the 6-Digit verification code";
                    }
                    return null;
                  },
                  length: 6,
                  errorPinTheme: PinTheme(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.red.shade700),
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.red.shade50)),
                  defaultPinTheme: PinTheme(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                          border: Border.all(color: const Color(0xFFD17842)),
                          borderRadius: BorderRadius.circular(10),
                          color: const Color(0xFFD17842).withOpacity(0.5))),
                  onCompleted: (value) {
                    setState(() {
                      otpCode = value;
                    });
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 30,
                  child: TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text("Re-send code in ",
                          style: TextStyle(
                              fontSize: 12,
                              color: Color(0xFFD17842),
                              fontWeight: FontWeight.bold))),
                ),
                const SizedBox(
                  height: 30,
                ),
                SizedBox(
                  height: 45,
                  width: MediaQuery.sizeOf(context).width * 0.7,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        if (otpCode != null) {
                          // verifyOtp(context, otpCode!);
                          // emailAuthController.verifyOtp(
                          //     widget.emailId.toString(), otpCode.toString());
                          emailAuthController.verifyOtp(otpCode.toString());
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const HomePage(),
                            ),
                            // (route) => false
                          );
                        }
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        backgroundColor: const Color(0xFF602400)),
                    child: const Text("Verify Code",
                        style: TextStyle(fontSize: 18)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
