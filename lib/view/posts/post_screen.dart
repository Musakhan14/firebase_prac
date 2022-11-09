import 'package:firebase/Utils/utils.dart';
import 'package:firebase/view/auth/login_screen.dart';
import 'package:firebase/view/posts/add_post.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                auth.signOut().then((value) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginScreen()));
                }).onError((error, stackTrace) {
                  Utils().toastMessege(error.toString());
                });
              },
              icon: const Icon(Icons.logout)),
          const SizedBox(width: 10),
        ],
        centerTitle: true,
        title: const Text('Post'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddPostScreen(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
