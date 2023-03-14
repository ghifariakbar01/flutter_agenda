// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: non_constant_identifier_names

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserModel _$$_UserModelFromJson(Map<String, dynamic> json) => _$_UserModel(
      namaDepan: json['nama_depan'] as String,
      namaBelakang: json['nama_belakang'] as String,
      email: json['email'] as String,
      tanggalLahir: json['tanggal_lahir'] as String,
      jenisKelamin: json['jenis_kelamin'] as String,
      password: json['password'] as String,
      fotoProfil: json['foto_profil'] as String,
    );

Map<String, dynamic> _$$_UserModelToJson(_$_UserModel instance) =>
    <String, dynamic>{
      'nama_depan': instance.namaDepan,
      'nama_belakang': instance.namaBelakang,
      'email': instance.email,
      'tanggal_lahir': instance.tanggalLahir,
      'jenis_kelamin': instance.jenisKelamin,
      'password': instance.password,
      'foto_profil': instance.fotoProfil,
    };
