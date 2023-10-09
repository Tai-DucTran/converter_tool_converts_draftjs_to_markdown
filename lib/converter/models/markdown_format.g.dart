// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'markdown_format.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MarkDownFormatImpl _$$MarkDownFormatImplFromJson(Map<String, dynamic> json) =>
    _$MarkDownFormatImpl(
      format: json['format'] as String,
      offset: json['offset'] as int,
      offsetType: $enumDecode(_$OffsetTypeEnumMap, json['offsetType']),
    );

Map<String, dynamic> _$$MarkDownFormatImplToJson(
        _$MarkDownFormatImpl instance) =>
    <String, dynamic>{
      'format': instance.format,
      'offset': instance.offset,
      'offsetType': _$OffsetTypeEnumMap[instance.offsetType]!,
    };

const _$OffsetTypeEnumMap = {
  OffsetType.start: 'start',
  OffsetType.end: 'end',
};
