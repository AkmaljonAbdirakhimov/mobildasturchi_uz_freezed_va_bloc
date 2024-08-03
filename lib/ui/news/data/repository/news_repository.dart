import 'package:dio/dio.dart';
import 'package:mobildasturchi_uz_freezed_va_bloc/ui/news/data/models/news_model.dart';
import 'package:mobildasturchi_uz_freezed_va_bloc/utils/apis.dart';

class NewsRepository {
  final dio = Dio();

  Future<List<NewsModel>> getNews(String topic) async {
    final now = DateTime.now();
    final url =
        "https://newsapi.org/v2/everything?q=$topic&from=2024-07-03&sortBy=publishedAt&apiKey=$newsApiKey";
    try {
      final response = await dio.get(url);

      final data = response.data;

      final news = List<NewsModel>.from(
        data['articles'].map(
          (n) => NewsModel.fromJson(n),
        ),
      );

      return news;
    } on DioException catch (e) {
      throw (e.response?.data);
    } catch (e) {
      rethrow;
    }
  }
}
