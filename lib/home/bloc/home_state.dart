part of 'home_bloc.dart';

enum HomeStatus {
  initial,
  loading,
  loaded,
  savedSuccessfully,
  error,
}

class HomeState extends Equatable {
  const HomeState({
    required this.status,
    required this.favouriteCurrency,
    required this.currencies,
    this.latestRatesModel,
  });

  const HomeState.initial()
      : this(
          status: HomeStatus.initial,
          favouriteCurrency: const [],
          currencies: const {},
        );

  final HomeStatus status;
  final LatestRatesModel? latestRatesModel;
  final List<String> favouriteCurrency;
  final Map<String, String> currencies;

  HomeState copyWith({
    HomeStatus? status,
    LatestRatesModel? latestRatesModel,
    List<String>? favouriteCurrency,
    Map<String, String>? currencies,
  }) {
    return HomeState(
      status: status ?? this.status,
      latestRatesModel: latestRatesModel ?? this.latestRatesModel,
      favouriteCurrency: favouriteCurrency ?? this.favouriteCurrency,
      currencies: currencies ?? this.currencies,
    );
  }

  @override
  List<Object?> get props => [
        status,
        latestRatesModel,
        favouriteCurrency,
        currencies,
      ];
}
