import 'package:firebase/Utils/utils.dart';
import 'package:firebase/view/auth/verify_code.dart';
import 'package:firebase/widgets/round_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class LoginWithPhone extends StatefulWidget {
  const LoginWithPhone({super.key});

  @override
  State<LoginWithPhone> createState() => _LoginWithPhoneState();
}

class _LoginWithPhoneState extends State<LoginWithPhone> {
  FirebaseAuth auth = FirebaseAuth.instance;
  bool loading = false;

  final phoneNumberController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(height: 80),
            TextFormField(
              controller: phoneNumberController,
              decoration: const InputDecoration(
                hintText: '+2 3775 979 799',
              ),
            ),
            const SizedBox(height: 50),
            RoundButton(
                onTap: () {
                  auth.verifyPhoneNumber(
                      phoneNumber: phoneNumberController.text,
                      verificationCompleted: (_) {},
                      verificationFailed: ((error) {
                        Utils().toastMessege(error.toString());
                      }),
                      codeSent: (String verificatoinId, int? token) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => VerifyCodeScreen(
                                      verificationId: verificatoinId,
                                    )));
                      },
                      codeAutoRetrievalTimeout: (error) {
                        Utils().toastMessege(error);
                      });
                },
                title: 'Login')
          ],
        ),
      ),
    );
  }
}
