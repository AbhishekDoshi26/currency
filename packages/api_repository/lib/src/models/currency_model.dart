import 'dart:convert';

class CurrencyModel {
  Map<String, String> currencyModelFromJson(String str) =>
      Map.from(json.decode(str)).map((k, v) => MapEntry<String, String>(k, v));

  String currencyModelToJson(Map<String, String> data) => json
      .encode(Map.from(data).map((k, v) => MapEntry<String, dynamic>(k, v)));
}
