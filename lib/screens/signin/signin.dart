import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coffee_shop_app_firebase/model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:fl_country_code_picker/fl_country_code_picker.dart';

import '../../widgets/form_text_field.dart';
// import '../diseaseDetection/disease_detection.dart';
import '../home/home.dart';
import 'login.dart';
// import 'otp.dart';
// import 'signin.dart';
// import 'reg_page.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final number = TextEditingController();
  final countryPicker = const FlCountryCodePicker();
  CountryCode? countryCode;
  String name = "";
  bool isLoading = false;
  final _formKey = GlobalKey<FormState>();

  final FirebaseAuth _auth = FirebaseAuth.instance;

  void signUp(String email, String password) async {
    setState(() {
      isLoading = true;
    });
    try {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) => sendDetailsToFirestore());
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
        // backgroundColor: Colors.white,
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
              // SvgPicture.asset(
              //   "assets/signin.svg",
              //   height: 250,
              // ),
              const SizedBox(
                height: 33,
              ),
              Text(
                "Welcome $name !",
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
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
                        onChanged: (value) {
                          name = value;
                          setState(() {});
                        },
                        hintText: 'Enter Your Name',
                        labelText: 'Name',
                        obsecureText: false,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Name cannot be empty";
                          }
                          return null;
                        },
                        controller: nameController),
                    const SizedBox(height: 22),
                    TextFormField(
                      onTapOutside: (event) =>
                          FocusManager.instance.primaryFocus?.unfocus(),
                      controller: number,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please Enter The Phone Number";
                        } else if (value.length < 7) {
                          return "Please Enter The Valid Number";
                        }
                        return null;
                      },
                      keyboardType: TextInputType.phone,
                      textInputAction: TextInputAction.done,
                      maxLines: 1,
                      decoration: InputDecoration(
                        errorBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(width: 2, color: Colors.red),
                            borderRadius: BorderRadius.circular(10)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: Colors.black)),
                        filled: true,
                        fillColor: const Color(0xFF602400).withOpacity(0.2),
                        focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Color(0xFF602400), width: 2),
                            borderRadius: BorderRadius.circular(10)),
                        hintText: "Enter your phone number",
                        hintStyle: const TextStyle(color: Color(0xFFD17842)),
                        // labelText: "Phone Number",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        prefixIcon: GestureDetector(
                          onTap: () async {
                            final code = await countryPicker.showPicker(
                                context: context);
                            setState(() {
                              countryCode = code;
                              debugPrint(countryCode!.dialCode);
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.all(0),
                            margin: const EdgeInsets.only(right: 15),
                            height: 60,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color:
                                    const Color(0xFF602400).withOpacity(0.5)),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                    padding: const EdgeInsets.only(left: 2),
                                    width: 55,
                                    child: Center(
                                        child: countryCode != null
                                            ? countryCode!.flagImage()
                                            : const Text(
                                                "🇮🇳",
                                                style: TextStyle(fontSize: 22),
                                              ))),
                                Padding(
                                  padding: const EdgeInsets.only(left: 5),
                                  child: Text(
                                    countryCode?.dialCode ?? "+91",
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 12),
                                  ),
                                ),
                                const Icon(
                                  Icons.arrow_drop_down_outlined,
                                  color: Colors.black,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 22,
                    ),
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
                // width: MediaQuery.of(context).size.width * 0.75,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 55),
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        signUp(emailController.text.trim(),
                            passwordController.text);
                        // Navigator.pushReplacement(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => HomePage()));
                        // SignUpController.instance.registerUser(controller.email.trim(), controller.password.trim());
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
                        : const Text("SignIn", style: TextStyle(fontSize: 18)),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginPage()));
                  // logIn();
                },
                child: const Text("Already had an Account? Click here",
                    style: TextStyle(color: Color(0xFFD17842))),
              )
            ],
          ),
        ),
      ),
    ));
  }

  void sendDetailsToFirestore() async {
    final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;
    UserModel model = UserModel();

    model.email = user!.email;
    model.uid = user.uid;
    model.name = nameController.text;
    model.phoneNo = number.text;
    model.createdAt = DateTime.now().millisecondsSinceEpoch.toString();

    await firebaseFirestore
        .collection("users")
        .doc(user.uid)
        .set(model.toMap());
    Fluttertoast.showToast(msg: "Account Created Successfully");
    // ignore: use_build_context_synchronously
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const HomePage()));
    setState(() {
      isLoading = false;
    });
  }
}
