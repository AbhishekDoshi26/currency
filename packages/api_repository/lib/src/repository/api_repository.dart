import 'dart:convert';

import 'package:api_repository/api_repository.dart';
import 'package:api_repository/src/constants.dart';
import 'package:http/http.dart' as http;
import 'package:local_storage/local_storage.dart';

/// The main class for all the API related stuff.
/// It takes two parameters:
/// - String [appID] is the app id or api key for the currencies API.
/// - [localStorage] is the instance of [LocalStorage] class.
///
class ApiRepository {
  ApiRepository({
    required this.appID,
    required this.localStorage,
  });

  /// [appID] is the app id or api key for the currencies API.
  final String appID;

  /// [localStorage] is the instance of [LocalStorage] class.
  final LocalStorage localStorage;

  /// Used to get the latest rates for the currency conversion.
  /// The API URL is [ApiConstants.getLatestRatesUrl].
  /// This method returns an instance of [LatestRatesModel]
  ///
  Future<LatestRatesModel> getLatestRates() async {
    try {
      final response =
          await http.get(Uri.parse(ApiConstants.getLatestRatesUrl(appID)));
      final latestRates = LatestRatesModel.fromJson(json.decode(response.body));
      return latestRates;
    } catch (e) {
      rethrow;
    }
  }

  /// Used to fetch the get the list of currencies.
  /// The API URL is [ApiConstants.getListOfCurrenciesUrl].
  /// This method returns an instance of `Map<String,String>`
  ///
  /// As list of currencies never change,
  /// this method caches the list of currencies in [LocalStorage].
  ///
  /// Hence, if there is no data in local storage,
  /// this method fetches the list of currencies from the API
  /// and then stores in the device local storage.
  ///
  /// And therefore, next time, if there is data in local storage,
  /// it will just parse the data and return that cached data thereby reducing
  /// the API calls.
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
