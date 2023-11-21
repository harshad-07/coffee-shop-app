import 'package:flutter/material.dart';

import '../signin/auth_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(128.0),
              child: FadeInImage(
                image: AssetImage('assets/appLogo.png'),
                placeholder: AssetImage('assets/appLogo.png'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _navigateToHome() async {
    await Future.delayed(const Duration(seconds: 3), () {});
    // ignore: use_build_context_synchronously
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: ((context) => const AuthPage())));
  }
}
