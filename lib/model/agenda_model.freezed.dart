// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'agenda_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AgendaModel _$AgendaModelFromJson(Map<String, dynamic> json) {
  return _AgendaModel.fromJson(json);
}

/// @nodoc
mixin _$AgendaModel {
  String get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'date', fromJson: dateTimeFromTimestamp, toJson: toTimestamp)
  DateTime get date => throw _privateConstructorUsedError;
  @JsonKey(
      name: 'date_reminder',
      fromJson: dateTimeFromTimestamp,
      toJson: toTimestamp)
  DateTime get dateReminder => throw _privateConstructorUsedError;
  String get attached => throw _privateConstructorUsedError;
  @JsonKey(name: 'back_image')
  String get backImage => throw _privateConstructorUsedError;
  @JsonKey(name: 'image_url')
  String get imageUrl => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AgendaModelCopyWith<AgendaModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AgendaModelCopyWith<$Res> {
  factory $AgendaModelCopyWith(
          AgendaModel value, $Res Function(AgendaModel) then) =
      _$AgendaModelCopyWithImpl<$Res, AgendaModel>;
  @useResult
  $Res call(
      {String id,
      String title,
      String description,
      @JsonKey(name: 'date', fromJson: dateTimeFromTimestamp, toJson: toTimestamp)
          DateTime date,
      @JsonKey(name: 'date_reminder', fromJson: dateTimeFromTimestamp, toJson: toTimestamp)
          DateTime dateReminder,
      String attached,
      @JsonKey(name: 'back_image')
          String backImage,
      @JsonKey(name: 'image_url')
          String imageUrl});
}

/// @nodoc
class _$AgendaModelCopyWithImpl<$Res, $Val extends AgendaModel>
    implements $AgendaModelCopyWith<$Res> {
  _$AgendaModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? date = null,
    Object? dateReminder = null,
    Object? attached = null,
    Object? backImage = null,
    Object? imageUrl = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      dateReminder: null == dateReminder
          ? _value.dateReminder
          : dateReminder // ignore: cast_nullable_to_non_nullable
              as DateTime,
      attached: null == attached
          ? _value.attached
          : attached // ignore: cast_nullable_to_non_nullable
              as String,
      backImage: null == backImage
          ? _value.backImage
          : backImage // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AgendaModelCopyWith<$Res>
    implements $AgendaModelCopyWith<$Res> {
  factory _$$_AgendaModelCopyWith(
          _$_AgendaModel value, $Res Function(_$_AgendaModel) then) =
      __$$_AgendaModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String title,
      String description,
      @JsonKey(name: 'date', fromJson: dateTimeFromTimestamp, toJson: toTimestamp)
          DateTime date,
      @JsonKey(name: 'date_reminder', fromJson: dateTimeFromTimestamp, toJson: toTimestamp)
          DateTime dateReminder,
      String attached,
      @JsonKey(name: 'back_image')
          String backImage,
      @JsonKey(name: 'image_url')
          String imageUrl});
}

/// @nodoc
class __$$_AgendaModelCopyWithImpl<$Res>
    extends _$AgendaModelCopyWithImpl<$Res, _$_AgendaModel>
    implements _$$_AgendaModelCopyWith<$Res> {
  __$$_AgendaModelCopyWithImpl(
      _$_AgendaModel _value, $Res Function(_$_AgendaModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = null,
    Object? date = null,
    Object? dateReminder = null,
    Object? attached = null,
    Object? backImage = null,
    Object? imageUrl = null,
  }) {
    return _then(_$_AgendaModel(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      dateReminder: null == dateReminder
          ? _value.dateReminder
          : dateReminder // ignore: cast_nullable_to_non_nullable
              as DateTime,
      attached: null == attached
          ? _value.attached
          : attached // ignore: cast_nullable_to_non_nullable
              as String,
      backImage: null == backImage
          ? _value.backImage
          : backImage // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AgendaModel implements _AgendaModel {
  const _$_AgendaModel(
      {required this.id,
      required this.title,
      required this.description,
      @JsonKey(name: 'date', fromJson: dateTimeFromTimestamp, toJson: toTimestamp)
          required this.date,
      @JsonKey(name: 'date_reminder', fromJson: dateTimeFromTimestamp, toJson: toTimestamp)
          required this.dateReminder,
      required this.attached,
      @JsonKey(name: 'back_image')
          required this.backImage,
      @JsonKey(name: 'image_url')
          required this.imageUrl});

  factory _$_AgendaModel.fromJson(Map<String, dynamic> json) =>
      _$$_AgendaModelFromJson(json);

  @override
  final String id;
  @override
  final String title;
  @override
  final String description;
  @override
  @JsonKey(name: 'date', fromJson: dateTimeFromTimestamp, toJson: toTimestamp)
  final DateTime date;
  @override
  @JsonKey(
      name: 'date_reminder',
      fromJson: dateTimeFromTimestamp,
      toJson: toTimestamp)
  final DateTime dateReminder;
  @override
  final String attached;
  @override
  @JsonKey(name: 'back_image')
  final String backImage;
  @override
  @JsonKey(name: 'image_url')
  final String imageUrl;

  @override
  String toString() {
    return 'AgendaModel(id: $id, title: $title, description: $description, date: $date, dateReminder: $dateReminder, attached: $attached, backImage: $backImage, imageUrl: $imageUrl)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AgendaModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.dateReminder, dateReminder) ||
                other.dateReminder == dateReminder) &&
            (identical(other.attached, attached) ||
                other.attached == attached) &&
            (identical(other.backImage, backImage) ||
                other.backImage == backImage) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, title, description, date,
      dateReminder, attached, backImage, imageUrl);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AgendaModelCopyWith<_$_AgendaModel> get copyWith =>
      __$$_AgendaModelCopyWithImpl<_$_AgendaModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AgendaModelToJson(
      this,
    );
  }
}

abstract class _AgendaModel implements AgendaModel {
  const factory _AgendaModel(
      {required final String id,
      required final String title,
      required final String description,
      @JsonKey(name: 'date', fromJson: dateTimeFromTimestamp, toJson: toTimestamp)
          required final DateTime date,
      @JsonKey(name: 'date_reminder', fromJson: dateTimeFromTimestamp, toJson: toTimestamp)
          required final DateTime dateReminder,
      required final String attached,
      @JsonKey(name: 'back_image')
          required final String backImage,
      @JsonKey(name: 'image_url')
          required final String imageUrl}) = _$_AgendaModel;

  factory _AgendaModel.fromJson(Map<String, dynamic> json) =
      _$_AgendaModel.fromJson;

  @override
  String get id;
  @override
  String get title;
  @override
  String get description;
  @override
  @JsonKey(name: 'date', fromJson: dateTimeFromTimestamp, toJson: toTimestamp)
  DateTime get date;
  @override
  @JsonKey(
      name: 'date_reminder',
      fromJson: dateTimeFromTimestamp,
      toJson: toTimestamp)
  DateTime get dateReminder;
  @override
  String get attached;
  @override
  @JsonKey(name: 'back_image')
  String get backImage;
  @override
  @JsonKey(name: 'image_url')
  String get imageUrl;
  @override
  @JsonKey(ignore: true)
  _$$_AgendaModelCopyWith<_$_AgendaModel> get copyWith =>
      throw _privateConstructorUsedError;
}
