import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mobildasturchi_uz_freezed_va_bloc/ui/news/data/repository/news_repository.dart';

import '../data/models/news_model.dart';

part 'news_event.dart';
part 'news_state.dart';
part 'news_bloc.freezed.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  NewsBloc({
    required this.newsRepository,
  }) : super(const _Initial()) {
    on<_GetNews>(_onGetNews);
  }

  final NewsRepository newsRepository;

  void _onGetNews(
    _GetNews event,
    Emitter<NewsState> emit,
  ) async {
    emit(const _Loading()); // yuklanmoqda
    try {
      final news = await newsRepository.getNews(event.topic);
      emit(_Loaded(news)); // yuklandi
    } catch (error) {
      emit(_Error(error.toString())); // xatolik sodir bo'ldi
    }
  }
}
