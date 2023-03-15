// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'upload_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UploadModel _$UploadModelFromJson(Map<String, dynamic> json) {
  return _UploadModel.fromJson(json);
}

/// @nodoc
mixin _$UploadModel {
  String get imgPath => throw _privateConstructorUsedError;
  String get downloadUrl => throw _privateConstructorUsedError;
  bool get isDone => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UploadModelCopyWith<UploadModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UploadModelCopyWith<$Res> {
  factory $UploadModelCopyWith(
          UploadModel value, $Res Function(UploadModel) then) =
      _$UploadModelCopyWithImpl<$Res, UploadModel>;
  @useResult
  $Res call({String imgPath, String downloadUrl, bool isDone});
}

/// @nodoc
class _$UploadModelCopyWithImpl<$Res, $Val extends UploadModel>
    implements $UploadModelCopyWith<$Res> {
  _$UploadModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? imgPath = null,
    Object? downloadUrl = null,
    Object? isDone = null,
  }) {
    return _then(_value.copyWith(
      imgPath: null == imgPath
          ? _value.imgPath
          : imgPath // ignore: cast_nullable_to_non_nullable
              as String,
      downloadUrl: null == downloadUrl
          ? _value.downloadUrl
          : downloadUrl // ignore: cast_nullable_to_non_nullable
              as String,
      isDone: null == isDone
          ? _value.isDone
          : isDone // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UploadModelCopyWith<$Res>
    implements $UploadModelCopyWith<$Res> {
  factory _$$_UploadModelCopyWith(
          _$_UploadModel value, $Res Function(_$_UploadModel) then) =
      __$$_UploadModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String imgPath, String downloadUrl, bool isDone});
}

/// @nodoc
class __$$_UploadModelCopyWithImpl<$Res>
    extends _$UploadModelCopyWithImpl<$Res, _$_UploadModel>
    implements _$$_UploadModelCopyWith<$Res> {
  __$$_UploadModelCopyWithImpl(
      _$_UploadModel _value, $Res Function(_$_UploadModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? imgPath = null,
    Object? downloadUrl = null,
    Object? isDone = null,
  }) {
    return _then(_$_UploadModel(
      imgPath: null == imgPath
          ? _value.imgPath
          : imgPath // ignore: cast_nullable_to_non_nullable
              as String,
      downloadUrl: null == downloadUrl
          ? _value.downloadUrl
          : downloadUrl // ignore: cast_nullable_to_non_nullable
              as String,
      isDone: null == isDone
          ? _value.isDone
          : isDone // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UploadModel implements _UploadModel {
  const _$_UploadModel(
      {required this.imgPath, required this.downloadUrl, required this.isDone});

  factory _$_UploadModel.fromJson(Map<String, dynamic> json) =>
      _$$_UploadModelFromJson(json);

  @override
  final String imgPath;
  @override
  final String downloadUrl;
  @override
  final bool isDone;

  @override
  String toString() {
    return 'UploadModel(imgPath: $imgPath, downloadUrl: $downloadUrl, isDone: $isDone)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UploadModel &&
            (identical(other.imgPath, imgPath) || other.imgPath == imgPath) &&
            (identical(other.downloadUrl, downloadUrl) ||
                other.downloadUrl == downloadUrl) &&
            (identical(other.isDone, isDone) || other.isDone == isDone));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, imgPath, downloadUrl, isDone);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UploadModelCopyWith<_$_UploadModel> get copyWith =>
      __$$_UploadModelCopyWithImpl<_$_UploadModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UploadModelToJson(
      this,
    );
  }
}

abstract class _UploadModel implements UploadModel {
  const factory _UploadModel(
      {required final String imgPath,
      required final String downloadUrl,
      required final bool isDone}) = _$_UploadModel;

  factory _UploadModel.fromJson(Map<String, dynamic> json) =
      _$_UploadModel.fromJson;

  @override
  String get imgPath;
  @override
  String get downloadUrl;
  @override
  bool get isDone;
  @override
  @JsonKey(ignore: true)
  _$$_UploadModelCopyWith<_$_UploadModel> get copyWith =>
      throw _privateConstructorUsedError;
}
