import 'package:json_annotation/json_annotation.dart';

part 'latest_rates_model.g.dart';

@JsonSerializable()
class LatestRatesModel {
  LatestRatesModel({
    required this.disclaimer,
    required this.license,
    required this.timestamp,
    required this.base,
    required this.rates,
  });

  factory LatestRatesModel.fromJson(Map<String, dynamic> json) =>
      _$LatestRatesModelFromJson(json);

  final String disclaimer;
  final String license;
  final int timestamp;
  final String base;
  final Map<String, double> rates;

  Map<String, dynamic> toJson() => _$LatestRatesModelToJson(this);
}
