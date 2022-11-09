import 'package:firebase/Utils/utils.dart';
import 'package:firebase/view/auth/loginwith_phonenmuber.dart';
import 'package:firebase/view/auth/signup_screen.dart';
import 'package:firebase/view/posts/post_screen.dart';
import 'package:firebase/widgets/round_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/src/widgets/framework.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  final emailcontroller = TextEditingController();
  final paswordcontroller = TextEditingController();
  FirebaseAuth _auth = FirebaseAuth.instance;
  bool loading = false;

  @override
  void dispose() {
    emailcontroller.dispose();
    paswordcontroller.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  void login() {
    setState(() {
      loading = true;
    });
    _auth
        .signInWithEmailAndPassword(
            email: emailcontroller.text.toString(),
            password: paswordcontroller.text.toString())
        .then((value) {
      Utils().toastMessege(value.user!.email.toString());
      setState(() {
        loading = false;
      });
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const PostScreen()));
    }).onError((error, stackTrace) {
      setState(() {
        loading = false;
      });
      debugPrint(error.toString());
      Utils().toastMessege(error.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        SystemNavigator.pop();
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: const Text('Login'),
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
                title: 'Login',
                loading: loading,
                onTap: () {
                  if (formKey.currentState!.validate()) {}
                  login();
                },
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have an account?"),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignUpScreen()));
                      },
                      child: const Text('Sign Up')),
                ],
              ),
              const SizedBox(height: 30),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginWithPhone()));
                },
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(color: Colors.black),
                  ),
                  child: const Center(
                    child: Text('Login with Phone'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
