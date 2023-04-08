import 'dart:convert';

import 'package:api_repository/api_repository.dart';
import 'package:api_repository/src/constants.dart';
import 'package:http/http.dart' as http;

class ApiRepository {
  ApiRepository({required this.appID});

  final String appID;

  Future<LatestRatesModel> getLatestRates() async {
    try {
      final response =
          await http.get(Uri.parse(ApiConstants.getLatestRatesUrl + appID));
      final latestRates = LatestRatesModel.fromJson(json.decode(response.body));
      return latestRates;
    } catch (e) {
      rethrow;
    }
  }

  Future<Map<String, String>> getListOfCurrency() async {
    try {
      final response =
          await http.get(Uri.parse(ApiConstants.getListOfCurrenciesUrl));
      final listOfCurrencies = CurrencyModel.fromJson(response.body);
      return listOfCurrencies;
    } catch (e) {
      rethrow;
    }
  }
}
