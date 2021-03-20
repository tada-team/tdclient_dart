// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'confirm_container.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ConfirmContainer _$_$_ConfirmContainerFromJson(Map<String, dynamic> json) {
  return $checkedNew(r'_$_ConfirmContainer', json, () {
    final val = _$_ConfirmContainer(
      confirmId: $checkedConvert(json, 'confirm_id', (v) => v as String?),
    );
    return val;
  }, fieldKeyMap: const {'confirmId': 'confirm_id'});
}

Map<String, dynamic> _$_$_ConfirmContainerToJson(
        _$_ConfirmContainer instance) =>
    <String, dynamic>{
      'confirm_id': instance.confirmId,
    };
