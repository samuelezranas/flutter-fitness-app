import 'package:fitness_meal_helper/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      backgroundColor: kBackgroundColor,
    );
  }

  AppBar appBar() {
    return AppBar(
      title: const Text(
        'FitMe',
        style: TextStyle(
          color: kPrimaryColor,
          fontSize: 24,
          fontWeight: FontWeight.bold
        ),
      ),
      backgroundColor: Colors.white,
      elevation: 0.0,
      centerTitle: true,
      actions: [
        GestureDetector(
          onTap: () {},
          child: Container(
            margin: const EdgeInsets.all(10),
            alignment: Alignment.center,
            width: 35,
            child: SvgPicture.asset(
              'assets/icons/favorite.svg',
              height: 25,
              width: 25,
            ),
          ),
        ),
      ],
    );
  }  
}