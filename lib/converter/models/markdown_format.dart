import 'package:freezed_annotation/freezed_annotation.dart';

part 'markdown_format.freezed.dart';

part 'markdown_format.g.dart';

@freezed
class MarkDownFormat with _$MarkDownFormat {
  const factory MarkDownFormat({
    required String format,
    required int offset,
    required String offsetType,
  }) = _MarkDownFormat;

  factory MarkDownFormat.fromJson(Map<String, Object?> json) =>
      _$MarkDownFormatFromJson(json);
}
