import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class VerifyCodeScreen extends StatefulWidget {
  String verificationId;
  VerifyCodeScreen({required this.verificationId, super.key});

  @override
  State<VerifyCodeScreen> createState() => _VerifyCodeScreenState();
}

class _VerifyCodeScreenState extends State<VerifyCodeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Verify'),
      ),
      body: Column(
        children: [],
      ),
    );
  }
}
