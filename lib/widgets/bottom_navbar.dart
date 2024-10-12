import 'package:flutter/material.dart';

class CustomBottomNavBar extends StatefulWidget {
  final int currentIndex;  // Mengatur index halaman yang sedang dibuka

  const CustomBottomNavBar({
    required this.currentIndex,
    super.key,
  });

  @override
  _CustomBottomNavBarState createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  // Fungsi untuk pindah halaman ketika item navbar di-tap
  void _onItemTapped(int index) {
    if (index == widget.currentIndex) return; // Cegah reload layar yang sama

    // Ganti halaman berdasarkan index navbar
    switch (index) {
      case 0:
        Navigator.pushReplacementNamed(context, '/home');
        break;
      case 1:
        Navigator.pushReplacementNamed(context, '/workout');
        break;
      case 2:
        Navigator.pushReplacementNamed(context, '/diet');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.fitness_center),
          label: 'Workout',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.fastfood),
          label: 'Diet',
        ),
      ],
      currentIndex: widget.currentIndex,
      selectedItemColor: Colors.blue,
      onTap: _onItemTapped,
    );
  }
}
