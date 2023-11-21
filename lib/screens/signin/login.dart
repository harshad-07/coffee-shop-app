import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../../controller/email_auth.dart';
import '../../widgets/form_text_field.dart';
import '../home/home.dart';
// import 'otp.dart';
import 'signin.dart';
// import 'reg_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  EmailAuthController emailAuthController = Get.put(EmailAuthController());
  // String name = "";
  bool isLoading = false;
  final _formKey = GlobalKey<FormState>();

  final FirebaseAuth _auth = FirebaseAuth.instance;

  void logIn(String email, String password) async {
    setState(() {
      isLoading = true;
    });
    try {
      await _auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((uid) {
        Fluttertoast.showToast(msg: 'Login Successful');
      });
      // ignore: use_build_context_synchronously
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const HomePage()
              // Otp(emailId: emailController.text.trim(),)
              ),
          (route) => false);
      setState(() {
        isLoading = false;
      });
    } on FirebaseAuthException catch (e) {
      Fluttertoast.showToast(msg: e.message.toString());
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Form(
        key: _formKey,
        child: Center(
          child: ListView(
            shrinkWrap: true,
            children: [
              Image.asset(
                "assets/appLogo.png",
                fit: BoxFit.contain,
                height: 130,
              ),
              const SizedBox(
                height: 70,
              ),
              const Text(
                "Nice to See You Again!",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 30),
                child: Column(
                  children: [
                    formTextField(
                        hintText: 'Enter Your Email',
                        labelText: 'Email',
                        obsecureText: false,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Email cannot be empty";
                          } else if (value.contains('@') == false) {
                            return "Enter valid email address";
                          }
                          return null;
                        },
                        controller: emailController),
                    const SizedBox(height: 22),
                    formTextField(
                        obsecureText: true,
                        hintText: 'Enter Password',
                        labelText: 'Password',
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Password cannot be empty";
                          } else if (value.length < 6) {
                            return "Password must be greater han 6 characters";
                          }
                          return null;
                        },
                        controller: passwordController),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                height: 45,
                // width: MediaQuery.sizeOf(context).width * 0.75,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 55),
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        logIn(emailController.text.trim(),
                            passwordController.text);
                        // emailAuthController.config(emailController.text.trim());
                        // emailAuthController.sendOtp(
                        //   emailController.text.trim(),
                        // );
                      }
                    },
                    // style: TextButton.styleFrom(minimumSize: Size(125, 40)),
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        backgroundColor: const Color(0xFF602400)),
                    child: isLoading
                        ? const CircularProgressIndicator(
                            color: Colors.white,
                          )
                        : const Text("Login", style: TextStyle(fontSize: 18)),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const SignIn()));
                },
                child: const Text("New here? Create an Account",
                    style: TextStyle(color: Color(0xFFD17842))),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
