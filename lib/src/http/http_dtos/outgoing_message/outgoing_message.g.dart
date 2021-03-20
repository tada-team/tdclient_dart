// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'outgoing_message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_OutgoingMessage _$_$_OutgoingMessageFromJson(Map<String, dynamic> json) {
  return $checkedNew(r'_$_OutgoingMessage', json, () {
    final val = _$_OutgoingMessage(
      text: $checkedConvert(json, 'text', (v) => v as String?),
    );
    return val;
  });
}

Map<String, dynamic> _$_$_OutgoingMessageToJson(_$_OutgoingMessage instance) =>
    <String, dynamic>{
      'text': instance.text,
    };
