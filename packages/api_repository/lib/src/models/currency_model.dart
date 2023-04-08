import 'dart:convert';

class CurrencyModel {
  static Map<String, String> fromJson(String str) =>
      Map.from(json.decode(str)).map((k, v) => MapEntry<String, String>(k, v));

  static String toJson(Map<String, String> data) => json
      .encode(Map.from(data).map((k, v) => MapEntry<String, dynamic>(k, v)));
}
