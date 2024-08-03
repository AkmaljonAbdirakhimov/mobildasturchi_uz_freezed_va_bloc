import 'package:flutter/material.dart';
import 'package:mobildasturchi_uz_freezed_va_bloc/ui/news/news_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NewsScreen(),
    );
  }
}
