import 'dart:convert';

import 'package:api_repository/src/constants.dart';
import 'package:api_repository/src/models/latest_rates_model.dart';
import 'package:http/http.dart' as http;

class ApiRepository {
  ApiRepository({required this.appID});

  final String appID;

  Future<LatestRatesModel> fetchLatestRate() async {
    try {
      final response =
          await http.get(Uri.parse(ApiConstants.fetchLatestRatesUrl + appID));
      final latestRates = LatestRatesModel.fromJson(json.decode(response.body));
      return latestRates;
    } catch (e) {
      rethrow;
    }
  }
}
