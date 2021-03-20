import 'package:freezed_annotation/freezed_annotation.dart';

part 'outgoing_message.freezed.dart';
part 'outgoing_message.g.dart';

@freezed
class OutgoingMessage with _$OutgoingMessage {
  const factory OutgoingMessage({
    @JsonKey(name: 'text') String? text,
  }) = _OutgoingMessage;

  factory OutgoingMessage.fromJson(Map<String, dynamic> json) => _$OutgoingMessageFromJson(json);
}
