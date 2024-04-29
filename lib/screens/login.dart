import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_docs_clone_flutter/colors.dart';
import 'package:google_docs_clone_flutter/repository/auth_repository.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({super.key});

  void signInWithGoogle(WidgetRef ref) {
    ref.read(authRepositryProvider).signInWithGoogle();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        body: Center(
      child: ElevatedButton.icon(
        onPressed: () => signInWithGoogle(ref),
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
