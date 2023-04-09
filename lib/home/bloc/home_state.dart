part of 'home_bloc.dart';

enum HomeStatus {
  initial,
  loading,
  loaded,

  /// This enum value is used when the currency is saved successfully.
  savedSuccessfully,

  /// This enum value is used when the initial data is loaded.
  dataLoaded,
  error,
}

class HomeState extends Equatable {
  /// Constructor for the [HomeState]
  const HomeState({
    required this.status,
    required this.favouriteCurrency,
    required this.currencies,
    required this.searchedCurrencies,
    this.latestRatesModel,
  });

  /// Method that sets the initial values to the [HomeState] parameters.
  const HomeState.initial()
      : this(
          status: HomeStatus.initial,
          favouriteCurrency: const [],
          currencies: const {},
          searchedCurrencies: const {},
        );

  /// Object that defines the present status.
  final HomeStatus status;

  /// Object that stores the latest rates fetched from the API Repository.
  final LatestRatesModel? latestRatesModel;

  /// Object that stores the list of favourite currency
  /// fetched from the local storage.
  final List<String> favouriteCurrency;

  /// Object that stores all the currencies fetched from the API Repository.
  final Map<String, String> currencies;

  /// Object that stores the searched currencies based on user search result.
  final Map<String, String> searchedCurrencies;

  /// Method used to return the instance of [HomeState].
  /// It will assign new values if they are not null and if they are null,
  /// it assigns the old values of the home state.
  HomeState copyWith({
    HomeStatus? status,
    LatestRatesModel? latestRatesModel,
    List<String>? favouriteCurrency,
    Map<String, String>? currencies,
    Map<String, String>? searchedCurrencies,
  }) {
    return HomeState(
      status: status ?? this.status,
      latestRatesModel: latestRatesModel ?? this.latestRatesModel,
      favouriteCurrency: favouriteCurrency ?? this.favouriteCurrency,
      currencies: currencies ?? this.currencies,
      searchedCurrencies: searchedCurrencies ?? this.searchedCurrencies,
    );
  }

  @override
  List<Object?> get props => [
        status,
        latestRatesModel,
        favouriteCurrency,
        currencies,
        searchedCurrencies,
      ];
}
