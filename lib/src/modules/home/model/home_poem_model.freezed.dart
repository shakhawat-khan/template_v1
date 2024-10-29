// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_poem_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PoemModel _$PoemModelFromJson(Map<String, dynamic> json) {
  return _PoemModel.fromJson(json);
}

/// @nodoc
mixin _$PoemModel {
  List<String> get lines => throw _privateConstructorUsedError;

  /// Serializes this PoemModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PoemModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PoemModelCopyWith<PoemModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PoemModelCopyWith<$Res> {
  factory $PoemModelCopyWith(PoemModel value, $Res Function(PoemModel) then) =
      _$PoemModelCopyWithImpl<$Res, PoemModel>;
  @useResult
  $Res call({List<String> lines});
}

/// @nodoc
class _$PoemModelCopyWithImpl<$Res, $Val extends PoemModel>
    implements $PoemModelCopyWith<$Res> {
  _$PoemModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PoemModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lines = null,
  }) {
    return _then(_value.copyWith(
      lines: null == lines
          ? _value.lines
          : lines // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PoemModelImplCopyWith<$Res>
    implements $PoemModelCopyWith<$Res> {
  factory _$$PoemModelImplCopyWith(
          _$PoemModelImpl value, $Res Function(_$PoemModelImpl) then) =
      __$$PoemModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<String> lines});
}

/// @nodoc
class __$$PoemModelImplCopyWithImpl<$Res>
    extends _$PoemModelCopyWithImpl<$Res, _$PoemModelImpl>
    implements _$$PoemModelImplCopyWith<$Res> {
  __$$PoemModelImplCopyWithImpl(
      _$PoemModelImpl _value, $Res Function(_$PoemModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of PoemModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lines = null,
  }) {
    return _then(_$PoemModelImpl(
      lines: null == lines
          ? _value._lines
          : lines // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PoemModelImpl implements _PoemModel {
  const _$PoemModelImpl({required final List<String> lines}) : _lines = lines;

  factory _$PoemModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PoemModelImplFromJson(json);

  final List<String> _lines;
  @override
  List<String> get lines {
    if (_lines is EqualUnmodifiableListView) return _lines;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_lines);
  }

  @override
  String toString() {
    return 'PoemModel(lines: $lines)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PoemModelImpl &&
            const DeepCollectionEquality().equals(other._lines, _lines));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_lines));

  /// Create a copy of PoemModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PoemModelImplCopyWith<_$PoemModelImpl> get copyWith =>
      __$$PoemModelImplCopyWithImpl<_$PoemModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PoemModelImplToJson(
      this,
    );
  }
}

abstract class _PoemModel implements PoemModel {
  const factory _PoemModel({required final List<String> lines}) =
      _$PoemModelImpl;

  factory _PoemModel.fromJson(Map<String, dynamic> json) =
      _$PoemModelImpl.fromJson;

  @override
  List<String> get lines;

  /// Create a copy of PoemModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PoemModelImplCopyWith<_$PoemModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
