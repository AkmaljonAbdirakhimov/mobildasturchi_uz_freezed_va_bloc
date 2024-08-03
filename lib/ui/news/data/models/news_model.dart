import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:mobildasturchi_uz_freezed_va_bloc/ui/news/data/models/source_model.dart';

part 'news_model.freezed.dart';

part 'news_model.g.dart';

@freezed
class NewsModel with _$NewsModel {
  const factory NewsModel({
    required SourceModel source,
    @JsonKey(defaultValue: '') required String author,
    @JsonKey(defaultValue: '') required String title,
    @JsonKey(defaultValue: '') required String description,
    @JsonKey(defaultValue: '') required String url,
    @JsonKey(
        defaultValue:
            "https://i.abcnewsfe.com/a/3cb8ba6c-ccdb-48de-99cc-e684e5358708/abcnl__NEW_streamingnow_1664457649883_hpMain_16x9.jpg")
    required String urlToImage,
    required DateTime publishedAt,
    @JsonKey(defaultValue: '') required String content,
  }) = _NewsModel;

  factory NewsModel.fromJson(Map<String, Object?> json) =>
      _$NewsModelFromJson(json);
}
