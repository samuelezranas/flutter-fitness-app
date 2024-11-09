import 'package:fitness_meal_helper/widgets/fetch_news.dart';
import 'package:fitness_meal_helper/widgets/news_model.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({super.key});

  // Function to launch the article URL with encoding
  void _launchURL(String url) async {
    final Uri uri = Uri.parse(Uri.encodeFull(url)); // Ensure URL encoding
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      // Error message in debug console or UI
      debugPrint('Could not launch $url');
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'News',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.orange,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: FutureBuilder<List<NewsArticle>>(
        future: fetchNews(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            final articles = snapshot.data!
                .where((article) => article.title.isNotEmpty && article.url.isNotEmpty)
                .toList();

            if (articles.isEmpty) {
              return const Center(child: Text('No news available.'));
            }

            return ListView.builder(
              itemCount: articles.length,
              itemBuilder: (context, index) {
                final article = articles[index];
                return Card(
                  margin: const EdgeInsets.all(8.0),
                  elevation: 4.0,
                  child: InkWell(
                    onTap: () => _launchURL(article.url),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        children: [
                          article.urlToImage.isNotEmpty
                              ? Image.network(
                                  article.urlToImage,
                                  width: 150,
                                  height: 150,
                                  fit: BoxFit.cover,
                                )
                              : const SizedBox(width: 150, height: 150),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  article.title,
                                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(height: 10.0),
                                Text(
                                  article.source,
                                  style: const TextStyle(color: Colors.orange, fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  article.author,
                                  style: const TextStyle(color: Colors.grey),
                                ),
                                Text(
                                  article.publishedAt,
                                  style: const TextStyle(color: Colors.black),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          } else {
            return const Center(child: Text('No news available.'));
          }
        },
      ),
    );
  }
}
