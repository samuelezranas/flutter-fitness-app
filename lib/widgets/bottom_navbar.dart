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
      selectedItemColor: Colors.amber,
      unselectedItemColor: Colors.grey,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined),
          label: 'Home',
          activeIcon: Icon(Icons.home),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.fitness_center_outlined),
          label: 'Training',
          activeIcon: Icon(Icons.fitness_center),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.local_dining_outlined),
          label: 'Diet',
          activeIcon: Icon(Icons.local_dining),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite_border),
          label: 'Favorite',
          activeIcon: Icon(Icons.favorite),
        ),
      ],
    );
  }
}
