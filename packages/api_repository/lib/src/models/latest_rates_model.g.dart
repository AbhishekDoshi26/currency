// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'latest_rates_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LatestRatesModel _$LatestRatesModelFromJson(Map<String, dynamic> json) =>
    LatestRatesModel(
      disclaimer: json['disclaimer'] as String,
      license: json['license'] as String,
      timestamp: json['timestamp'] as int,
      base: json['base'] as String,
      rates: (json['rates'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(k, (e as num).toDouble()),
      ),
    );

Map<String, dynamic> _$LatestRatesModelToJson(LatestRatesModel instance) =>
    <String, dynamic>{
      'disclaimer': instance.disclaimer,
      'license': instance.license,
      'timestamp': instance.timestamp,
      'base': instance.base,
      'rates': instance.rates,
    };
