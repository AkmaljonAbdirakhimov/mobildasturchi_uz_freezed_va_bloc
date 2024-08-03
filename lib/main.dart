import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobildasturchi_uz_freezed_va_bloc/app/app.dart';
import 'package:mobildasturchi_uz_freezed_va_bloc/ui/news/bloc/news_bloc.dart';
import 'package:mobildasturchi_uz_freezed_va_bloc/ui/news/data/repository/news_repository.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) {
        return NewsRepository();
      },
      child: BlocProvider(
        create: (context) {
          return NewsBloc(newsRepository: context.read<NewsRepository>());
        },
        child: const App(),
      ),
    );
  }
}
