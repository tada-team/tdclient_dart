import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tdproto_dart/tdproto_dart.dart';

part 'message_list_container.freezed.dart';
part 'message_list_container.g.dart';

@freezed
abstract class MessageListContainer with _$MessageListContainer {
  const factory MessageListContainer({
    @JsonKey(name: 'messages') List<Message> messages,
  }) = _MessageListContainer;

  factory MessageListContainer.fromJson(Map<String, dynamic> json) => _$MessageListContainerFromJson(json);
}
