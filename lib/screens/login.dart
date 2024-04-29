import 'package:flutter/material.dart';
import 'package:google_docs_clone_flutter/colors.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: ElevatedButton.icon(
        onPressed: () {},
        icon: Image.asset(
          'assets/images/g-logo.png',
          height: 20,
        ),
        label: const Text(
          'Sign In with Google',
          style: TextStyle(color: kBlackColor),
        ),
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(150, 50),
          backgroundColor: kWhiteColor,
        ),
      ),
    ));
  }
}
