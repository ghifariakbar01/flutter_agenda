// ignore_for_file: invalid_annotation_target

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'agenda_model.freezed.dart';

part 'agenda_model.g.dart';

@freezed
class AgendaModel with _$AgendaModel {
  const factory AgendaModel({
    required String id,
    required String title,
    required String description,
    @JsonKey(name: 'date', fromJson: dateTimeFromTimestamp, toJson: toTimestamp)
        required DateTime date,
    @JsonKey(name: 'date_reminder', fromJson: dateTimeFromTimestamp, toJson: toTimestamp)
        required DateTime dateReminder,
    required String attached,
    @JsonKey(name: 'back_image') required String backImage,
    @JsonKey(name: 'image_url') required String imageUrl,
  }) = _AgendaModel;

  factory AgendaModel.fromJson(Map<String, Object?> json) =>
      _$AgendaModelFromJson(json);
}

DateTime dateTimeFromTimestamp(Timestamp timestamp) {
  return timestamp.toDate();
}

toTimestamp(DateTime date) {
  return Timestamp.fromDate(date);
}
