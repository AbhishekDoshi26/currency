part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();
}

class FetchLatestRates extends HomeEvent {
  const FetchLatestRates();

  @override
  List<Object?> get props => [];
}
