// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'confirm_container.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
ConfirmContainer _$ConfirmContainerFromJson(Map<String, dynamic> json) {
  return _ConfirmContainer.fromJson(json);
}

/// @nodoc
class _$ConfirmContainerTearOff {
  const _$ConfirmContainerTearOff();

// ignore: unused_element
  _ConfirmContainer call({@JsonKey(name: 'confirm_id') String confirmId}) {
    return _ConfirmContainer(
      confirmId: confirmId,
    );
  }

// ignore: unused_element
  ConfirmContainer fromJson(Map<String, Object> json) {
    return ConfirmContainer.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $ConfirmContainer = _$ConfirmContainerTearOff();

/// @nodoc
mixin _$ConfirmContainer {
  @JsonKey(name: 'confirm_id')
  String get confirmId;

  Map<String, dynamic> toJson();
  $ConfirmContainerCopyWith<ConfirmContainer> get copyWith;
}

/// @nodoc
abstract class $ConfirmContainerCopyWith<$Res> {
  factory $ConfirmContainerCopyWith(
          ConfirmContainer value, $Res Function(ConfirmContainer) then) =
      _$ConfirmContainerCopyWithImpl<$Res>;
  $Res call({@JsonKey(name: 'confirm_id') String confirmId});
}

/// @nodoc
class _$ConfirmContainerCopyWithImpl<$Res>
    implements $ConfirmContainerCopyWith<$Res> {
  _$ConfirmContainerCopyWithImpl(this._value, this._then);

  final ConfirmContainer _value;
  // ignore: unused_field
  final $Res Function(ConfirmContainer) _then;

  @override
  $Res call({
    Object confirmId = freezed,
  }) {
    return _then(_value.copyWith(
      confirmId: confirmId == freezed ? _value.confirmId : confirmId as String,
    ));
  }
}

/// @nodoc
abstract class _$ConfirmContainerCopyWith<$Res>
    implements $ConfirmContainerCopyWith<$Res> {
  factory _$ConfirmContainerCopyWith(
          _ConfirmContainer value, $Res Function(_ConfirmContainer) then) =
      __$ConfirmContainerCopyWithImpl<$Res>;
  @override
  $Res call({@JsonKey(name: 'confirm_id') String confirmId});
}

/// @nodoc
class __$ConfirmContainerCopyWithImpl<$Res>
    extends _$ConfirmContainerCopyWithImpl<$Res>
    implements _$ConfirmContainerCopyWith<$Res> {
  __$ConfirmContainerCopyWithImpl(
      _ConfirmContainer _value, $Res Function(_ConfirmContainer) _then)
      : super(_value, (v) => _then(v as _ConfirmContainer));

  @override
  _ConfirmContainer get _value => super._value as _ConfirmContainer;

  @override
  $Res call({
    Object confirmId = freezed,
  }) {
    return _then(_ConfirmContainer(
      confirmId: confirmId == freezed ? _value.confirmId : confirmId as String,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_ConfirmContainer implements _ConfirmContainer {
  const _$_ConfirmContainer({@JsonKey(name: 'confirm_id') this.confirmId});

  factory _$_ConfirmContainer.fromJson(Map<String, dynamic> json) =>
      _$_$_ConfirmContainerFromJson(json);

  @override
  @JsonKey(name: 'confirm_id')
  final String confirmId;

  @override
  String toString() {
    return 'ConfirmContainer(confirmId: $confirmId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ConfirmContainer &&
            (identical(other.confirmId, confirmId) ||
                const DeepCollectionEquality()
                    .equals(other.confirmId, confirmId)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(confirmId);

  @override
  _$ConfirmContainerCopyWith<_ConfirmContainer> get copyWith =>
      __$ConfirmContainerCopyWithImpl<_ConfirmContainer>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_ConfirmContainerToJson(this);
  }
}

abstract class _ConfirmContainer implements ConfirmContainer {
  const factory _ConfirmContainer(
      {@JsonKey(name: 'confirm_id') String confirmId}) = _$_ConfirmContainer;

  factory _ConfirmContainer.fromJson(Map<String, dynamic> json) =
      _$_ConfirmContainer.fromJson;

  @override
  @JsonKey(name: 'confirm_id')
  String get confirmId;
  @override
  _$ConfirmContainerCopyWith<_ConfirmContainer> get copyWith;
}
