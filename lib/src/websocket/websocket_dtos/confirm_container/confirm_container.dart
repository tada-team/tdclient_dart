import 'package:freezed_annotation/freezed_annotation.dart';

part 'confirm_container.freezed.dart';
part 'confirm_container.g.dart';

@freezed
abstract class ConfirmContainer with _$ConfirmContainer {
  const factory ConfirmContainer({
    @JsonKey(name: 'confirm_id') String confirmId,
  }) = _ConfirmContainer;

  factory ConfirmContainer.fromJson(Map<String, dynamic> json) => _$ConfirmContainerFromJson(json);
}
