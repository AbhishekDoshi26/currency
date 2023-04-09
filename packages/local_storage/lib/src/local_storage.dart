import 'package:shared_preferences/shared_preferences.dart';

/// This is the class responsible for handling local storage related stuff.
class LocalStorage {
  const LocalStorage();

  /// Object of [SharedPreferences] that will help us read and write data.
  /// This variable is static so that we don't have to initialise it everytime.
  ///
  static SharedPreferences? _sharedPreferences;

  /// Private method that is responsible for initialisign the SharedPreferences.
  ///
  Future<void> _initialise() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  /// This method fetches the favourite currency stored by the user.
  /// The return type of this method is `List<String>`.
  /// Example: `['AED','INR','USD']`
  /// However, if there are no favourite currency stored,
  /// this method will return empty list.
  ///
  /// NOTE: The favourite currency is stored with key `favouriteCurrency`.
  ///
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

  /// This method stores the list of favourite currencies
  /// into local storage.
  ///
  /// It takes a single parameter [favouriteCurrency] of type `List<String>`.
  /// This favourite currencies are the symbols of currencies
  /// like `AED`, `INR`, `USD`, etc.
  ///
  /// NOTE: The list of favourite currencies are stored with key `favouriteCurrency`.
  ///
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

  /// This method fetches the list of currencies stored by the API Repository.
  /// The return type of this method is `String`.
  /// However, if there are no currency stored,
  /// this method will return empty String.
  ///
  /// NOTE: The list of currency is stored with key `listOfCurrency`.
  ///
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

  /// This method stores the list of currencies coming from the API Repository
  /// into local storage.
  ///
  /// It takes a single parameter [listOfCurrency] of type String.
  ///
  /// NOTE: The list of currency is stored with key `listOfCurrency`.
  ///
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
}
