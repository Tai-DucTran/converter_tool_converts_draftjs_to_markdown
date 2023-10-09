import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:learn_quill_flutter/converter/converter_v2.dart';

part 'markdown_format.freezed.dart';

part 'markdown_format.g.dart';

@freezed
class MarkDownFormat with _$MarkDownFormat {
  const factory MarkDownFormat({
    required String format,
    required int offset,
    required OffsetType offsetType,
  }) = _MarkDownFormat;

  factory MarkDownFormat.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$MarkDownFormatFromJson(json);
}
