import 'package:flutter/material.dart';
import 'package:fitness_meal_helper/models/option_button.dart'; // Pastikan path import sesuai

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Elemen di tengah secara vertikal
          crossAxisAlignment: CrossAxisAlignment.center, // Elemen di tengah secara horizontal
          children: [
            const Text(
              'Fitness Diet App',
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40), // Jarak antara teks dan tombol
            Container(
              alignment: Alignment.center, // Memastikan tombol berada di tengah
              child: OptionButton(), // Memanggil widget OptionButton
            ),
          ],
        ),
      ),
    );
  }
}
