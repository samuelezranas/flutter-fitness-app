// ignore_for_file: library_private_types_in_public_api

import 'package:fitness_meal_helper/favoriteScreen/favorites_db_helper.dart';
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
  final TrainingModel training;

  const FavoriteButton({super.key, required this.training});

  @override
  _FavoriteButtonState createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  bool isFavorite = false;

  @override
  void initState() {
    super.initState();
    _checkFavoriteStatus();
  }

  void _checkFavoriteStatus() async {
    final dbHelper = FavoritesDbHelper();
    final favorite = await dbHelper.isFavorite(widget.training.id);
    setState(() {
      isFavorite = favorite;
    });
  }

  void _toggleFavorite() async {
    final dbHelper = FavoritesDbHelper();
    if (isFavorite) {
      await dbHelper.removeFavorite(widget.training.id);
    } else {
      await dbHelper.addFavorite({
        'trainingId': widget.training.id,
        'trainingName': widget.training.name,
        'trainingImage': widget.training.imageAsset,
      });
    }
    setState(() {
      isFavorite = !isFavorite;
    });
  }


  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: const Color(0xFFFFFFFF), // Warna latar belakang lingkaran
      child: IconButton(
        icon: Icon(
          isFavorite ? Icons.star : Icons.star_border_outlined,
          color: kPrimaryColor, // Warna ikon
        ),
        onPressed: _toggleFavorite,
      ),
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
        physics: const BouncingScrollPhysics(), 
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
                        FavoriteButton(training: training),
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
              padding: const EdgeInsets.symmetric(horizontal: 32.0).copyWith(bottom: 32.0),
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
              margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0).copyWith(bottom: 32.0),
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
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: const Text(
                'Variations',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Oxygen',
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0).copyWith(bottom: 32.0),
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: kBackgroundColor,
                  borderRadius: BorderRadius.circular(18.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 1),
                    ),
                  ],
                ),
              child: Column(
                children: List.generate(5, (index) {
                  final trainName = index == 0 ? training.train1name :
                                    index == 1 ? training.train2name :
                                    index == 2 ? training.train3name : '';
                  final trainImg = index == 0 ? training.train1img :
                                  index == 1 ? training.train2img :
                                  index == 2 ? training.train3img : '';
                  
                  if (trainName.isEmpty || trainImg.isEmpty) return const SizedBox.shrink();
                  
                  return Container(
                    margin: const EdgeInsets.only(bottom: 16.0),
                    child: Row(
                      children: [
                        Container(
                          width: 100.0,
                          height: 100.0,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(trainImg),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                spreadRadius: 1,
                                blurRadius: 3,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 16.0),
                        Expanded(
                          child: Text(
                            trainName,
                            style: const TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Oxygen',
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }),
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
                  'Training',
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
                                children: [
                                  Image.network(
                                    widget.training.train1img,
                                    width: 300,
                                    height: 300,
                                    fit: BoxFit.cover,
                                  ),
                                  Image.network(
                                    widget.training.train2img,
                                    width: 150,
                                    height: 150,
                                    fit: BoxFit.cover,
                                  ),
                                  Image.network(
                                    widget.training.train3img,
                                    width: 150,
                                    height: 150,
                                    fit: BoxFit.cover,
                                  ),
                                ],
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
}
