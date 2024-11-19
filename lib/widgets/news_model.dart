import 'package:flutter/material.dart';

class NewsArticle {
  final String title;
  final String author;
  final String source;
  final String publishedAt;
  final String urlToImage;
  final String url;

  NewsArticle({
    required this.title,
    required this.author,
    required this.source,
    required this.publishedAt,
    required this.urlToImage,
    required this.url,
  });

  factory NewsArticle.fromJson(Map<String, dynamic> json) {
    return NewsArticle(
      title: json['title'],
      author: json['author'] ?? 'Unknown',
      source: json['source']['name'],
      publishedAt: json['publishedAt'],
      urlToImage: json['urlToImage'] ?? '',
      url: json['url'],
    );
  }
}

class NewsPage extends StatelessWidget {
  final List<NewsArticle> articles;

  const NewsPage({super.key, required this.articles});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Workout News')),
      body: ListView.builder(
        itemCount: articles.length,
        itemBuilder: (context, index) {
          final article = articles[index];

          return Card(
            elevation: 5,
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            child: ListTile(
              contentPadding: const EdgeInsets.all(10),
              leading: article.urlToImage.isNotEmpty
                  ? Image.network(
                      article.urlToImage,
                      width: 80,
                      height: 80,
                      fit: BoxFit.cover,
                    )
                  : const SizedBox(width: 80, height: 80), // Placeholder if no image
              title: Text(
                article.title,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Source: ${article.source}'),
                  Text('Author: ${article.author}'),
                  Text('Published At: ${article.publishedAt}'),
                ],
              ),
              onTap: () {
                // Open the news link in a browser
                _launchURL(article.url);
              },
            ),
          );
        },
      ),
    );
  }

  void _launchURL(String url) {
    // You can use a package like 'url_launcher' to open the URL
    // Example:
    // launch(url);
  }
}

