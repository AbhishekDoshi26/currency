part of 'home_bloc.dart';

enum HomeStatus {
  initial,
  loading,
  loaded,
  error,
}

class HomeState extends Equatable {
  const HomeState({
    required this.status,
    required this.favouriteCurrency,
    this.latestRatesModel,
  });

  const HomeState.initial()
      : this(
          status: HomeStatus.initial,
          favouriteCurrency: const [],
        );

  final HomeStatus status;
  final LatestRatesModel? latestRatesModel;
  final List<String> favouriteCurrency;

  HomeState copyWith({
    HomeStatus? status,
    LatestRatesModel? latestRatesModel,
    List<String>? favouriteCurrency,
  }) {
    return HomeState(
      status: status ?? this.status,
      latestRatesModel: latestRatesModel ?? this.latestRatesModel,
      favouriteCurrency: favouriteCurrency ?? this.favouriteCurrency,
    );
  }

  @override
  List<Object?> get props => [
        status,
        latestRatesModel,
        favouriteCurrency,
      ];
}
