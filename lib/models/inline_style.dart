import 'package:freezed_annotation/freezed_annotation.dart';

part 'inline_style.freezed.dart';
part 'inline_style.g.dart';

@freezed
class InlineStyle with _$InlineStyle {
  const factory InlineStyle({
    required String style,
    required int length,
    required int offset,
  }) = _InlineStyle;

  factory InlineStyle.fromJson(Map<String, Object?> json) =>
      _$InlineStyleFromJson(json);
}
