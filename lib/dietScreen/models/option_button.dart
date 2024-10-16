import 'package:flutter/material.dart';
import 'package:fitness_meal_helper/dietScreen/pages/breakfast.dart';
import 'package:fitness_meal_helper/dietScreen/pages/lunch.dart';
import 'package:fitness_meal_helper/dietScreen/pages/dinner.dart';

class OptionButton extends StatefulWidget {
  const OptionButton({super.key});

  @override
  State<OptionButton> createState() => _OptionButtonState();
}

class _OptionButtonState extends State<OptionButton> {
  final List<Button> categories = [
    Button(name: 'Breakfast', color: const Color(0xff9DCEFF), page: BreakfastPage()),
    Button(name: 'Lunch', color: const Color(0xFFFFF89D), page: LunchPage()),
    Button(name: 'Dinner', color: const Color(0xffEEA4CE), page: DinnerPage()),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: ListView.separated(
        itemCount: categories.length,
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.only(left: 40, right: 40),
        separatorBuilder: (context, index) => const SizedBox(width: 25),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => categories[index].page,
                ),
              );
            },
            child: Container(
              width: 100,
              decoration: BoxDecoration(
                color: categories[index].color.withOpacity(0.3),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      // You can add an image or icon here if needed
                      child: Icon(
                        Icons.fastfood,
                        color: categories[index].color,
                      ),
                    ),
                  ),
                  Text(
                    categories[index].name,
                    style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class Button {
  final String name;
  final Color color;
  final Widget page;

  Button({required this.name, required this.color, required this.page});
}
