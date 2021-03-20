// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'message_list_container.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MessageListContainer _$MessageListContainerFromJson(Map<String, dynamic> json) {
  return _MessageListContainer.fromJson(json);
}

/// @nodoc
class _$MessageListContainerTearOff {
  const _$MessageListContainerTearOff();

  _MessageListContainer call(
      {@JsonKey(name: 'messages') List<Message>? messages}) {
    return _MessageListContainer(
      messages: messages,
    );
  }

  MessageListContainer fromJson(Map<String, Object> json) {
    return MessageListContainer.fromJson(json);
  }
}

/// @nodoc
const $MessageListContainer = _$MessageListContainerTearOff();

/// @nodoc
mixin _$MessageListContainer {
  @JsonKey(name: 'messages')
  List<Message>? get messages => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MessageListContainerCopyWith<MessageListContainer> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MessageListContainerCopyWith<$Res> {
  factory $MessageListContainerCopyWith(MessageListContainer value,
          $Res Function(MessageListContainer) then) =
      _$MessageListContainerCopyWithImpl<$Res>;
  $Res call({@JsonKey(name: 'messages') List<Message>? messages});
}

/// @nodoc
class _$MessageListContainerCopyWithImpl<$Res>
    implements $MessageListContainerCopyWith<$Res> {
  _$MessageListContainerCopyWithImpl(this._value, this._then);

  final MessageListContainer _value;
  // ignore: unused_field
  final $Res Function(MessageListContainer) _then;

  @override
  $Res call({
    Object? messages = freezed,
  }) {
    return _then(_value.copyWith(
      messages: messages == freezed
          ? _value.messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<Message>?,
    ));
  }
}

/// @nodoc
abstract class _$MessageListContainerCopyWith<$Res>
    implements $MessageListContainerCopyWith<$Res> {
  factory _$MessageListContainerCopyWith(_MessageListContainer value,
          $Res Function(_MessageListContainer) then) =
      __$MessageListContainerCopyWithImpl<$Res>;
  @override
  $Res call({@JsonKey(name: 'messages') List<Message>? messages});
}

/// @nodoc
class __$MessageListContainerCopyWithImpl<$Res>
    extends _$MessageListContainerCopyWithImpl<$Res>
    implements _$MessageListContainerCopyWith<$Res> {
  __$MessageListContainerCopyWithImpl(
      _MessageListContainer _value, $Res Function(_MessageListContainer) _then)
      : super(_value, (v) => _then(v as _MessageListContainer));

  @override
  _MessageListContainer get _value => super._value as _MessageListContainer;

  @override
  $Res call({
    Object? messages = freezed,
  }) {
    return _then(_MessageListContainer(
      messages: messages == freezed
          ? _value.messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<Message>?,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_MessageListContainer implements _MessageListContainer {
  const _$_MessageListContainer({@JsonKey(name: 'messages') this.messages});

  factory _$_MessageListContainer.fromJson(Map<String, dynamic> json) =>
      _$_$_MessageListContainerFromJson(json);

  @override
  @JsonKey(name: 'messages')
  final List<Message>? messages;

  @override
  String toString() {
    return 'MessageListContainer(messages: $messages)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _MessageListContainer &&
            (identical(other.messages, messages) ||
                const DeepCollectionEquality()
                    .equals(other.messages, messages)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(messages);

  @JsonKey(ignore: true)
  @override
  _$MessageListContainerCopyWith<_MessageListContainer> get copyWith =>
      __$MessageListContainerCopyWithImpl<_MessageListContainer>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_MessageListContainerToJson(this);
  }
}

abstract class _MessageListContainer implements MessageListContainer {
  const factory _MessageListContainer(
          {@JsonKey(name: 'messages') List<Message>? messages}) =
      _$_MessageListContainer;

  factory _MessageListContainer.fromJson(Map<String, dynamic> json) =
      _$_MessageListContainer.fromJson;

  @override
  @JsonKey(name: 'messages')
  List<Message>? get messages => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$MessageListContainerCopyWith<_MessageListContainer> get copyWith =>
      throw _privateConstructorUsedError;
}
