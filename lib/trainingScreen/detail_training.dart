// ignore_for_file: library_private_types_in_public_api

import 'package:fitness_meal_helper/themes.dart';
import 'package:fitness_meal_helper/trainingScreen/model/skill_level_box.dart';
import 'package:fitness_meal_helper/trainingScreen/model/training_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

var informationTextStyle = const TextStyle(fontFamily: 'Oxygen');

class DetailScreen extends StatelessWidget {
  final TrainingModel training;

  const DetailScreen({super.key, required this.training});

  @override
    Widget build(BuildContext context) {
      return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxWidth > 800) {
            return DetailWebPage(training: training);
          } else {
            return DetailMobilePage(training: training);
          }
        },
      );
    }
  }
  

class FavoriteButton extends StatefulWidget {
  const FavoriteButton({super.key});

  @override
  _FavoriteButtonState createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        isFavorite ? Icons.star : Icons.star_border_outlined,
        color: Colors.orange,
      ),
      onPressed: () {
        setState(() {
          isFavorite = !isFavorite;
        });
      },
    );
  }
}

class DetailMobilePage extends StatelessWidget {
  final TrainingModel training;

  const DetailMobilePage({super.key, required this.training});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(), // Menambahkan physics agar scroll lebih halus
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Stack(
              children: <Widget>[
                Image.asset(training.imageAsset),
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CircleAvatar(
                          backgroundColor: kPrimaryColor,
                          child: IconButton(
                            icon: const Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                              
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ),
                        const FavoriteButton(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 16.0),
              child: Text(
                training.name,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 30.0,
                  fontFamily: 'Staatliches',
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 4.0), // Padding vertikal
              child: const Text(
                'Description',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20.0, // Ukuran font judul
                  fontWeight: FontWeight.bold, // Menebalkan font
                  fontFamily: 'Oxygen',
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 32.0).copyWith(bottom: 16.0),
              child: Text(
                training.description,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 16.0,
                  fontFamily: 'Oxygen',
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 4.0), // Padding vertikal
              child: const Text(
                'Recommendation',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20.0, // Ukuran font judul
                  fontWeight: FontWeight.bold, // Menebalkan font
                  fontFamily: 'Oxygen',
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0).copyWith(bottom: 16.0),
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: kBackgroundColor,
                borderRadius: BorderRadius.circular(18.0), // Border radius
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2), // Warna shadow
                    spreadRadius: 2, // Seberapa jauh shadow menyebar
                    blurRadius: 5, // Seberapa kabur shadow
                    offset: const Offset(0, 1), // Posisi shadow
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      const SkillLevelIcon(level: 1),
                      const SizedBox(height: 8.0),
                      const Text(
                        "Basic",
                        style: TextStyle(
                          fontSize: 16.0, // Ukuran font judul
                          fontWeight: FontWeight.bold, // Menebalkan font
                          fontFamily: 'Oxygen',
                        ),
                      ),
                      Text(
                        training.basicRep,
                        style: informationTextStyle,
                      ),
                      Text(
                        training.basicSet,
                        style: informationTextStyle,
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      const SkillLevelIcon(level: 2),
                      const SizedBox(height: 8.0),
                      const Text(
                        "Intermediate",
                        style: TextStyle(
                          fontSize: 16.0, // Ukuran font judul
                          fontWeight: FontWeight.bold, // Menebalkan font
                          fontFamily: 'Oxygen',
                        ),
                      ),
                      Text(
                        training.interRep,
                        style: informationTextStyle,
                      ),
                      Text(
                        training.interSet,
                        style: informationTextStyle,
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      const SkillLevelIcon(level: 3),
                      const SizedBox(height: 8.0),
                      const Text(
                        "Hard",
                        style: TextStyle(
                          fontSize: 16.0, // Ukuran font judul
                          fontWeight: FontWeight.bold, // Menebalkan font
                          fontFamily: 'Oxygen',
                        ),
                      ),
                      Text(
                        training.hardRep,
                        style: informationTextStyle,
                      ),
                      Text(
                        training.hardSet,
                        style: informationTextStyle,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 4.0), // Padding vertikal
              child: const Text(
                'Variations',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20.0, // Ukuran font judul
                  fontWeight: FontWeight.bold, // Menebalkan font
                  fontFamily: 'Oxygen',
                ),
              ),
            ),
            SizedBox(
              height: 150,
              child: ListView(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true, // Tambahkan shrinkWrap agar sesuai dengan konten
                children: training.imageUrls.map((url) {
                  return Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(url),
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

  

class DetailWebPage extends StatefulWidget {
  final TrainingModel training;

  const DetailWebPage({super.key, required this.training});

  @override
  _DetailWebPageState createState() => _DetailWebPageState();
}

class _DetailWebPageState extends State<DetailWebPage> {
  final _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: kIsWeb ? null : AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 16,
          horizontal: 64,
        ),
        child: Center(
          child: SizedBox(
            width: screenWidth <= 1200 ? 800 : 1200,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Text(
                  'FitMe',
                  style: TextStyle(
                    fontFamily: 'Staatliches',
                    fontSize: 32,
                    color: kPrimaryColor,
                  ),
                ),
                const SizedBox(height: 32),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(widget.training.imageAsset),
                          ),
                          const SizedBox(height: 16),
                          Scrollbar(
                            controller: _scrollController,
                            child: Container(
                              height: 150,
                              padding: const EdgeInsets.only(bottom: 16),
                              child: ListView(
                                controller: _scrollController,
                                scrollDirection: Axis.horizontal,
                                children: widget.training.imageUrls.map((url) {
                                  return Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.network(url),
                                    ),
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 32),
                    Expanded(
                      child: Card(
                        child: Container(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              Text(
                                widget.training.name,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontSize: 30.0,
                                  fontFamily: 'Staatliches',
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: <Widget>[
                                      const Icon(Icons.calendar_today),
                                      const SizedBox(width: 8.0),
                                      Text(
                                        widget.training.basicRep,
                                        style: informationTextStyle,
                                      ),
                                      Text(
                                        widget.training.basicSet,
                                        style: informationTextStyle,
                                      ),
                                    ],
                                  ),
                                  const FavoriteButton(),
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                  const Icon(Icons.access_time),
                                  const SizedBox(width: 8.0),
                                  Text(
                                    widget.training.interRep,
                                    style: informationTextStyle,
                                  ),
                                  Text(
                                    widget.training.interSet,
                                    style: informationTextStyle,
                                  ),
                                ],
                              ),
                              const SizedBox(height: 8.0),
                              Row(
                                children: <Widget>[
                                  const Icon(Icons.monetization_on),
                                  const SizedBox(width: 8.0),
                                  Text(
                                    widget.training.hardRep,
                                    style: informationTextStyle,
                                  ),
                                  Text(
                                    widget.training.hardSet,
                                    style: informationTextStyle,
                                  ),
                                ],
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(vertical: 16.0),
                                child: Text(
                                  widget.training.description,
                                  textAlign: TextAlign.justify,
                                  style: const TextStyle(
                                    fontSize: 16.0,
                                    fontFamily: 'Oxygen',
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}