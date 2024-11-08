import 'dart:convert';
import 'package:fitness_meal_helper/widgets/news_model.dart';
import 'package:http/http.dart' as http;

Future<List<NewsArticle>> fetchNews() async {
  const apiKey = '2f2fbadcdd2b453a86c78bc86166950c';  // Replace 'YOUR_API_KEY' with your actual API key
  final response = await http.get(Uri.parse('https://newsapi.org/v2/everything?q=fitness&apiKey=$apiKey'));

  if (response.statusCode == 200) {
    final List<dynamic> newsJson = json.decode(response.body)['articles'];
    return newsJson.map((json) => NewsArticle.fromJson(json)).toList();
  } else {
    throw Exception('Failed to load news');
  }
}

