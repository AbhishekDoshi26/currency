import 'dart:convert';

import 'package:api_repository/api_repository.dart';
import 'package:api_repository/src/constants.dart';
import 'package:http/http.dart' as http;
import 'package:local_storage/local_storage.dart';

class ApiRepository {
  ApiRepository({
    required this.appID,
    required this.localStorage,
  });

  final String appID;
  final LocalStorage localStorage;

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
      final currency = await localStorage.getListOfCurrency();
      String responseData;
      if (currency.isEmpty) {
        final response =
            await http.get(Uri.parse(ApiConstants.getListOfCurrenciesUrl));
        responseData = response.body;
        localStorage.setListOfCurrency(listOfCurrency: responseData);
      } else {
        responseData = currency;
      }
      final listOfCurrencies = CurrencyModel.fromJson(responseData);
      return listOfCurrencies;
    } catch (e) {
      rethrow;
    }
  }
}
