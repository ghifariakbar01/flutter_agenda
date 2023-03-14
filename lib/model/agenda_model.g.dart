// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: non_constant_identifier_names

part of 'agenda_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AgendaModel _$$_AgendaModelFromJson(Map<String, dynamic> json) =>
    _$_AgendaModel(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      date: dateTimeFromTimestamp(json['date'] as Timestamp),
      dateReminder: dateTimeFromTimestamp(json['date_reminder'] as Timestamp),
      attached: json['attached'] as String,
      backImage: json['back_image'] as String,
      imageUrl: json['image_url'] as String,
    );

Map<String, dynamic> _$$_AgendaModelToJson(_$_AgendaModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'date': toTimestamp(instance.date),
      'date_reminder': toTimestamp(instance.dateReminder),
      'attached': instance.attached,
      'back_image': instance.backImage,
      'image_url': instance.imageUrl,
    };
