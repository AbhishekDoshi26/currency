part of 'home_bloc.dart';

enum HomeStatus {
  initial,
  loading,
  loaded,
  savedSuccessfully,
  dataLoaded,
  error,
}

class HomeState extends Equatable {
  const HomeState({
    required this.status,
    required this.favouriteCurrency,
    required this.currencies,
    required this.searchedCurrencies,
    required this.conversionRate,
    this.latestRatesModel,
  });

  const HomeState.initial()
      : this(
          status: HomeStatus.initial,
          favouriteCurrency: const [],
          currencies: const {},
          searchedCurrencies: const {},
          conversionRate: '',
        );

  final HomeStatus status;
  final LatestRatesModel? latestRatesModel;
  final List<String> favouriteCurrency;
  final Map<String, String> currencies;
  final Map<String, String> searchedCurrencies;
  final String conversionRate;

  HomeState copyWith({
    HomeStatus? status,
    LatestRatesModel? latestRatesModel,
    List<String>? favouriteCurrency,
    Map<String, String>? currencies,
    Map<String, String>? searchedCurrencies,
    String? conversionRate,
  }) {
    return HomeState(
      status: status ?? this.status,
      latestRatesModel: latestRatesModel ?? this.latestRatesModel,
      favouriteCurrency: favouriteCurrency ?? this.favouriteCurrency,
      currencies: currencies ?? this.currencies,
      searchedCurrencies: searchedCurrencies ?? this.searchedCurrencies,
      conversionRate: conversionRate ?? this.conversionRate,
    );
  }

  @override
  List<Object?> get props => [
        status,
        latestRatesModel,
        favouriteCurrency,
        currencies,
        searchedCurrencies,
        conversionRate,
      ];
}
