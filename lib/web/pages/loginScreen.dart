import 'package:flutter/material.dart';

class Loginscreen extends StatefulWidget {
  const Loginscreen({super.key});

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Inicia sesion')),
      body: const Center(
        child: Text('Aquí va el inicio de sesion', style: TextStyle(fontSize: 24)),
      ),
    );
  }
}