import 'package:firebase/Utils/utils.dart';
import 'package:firebase/view/auth/login_screen.dart';
import 'package:firebase/widgets/round_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<SignUpScreen> {
  bool loading = false;
  final formKey = GlobalKey<FormState>();
  final emailcontroller = TextEditingController();
  final paswordcontroller = TextEditingController();
  FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void dispose() {
    emailcontroller.dispose();
    paswordcontroller.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  void signUp() {
    setState(() {
      loading = true;
    });
    _auth
        .createUserWithEmailAndPassword(
            email: emailcontroller.text.toString(),
            password: paswordcontroller.text.toString())
        .then((value) {
      setState(() {
        loading = false;
      });
    }).onError((error, stackTrace) {
      setState(() {
        loading = false;
      });

      Utils().toastMessege(error.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Sign Up'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Form(
                key: formKey,
                child: Column(
                  children: [
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      controller: emailcontroller,
                      decoration: const InputDecoration(
                        hintText: 'Email',
                        prefixIcon: Icon(Icons.email),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Enter Email';
                        } else {
                          return null;
                        }
                      },
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                        keyboardType: TextInputType.text,
                        controller: paswordcontroller,
                        obscureText: true,
                        decoration: const InputDecoration(
                          hintText: 'Password',
                          prefixIcon: Icon(Icons.lock),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Enter Email';
                          } else {
                            return null;
                          }
                        }),
                  ],
                )),
            const SizedBox(height: 50),
            RoundButton(
              loading: loading,
              title: 'Sign Up',
              onTap: () {
                if (formKey.currentState!.validate()) {
                  signUp();
                }
              },
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Already have an account?"),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginScreen()));
                    },
                    child: const Text('Login'))
              ],
            )
          ],
        ),
      ),
    );
  }
}
