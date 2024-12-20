import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  final int selectedIndex;
  final Function(int) onTap;

  const BottomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onTap,
  });

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: widget.selectedIndex,
      onTap: widget.onTap,
      selectedItemColor: Colors.orange,
      unselectedItemColor: Colors.grey,
      iconSize: 30,
      selectedLabelStyle: const TextStyle(
        fontSize: 14, // Ukuran teks yang dipilih
        height: 1.5,  // Menambah jarak antara icon dan teks
      ),
      unselectedLabelStyle: const TextStyle(
        fontSize: 12, // Ukuran teks yang tidak dipilih
        height: 1.5,  // Menambah jarak antara icon dan teks
      ),
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined),
          label: 'Home',
          activeIcon: Icon(Icons.home),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.fitness_center_rounded),
          label: 'Training',
          activeIcon: Icon(Icons.fitness_center),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.newspaper_outlined),
          label: 'News',
          activeIcon: Icon(Icons.newspaper),
        ),
      ],
    );
  }
}
