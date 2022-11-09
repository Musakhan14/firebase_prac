import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase/Utils/utils.dart';
import 'package:firebase/view/auth/login_screen.dart';
import 'package:firebase/widgets/round_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class AddPostScreen extends StatefulWidget {
  const AddPostScreen({super.key});

  @override
  State<AddPostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<AddPostScreen> {
  FirebaseAuth auth = FirebaseAuth.instance;
  bool loading = false;
  final dataBaseRef = FirebaseDatabase.instance.ref('Post');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Add Post'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(height: 80),
            TextFormField(
              maxLines: 4,
              // controller: phoneNumberController,
              decoration: const InputDecoration(
                hintText: "What's in your mind",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 30),
            RoundButton(onTap: () {}, title: 'title')
          ],
        ),
      ),
    );
  }
}
