import 'package:fitness_meal_helper/themes.dart';
import 'package:fitness_meal_helper/trainingScreen/detail_training.dart';
import 'package:fitness_meal_helper/trainingScreen/model/training_model.dart';
import 'package:flutter/material.dart';

class TrainingPage extends StatefulWidget {
  const TrainingPage({super.key});

  @override
  _TrainingPageState createState() => _TrainingPageState();
}

class _TrainingPageState extends State<TrainingPage> {
  final ScrollController _scrollController = ScrollController();
  Color _appBarTextColor = kPrimaryColor; // Warna teks default di AppBar
  Color _appBarBackgroundColor = Colors.transparent; // Warna latar belakang default

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      setState(() {
        // Ubah warna latar belakang dan warna teks berdasarkan posisi scroll
        if (_scrollController.offset > 100) {
          _appBarTextColor = Colors.white; // Ubah menjadi putih ketika scroll
          _appBarBackgroundColor = kPrimaryColor; // Ubah latar belakang menjadi oranye
        } else {
          _appBarTextColor = kPrimaryColor; // Kembali ke oranye
          _appBarBackgroundColor = Colors.transparent; // Kembali ke transparan
        }
      });
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'Training',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: _appBarTextColor), // Menggunakan warna teks dari variabel
            ),
            backgroundColor: _appBarBackgroundColor, // Warna latar belakang
            elevation: 0, // Menghilangkan bayangan
          ),
          body: SingleChildScrollView(
            controller: _scrollController, // Mengatur controller untuk scroll
            child: Padding(
              padding: const EdgeInsets.all(16.0), // Padding di luar grid
              child: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  if (constraints.maxWidth <= 600) {
                    return const TrainingModelList();
                  } else if (constraints.maxWidth <= 1200) {
                    return const TrainingModelGrid(gridCount: 4);
                  } else {
                    return const TrainingModelGrid(gridCount: 6);
                  }
                },
              ),
            ),
          ),
        );
      },
    );
  }
}

class TrainingModelGrid extends StatelessWidget {
  final int gridCount;

  const TrainingModelGrid({super.key, required this.gridCount});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: gridCount,
      crossAxisSpacing: 16,
      mainAxisSpacing: 16,
      childAspectRatio: 1, // Ubah sesuai kebutuhan
      shrinkWrap: true, // Menghindari overflow di dalam GridView
      physics: const NeverScrollableScrollPhysics(), // Menonaktifkan scroll di GridView
      children: trainingModelList.map((training) {
        return InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return DetailScreen(training: training);
            }));
          },
          child: Container(
            padding: const EdgeInsets.only(
                  left: 20,
                  right: 20
                ),
            decoration: BoxDecoration(
              color: Colors.white, // Warna latar belakang Card
              borderRadius: BorderRadius.circular(15.0), // Membuat sudut rounded
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2), // Warna shadow
                  spreadRadius: 2, // Seberapa jauh shadow menyebar
                  blurRadius: 5, // Seberapa kabur shadow
                  offset: const Offset(0, 3), // Posisi shadow
                ),
              ],
            ),
            child: Card(
              elevation: 25, // Nonaktifkan shadow bawaan Card
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0), // Sesuaikan border radius
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min, // Ambil hanya ruang yang diperlukan
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(15.0),
                        topRight: Radius.circular(15.0),
                      ), // Membuat sudut rounded pada gambar bagian atas
                      child: Image.asset(
                        training.imageAsset,
                        fit: BoxFit.cover, // Menggunakan BoxFit.cover untuk memperbesar gambar
                      ),
                    ),
                  ),
                  const SizedBox(height: 2),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0), // Padding horizontal
                    child: Text(
                      training.name,
                      style: const TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0), // Padding lebih besar untuk teks bawah
                    child: Text(
                      training.category,
                      style: const TextStyle(
                        fontSize: 10.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        );
      }).toList(),
    );
  }
}

class TrainingModelList extends StatelessWidget {
  const TrainingModelList({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16.0,
        mainAxisSpacing: 16.0,
        childAspectRatio: 1, // Ubah sesuai kebutuhan
      ),
      itemBuilder: (context, index) {
        final TrainingModel training = trainingModelList[index];
        return InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return DetailScreen(training: training);
            }));
          },
          child: Card(
            child: Column(
              mainAxisSize: MainAxisSize.min, // Ambil hanya ruang yang diperlukan
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: Image.asset(
                    training.imageAsset,
                    fit: BoxFit.cover, // Menggunakan BoxFit.cover untuk memperbesar gambar
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(2.0), // Padding di sekitar konten
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        training.name,
                        style: const TextStyle(fontSize: 16.0),
                      ),
                      const SizedBox(height: 2),
                      Text(training.category),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
      itemCount: trainingModelList.length,
      shrinkWrap: true, // Menghindari overflow di dalam GridView
      physics: const NeverScrollableScrollPhysics(), // Menonaktifkan scroll di GridView
    );
  }
}
