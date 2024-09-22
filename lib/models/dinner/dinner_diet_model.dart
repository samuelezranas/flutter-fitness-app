import 'package:flutter/material.dart';

class DietModel {
  String name;
  String iconPath;
  String level;
  String duration;
  String calorie;
  Color boxColor;
  bool viewIsSelected;

  DietModel({
    required this.name,
    required this.iconPath,
    required this.level,
    required this.duration,
    required this.calorie,
    required this.boxColor,
    required this.viewIsSelected
  });

  static List < DietModel > getDiets() {
    List < DietModel > diets = [];

    diets.add(
      DietModel(
       name: 'Salmon Nigiri',
       iconPath: 'assets/icons/salmon-nigiri.svg',
       level: 'Easy',
       duration: '20mins',
       calorie: '120kCal',
       viewIsSelected: true,
       boxColor: Color(0xffEEA4CE)
      )
    );

    return diets;
  }
}