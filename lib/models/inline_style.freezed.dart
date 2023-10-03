// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'inline_style.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

InlineStyle _$InlineStyleFromJson(Map<String, dynamic> json) {
  return _InlineStyle.fromJson(json);
}

/// @nodoc
mixin _$InlineStyle {
  String get style => throw _privateConstructorUsedError;
  int get length => throw _privateConstructorUsedError;
  int get offset => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $InlineStyleCopyWith<InlineStyle> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InlineStyleCopyWith<$Res> {
  factory $InlineStyleCopyWith(
          InlineStyle value, $Res Function(InlineStyle) then) =
      _$InlineStyleCopyWithImpl<$Res, InlineStyle>;
  @useResult
  $Res call({String style, int length, int offset});
}

/// @nodoc
class _$InlineStyleCopyWithImpl<$Res, $Val extends InlineStyle>
    implements $InlineStyleCopyWith<$Res> {
  _$InlineStyleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? style = null,
    Object? length = null,
    Object? offset = null,
  }) {
    return _then(_value.copyWith(
      style: null == style
          ? _value.style
          : style // ignore: cast_nullable_to_non_nullable
              as String,
      length: null == length
          ? _value.length
          : length // ignore: cast_nullable_to_non_nullable
              as int,
      offset: null == offset
          ? _value.offset
          : offset // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InlineStyleImplCopyWith<$Res>
    implements $InlineStyleCopyWith<$Res> {
  factory _$$InlineStyleImplCopyWith(
          _$InlineStyleImpl value, $Res Function(_$InlineStyleImpl) then) =
      __$$InlineStyleImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String style, int length, int offset});
}

/// @nodoc
class __$$InlineStyleImplCopyWithImpl<$Res>
    extends _$InlineStyleCopyWithImpl<$Res, _$InlineStyleImpl>
    implements _$$InlineStyleImplCopyWith<$Res> {
  __$$InlineStyleImplCopyWithImpl(
      _$InlineStyleImpl _value, $Res Function(_$InlineStyleImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? style = null,
    Object? length = null,
    Object? offset = null,
  }) {
    return _then(_$InlineStyleImpl(
      style: null == style
          ? _value.style
          : style // ignore: cast_nullable_to_non_nullable
              as String,
      length: null == length
          ? _value.length
          : length // ignore: cast_nullable_to_non_nullable
              as int,
      offset: null == offset
          ? _value.offset
          : offset // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$InlineStyleImpl implements _InlineStyle {
  const _$InlineStyleImpl(
      {required this.style, required this.length, required this.offset});

  factory _$InlineStyleImpl.fromJson(Map<String, dynamic> json) =>
      _$$InlineStyleImplFromJson(json);

  @override
  final String style;
  @override
  final int length;
  @override
  final int offset;

  @override
  String toString() {
    return 'InlineStyle(style: $style, length: $length, offset: $offset)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InlineStyleImpl &&
            (identical(other.style, style) || other.style == style) &&
            (identical(other.length, length) || other.length == length) &&
            (identical(other.offset, offset) || other.offset == offset));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, style, length, offset);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InlineStyleImplCopyWith<_$InlineStyleImpl> get copyWith =>
      __$$InlineStyleImplCopyWithImpl<_$InlineStyleImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$InlineStyleImplToJson(
      this,
    );
  }
}

abstract class _InlineStyle implements InlineStyle {
  const factory _InlineStyle(
      {required final String style,
      required final int length,
      required final int offset}) = _$InlineStyleImpl;

  factory _InlineStyle.fromJson(Map<String, dynamic> json) =
      _$InlineStyleImpl.fromJson;

  @override
  String get style;
  @override
  int get length;
  @override
  int get offset;
  @override
  @JsonKey(ignore: true)
  _$$InlineStyleImplCopyWith<_$InlineStyleImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
