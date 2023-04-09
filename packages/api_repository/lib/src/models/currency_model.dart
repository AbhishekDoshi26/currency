import 'dart:convert';

/// Model used for the list of currencies
class CurrencyModel {
  /// Converts [str] to Map<String,String>
  static Map<String, String> fromJson(String str) =>
      Map.from(json.decode(str)).map((k, v) => MapEntry<String, String>(k, v));

  /// Converts [data] to String
  static String toJson(Map<String, String> data) => json
      .encode(Map.from(data).map((k, v) => MapEntry<String, dynamic>(k, v)));
}
