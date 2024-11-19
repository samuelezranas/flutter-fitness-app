import 'package:fitness_meal_helper/favoriteScreen/favorites_db_helper.dart';
import 'package:flutter/material.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites'),
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: FavoritesDbHelper().getFavorites(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }
          final favorites = snapshot.data!;
          return ListView.builder(
            itemCount: favorites.length,
            itemBuilder: (context, index) {
              final favorite = favorites[index];
              return ListTile(
                leading: Image.asset(favorite['trainingImage']),
                title: Text(favorite['trainingName']),
                trailing: IconButton(
                  icon: const Icon(Icons.delete, color: Colors.orange),
                  onPressed: () async {
                    await FavoritesDbHelper().removeFavorite(favorite['trainingId']);
                    (context as Element).markNeedsBuild();
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
