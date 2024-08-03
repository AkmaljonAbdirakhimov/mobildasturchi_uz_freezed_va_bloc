import 'package:flutter/material.dart';
import 'package:mobildasturchi_uz_freezed_va_bloc/ui/news/data/models/news_model.dart';

class NewsDetailsScreen extends StatelessWidget {
  final NewsModel newsItem;

  const NewsDetailsScreen({
    super.key,
    required this.newsItem,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(newsItem.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(newsItem.urlToImage),
            const SizedBox(height: 16),
            Text(
              newsItem.title,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              newsItem.description,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            Text(
              'Author: ${newsItem.author}',
              style: const TextStyle(fontSize: 14, fontStyle: FontStyle.italic),
            ),
          ],
        ),
      ),
    );
  }
}
