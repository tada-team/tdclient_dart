// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_list_container.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MessageListContainer _$_$_MessageListContainerFromJson(Map<String, dynamic> json) {
  return _$_MessageListContainer(
    messages: (json['messages'] as List)
        ?.map((e) => e == null ? null : Message.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$_$_MessageListContainerToJson(_$_MessageListContainer instance) => <String, dynamic>{
      'messages': instance.messages?.map((e) => e?.toJson())?.toList(),
    };
