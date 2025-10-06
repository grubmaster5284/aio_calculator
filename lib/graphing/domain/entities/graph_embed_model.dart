import 'package:freezed_annotation/freezed_annotation.dart';

part 'graph_embed_model.freezed.dart';

/// Domain entity representing embeddable graph content (HTML snippet).
@freezed
abstract class GraphEmbed with _$GraphEmbed {
  const factory GraphEmbed({required String html}) = _GraphEmbed;
}


