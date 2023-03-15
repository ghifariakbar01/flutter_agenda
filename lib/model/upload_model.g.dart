// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'upload_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UploadModel _$$_UploadModelFromJson(Map<String, dynamic> json) =>
    _$_UploadModel(
      imgPath: json['imgPath'] as String,
      downloadUrl: json['downloadUrl'] as String,
      isDone: json['isDone'] as bool,
    );

Map<String, dynamic> _$$_UploadModelToJson(_$_UploadModel instance) =>
    <String, dynamic>{
      'imgPath': instance.imgPath,
      'downloadUrl': instance.downloadUrl,
      'isDone': instance.isDone,
    };
