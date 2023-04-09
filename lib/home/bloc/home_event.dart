part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();
}

class GetLatestRates extends HomeEvent {
  const GetLatestRates();

  @override
  List<Object?> get props => [];
}

class GetListOfCurrency extends HomeEvent {
  const GetListOfCurrency();

  @override
  List<Object?> get props => [];
}

class GetFavouriteCurrency extends HomeEvent {
  const GetFavouriteCurrency();

  @override
  List<Object?> get props => [];
}

class UpdateFavouriteCurrency extends HomeEvent {
  const UpdateFavouriteCurrency({
    required this.currency,
    required this.isSelected,
  });

  final String currency;
  final bool isSelected;

  @override
  List<Object?> get props => [
        currency,
        isSelected,
      ];
}

class SaveFavouriteCurrency extends HomeEvent {
  const SaveFavouriteCurrency();

  @override
  List<Object?> get props => [];
}
