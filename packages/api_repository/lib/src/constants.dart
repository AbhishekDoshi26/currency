/// This class holds everything that is constant related to API service.
class ApiConstants {
  /// API URL for getting list of currencies.
  static const String _getListOfCurrenciesUrl =
      'https://openexchangerates.org/api/currencies.json';

  /// API URL for getting latest exchange rates.
  static const String _getLatestRatesUrl =
      'https://openexchangerates.org/api/latest.json?app_id=';

  /// Getter that returns API URL of list of currencies
  static String get getListOfCurrenciesUrl => _getListOfCurrenciesUrl;

  /// Method that returns API URL to fetch latest exchange rates.
  /// It takes [appId] as pararmeter of type [String].
  static String getLatestRatesUrl(String appId) => _getLatestRatesUrl + appId;
}
