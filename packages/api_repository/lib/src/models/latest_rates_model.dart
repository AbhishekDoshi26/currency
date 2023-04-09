import 'package:json_annotation/json_annotation.dart';

part 'latest_rates_model.g.dart';

/// Model used for response of Latest Rates API
@JsonSerializable()
class LatestRatesModel {
  LatestRatesModel({
    required this.disclaimer,
    required this.license,
    required this.timestamp,
    required this.base,
    required this.rates,
  });

  /// Factory constructor that converts [json] into [LatestRatesModel] object
  factory LatestRatesModel.fromJson(Map<String, dynamic> json) =>
      _$LatestRatesModelFromJson(json);

  /// Disclaimer present in the API response
  final String disclaimer;

  /// License Information present in the API response
  final String license;

  /// Timestamp when the data was last updated
  final int timestamp;

  /// Base currency for the rates
  final String base;

  /// Exchange Rates with base currency as [base].
  /// It is `Map<String,double>` and looks something like:
  /// ```
  /// {
  ///   'AED':0.27,
  ///   'USD':1,
  /// }
  /// ```
  final Map<String, double> rates;

  /// Method that converts [LatestRatesModel] instance into Json format
  Map<String, dynamic> toJson() => _$LatestRatesModelToJson(this);
}
