import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'), // Judul pada AppBar
        backgroundColor: Colors.blue,    // Warna latar belakang AppBar
      ),
      body: const Center(
        child: Text(''),  // Body kosong, tidak ada elemen tambahan
      ),
    );
  }
}
