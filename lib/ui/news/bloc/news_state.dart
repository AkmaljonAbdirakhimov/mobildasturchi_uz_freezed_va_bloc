part of 'news_bloc.dart';

@freezed
class NewsState with _$NewsState {
  const factory NewsState.initial() = _Initial;
  const factory NewsState.loading() = _Loading;
  const factory NewsState.loaded(List<NewsModel> news) = _Loaded;
  const factory NewsState.error(String message) = _Error;
}
// UI (events) BLOC
// BLOC (states) UI