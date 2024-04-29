import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_docs_clone_flutter/colors.dart';
import 'package:google_docs_clone_flutter/repository/auth_repository.dart';
import 'package:google_docs_clone_flutter/screens/home_screen.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({super.key});

  void signInWithGoogle(WidgetRef ref, BuildContext context) async {
    final sMessenger = ScaffoldMessenger.of(context);
    final navigator = Navigator.of(context);
    final errorModel = await ref.read(authRepositryProvider).signInWithGoogle();
    if (errorModel.error == null) {
      ref.read(userProvider.notifier).update((state) => errorModel.data);
      navigator
          .push(MaterialPageRoute(builder: (context) => const Homescreen()));
    } else {
      sMessenger.showSnackBar(
        SnackBar(
          content: Text(errorModel.error!),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        body: Center(
      child: ElevatedButton.icon(
        onPressed: () => signInWithGoogle(ref, context),
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
