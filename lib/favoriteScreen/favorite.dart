import 'package:fitness_meal_helper/favoriteScreen/favorites_db_helper.dart';
import 'package:fitness_meal_helper/themes.dart';
import 'package:flutter/material.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  _FavoritesPageState createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  late Future<List<Map<String, dynamic>>> _favoritesFuture;

  @override
  void initState() {
    super.initState();
    _favoritesFuture = FavoritesDbHelper().getFavorites();
  }

  Future<void> _refreshFavorites() async {
    setState(() {
      _favoritesFuture = FavoritesDbHelper().getFavorites(); // Refresh the data
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Favorite Training',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.orange,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: RefreshIndicator(
        onRefresh: _refreshFavorites,
        child: FutureBuilder<List<Map<String, dynamic>>>(
          future: _favoritesFuture,
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(child: CircularProgressIndicator());
            }
            final favorites = snapshot.data!;
            return ListView.builder(
              itemCount: favorites.length,
              itemBuilder: (context, index) {
                final favorite = favorites[index];
                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(16),
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(10), 
                      child: Image.asset(
                        favorite['trainingImage'],
                        width: 100,
                        height: 75,
                        fit: BoxFit.cover,
                      ),
                    ),
                    title: Text(
                      favorite['trainingName'],
                      style: const TextStyle(fontSize: 16),
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete, color: Colors.orange),
                      onPressed: () async {
                        // Konfirmasi sebelum menghapus
                        final confirmDelete = await showDialog<bool>(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text('Konfirmasi'),
                              content: const Text('Apakah Anda yakin ingin menghapus dari favorit?'),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () => Navigator.of(context).pop(false),
                                  child: const Text(
                                    'Batal',
                                    style: TextStyle(color: Colors.orange), // Set color to orange
                                  ),
                                ),
                                TextButton(
                                  onPressed: () => Navigator.of(context).pop(true),
                                  child: const Text(
                                    'Hapus',
                                    style: TextStyle(color: Colors.orange), // Set color to orange
                                  ),
                                ),
                              ],
                            );
                          },
                        );

                        if (confirmDelete == true) {
                          await FavoritesDbHelper().removeFavorite(favorite['trainingId']);
                          
                          // Show Snackbar after successful deletion
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                '${favorite['trainingName']} telah berhasil dihilangkan dari data favorite. \n Silahkan lakukan refresh!',
                              ),
                              duration: const Duration(seconds: 5),
                              backgroundColor: kPrimaryColor,
                            ),
                          );

                          // Refresh the list after deletion
                          _refreshFavorites();
                        }
                      },
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}