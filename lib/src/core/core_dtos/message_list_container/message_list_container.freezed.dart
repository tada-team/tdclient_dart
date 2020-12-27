// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'message_list_container.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
MessageListContainer _$MessageListContainerFromJson(Map<String, dynamic> json) {
  return _MessageListContainer.fromJson(json);
}

/// @nodoc
class _$MessageListContainerTearOff {
  const _$MessageListContainerTearOff();

// ignore: unused_element
  _MessageListContainer call(
      {@JsonKey(name: 'messages') List<Message> messages}) {
    return _MessageListContainer(
      messages: messages,
    );
  }

// ignore: unused_element
  MessageListContainer fromJson(Map<String, Object> json) {
    return MessageListContainer.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $MessageListContainer = _$MessageListContainerTearOff();

/// @nodoc
mixin _$MessageListContainer {
  @JsonKey(name: 'messages')
  List<Message> get messages;

  Map<String, dynamic> toJson();
  $MessageListContainerCopyWith<MessageListContainer> get copyWith;
}

/// @nodoc
abstract class $MessageListContainerCopyWith<$Res> {
  factory $MessageListContainerCopyWith(MessageListContainer value,
          $Res Function(MessageListContainer) then) =
      _$MessageListContainerCopyWithImpl<$Res>;
  $Res call({@JsonKey(name: 'messages') List<Message> messages});
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
    Object messages = freezed,
  }) {
    return _then(_value.copyWith(
      messages:
          messages == freezed ? _value.messages : messages as List<Message>,
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
  $Res call({@JsonKey(name: 'messages') List<Message> messages});
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
    Object messages = freezed,
  }) {
    return _then(_MessageListContainer(
      messages:
          messages == freezed ? _value.messages : messages as List<Message>,
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
  final List<Message> messages;

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
          {@JsonKey(name: 'messages') List<Message> messages}) =
      _$_MessageListContainer;

  factory _MessageListContainer.fromJson(Map<String, dynamic> json) =
      _$_MessageListContainer.fromJson;

  @override
  @JsonKey(name: 'messages')
  List<Message> get messages;
  @override
  _$MessageListContainerCopyWith<_MessageListContainer> get copyWith;
}
