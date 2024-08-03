import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/news_bloc.dart';
import 'news_details_screen.dart';

class NewsScreen extends StatelessWidget {
  NewsScreen({super.key});

  final topicController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('News App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: topicController,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                labelText: "Mavzuni kiriting",
                suffixIcon: IconButton(
                  onPressed: () {
                    if (topicController.text.trim().isNotEmpty) {
                      context
                          .read<NewsBloc>()
                          .add(NewsEvent.getNews(topicController.text));
                    }
                  },
                  icon: const Icon(Icons.search),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: BlocBuilder<NewsBloc, NewsState>(
                builder: (context, state) {
                  return state.when(
                    initial: () => const Center(
                      child: Text(
                          "Yangiliklar mavjud emas, izlash uchun mavzu kiriting"),
                    ),
                    loading: () => const Center(
                      child: CircularProgressIndicator(),
                    ),
                    loaded: (news) {
                      return ListView.builder(
                        itemCount: news.length,
                        itemBuilder: (context, index) {
                          final newsItem = news[index];
                          return ListTile(
                            leading: CircleAvatar(
                              backgroundImage: NetworkImage(
                                newsItem.urlToImage,
                              ),
                              radius: 40,
                            ),
                            title: Text(newsItem.title),
                            subtitle: Text(newsItem.description),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => NewsDetailsScreen(
                                    newsItem: newsItem,
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      );
                    },
                    error: (message) {
                      return Center(
                        child: Text(message),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
