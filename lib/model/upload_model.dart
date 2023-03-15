import 'package:freezed_annotation/freezed_annotation.dart';

part 'upload_model.freezed.dart';

part 'upload_model.g.dart';

@freezed
class UploadModel with _$UploadModel {
  const factory UploadModel({
    required String imgPath,
    required String downloadUrl,
    required bool isDone,
  }) = _UploadModel;

  factory UploadModel.fromJson(Map<String, Object?> json) =>
      _$UploadModelFromJson(json);
}
