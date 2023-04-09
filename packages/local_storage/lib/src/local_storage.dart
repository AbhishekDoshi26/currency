import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  const LocalStorage();

  static SharedPreferences? _sharedPreferences;

  Future<void> _initialise() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  Future<List<String>> getFavouriteCurrency() async {
    try {
      if (_sharedPreferences == null) {
        await _initialise();
      }
      final favouriteCurrency =
          _sharedPreferences!.getStringList('favouriteCurrency');

      return favouriteCurrency ?? [];
    } catch (_) {
      rethrow;
    }
  }

  Future<void> setFavouriteCurrency({
    required List<String> favouriteCurrency,
  }) async {
    try {
      if (_sharedPreferences == null) {
        await _initialise();
      }
      await _sharedPreferences!
          .setStringList('favouriteCurrency', favouriteCurrency);
    } catch (_) {
      rethrow;
    }
  }

  Future<void> setListOfCurrency({required String listOfCurrency}) async {
    try {
      if (_sharedPreferences == null) {
        await _initialise();
      }
      await _sharedPreferences!.setString('listOfCurrency', listOfCurrency);
    } catch (_) {
      rethrow;
    }
  }

  Future<String> getListOfCurrency() async {
    try {
      if (_sharedPreferences == null) {
        await _initialise();
      }
      final currency = _sharedPreferences!.getString('listOfCurrency');
      return currency ?? '';
    } catch (_) {
      rethrow;
    }
  }
}
