// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'markdown_format.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MarkDownFormat _$MarkDownFormatFromJson(Map<String, dynamic> json) {
  return _MarkDownFormat.fromJson(json);
}

/// @nodoc
mixin _$MarkDownFormat {
  String get format => throw _privateConstructorUsedError;
  int get offset => throw _privateConstructorUsedError;
  String get offsetType => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MarkDownFormatCopyWith<MarkDownFormat> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MarkDownFormatCopyWith<$Res> {
  factory $MarkDownFormatCopyWith(
          MarkDownFormat value, $Res Function(MarkDownFormat) then) =
      _$MarkDownFormatCopyWithImpl<$Res, MarkDownFormat>;
  @useResult
  $Res call({String format, int offset, String offsetType});
}

/// @nodoc
class _$MarkDownFormatCopyWithImpl<$Res, $Val extends MarkDownFormat>
    implements $MarkDownFormatCopyWith<$Res> {
  _$MarkDownFormatCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? format = null,
    Object? offset = null,
    Object? offsetType = null,
  }) {
    return _then(_value.copyWith(
      format: null == format
          ? _value.format
          : format // ignore: cast_nullable_to_non_nullable
              as String,
      offset: null == offset
          ? _value.offset
          : offset // ignore: cast_nullable_to_non_nullable
              as int,
      offsetType: null == offsetType
          ? _value.offsetType
          : offsetType // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MarkDownFormatImplCopyWith<$Res>
    implements $MarkDownFormatCopyWith<$Res> {
  factory _$$MarkDownFormatImplCopyWith(_$MarkDownFormatImpl value,
          $Res Function(_$MarkDownFormatImpl) then) =
      __$$MarkDownFormatImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String format, int offset, String offsetType});
}

/// @nodoc
class __$$MarkDownFormatImplCopyWithImpl<$Res>
    extends _$MarkDownFormatCopyWithImpl<$Res, _$MarkDownFormatImpl>
    implements _$$MarkDownFormatImplCopyWith<$Res> {
  __$$MarkDownFormatImplCopyWithImpl(
      _$MarkDownFormatImpl _value, $Res Function(_$MarkDownFormatImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? format = null,
    Object? offset = null,
    Object? offsetType = null,
  }) {
    return _then(_$MarkDownFormatImpl(
      format: null == format
          ? _value.format
          : format // ignore: cast_nullable_to_non_nullable
              as String,
      offset: null == offset
          ? _value.offset
          : offset // ignore: cast_nullable_to_non_nullable
              as int,
      offsetType: null == offsetType
          ? _value.offsetType
          : offsetType // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MarkDownFormatImpl implements _MarkDownFormat {
  const _$MarkDownFormatImpl(
      {required this.format, required this.offset, required this.offsetType});

  factory _$MarkDownFormatImpl.fromJson(Map<String, dynamic> json) =>
      _$$MarkDownFormatImplFromJson(json);

  @override
  final String format;
  @override
  final int offset;
  @override
  final String offsetType;

  @override
  String toString() {
    return 'MarkDownFormat(format: $format, offset: $offset, offsetType: $offsetType)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MarkDownFormatImpl &&
            (identical(other.format, format) || other.format == format) &&
            (identical(other.offset, offset) || other.offset == offset) &&
            (identical(other.offsetType, offsetType) ||
                other.offsetType == offsetType));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, format, offset, offsetType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MarkDownFormatImplCopyWith<_$MarkDownFormatImpl> get copyWith =>
      __$$MarkDownFormatImplCopyWithImpl<_$MarkDownFormatImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MarkDownFormatImplToJson(
      this,
    );
  }
}

abstract class _MarkDownFormat implements MarkDownFormat {
  const factory _MarkDownFormat(
      {required final String format,
      required final int offset,
      required final String offsetType}) = _$MarkDownFormatImpl;

  factory _MarkDownFormat.fromJson(Map<String, dynamic> json) =
      _$MarkDownFormatImpl.fromJson;

  @override
  String get format;
  @override
  int get offset;
  @override
  String get offsetType;
  @override
  @JsonKey(ignore: true)
  _$$MarkDownFormatImplCopyWith<_$MarkDownFormatImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
