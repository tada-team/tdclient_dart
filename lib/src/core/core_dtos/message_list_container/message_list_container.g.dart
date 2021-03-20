// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_list_container.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MessageListContainer _$_$_MessageListContainerFromJson(
    Map<String, dynamic> json) {
  return $checkedNew(r'_$_MessageListContainer', json, () {
    final val = _$_MessageListContainer(
      messages: $checkedConvert(
          json,
          'messages',
          (v) => (v as List<dynamic>?)
              ?.map((e) => Message.fromJson(e as Map<String, dynamic>))
              .toList()),
    );
    return val;
  });
}

Map<String, dynamic> _$_$_MessageListContainerToJson(
        _$_MessageListContainer instance) =>
    <String, dynamic>{
      'messages': instance.messages?.map((e) => e.toJson()).toList(),
    };
