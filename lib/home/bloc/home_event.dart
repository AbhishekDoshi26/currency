part of 'home_bloc.dart';

/// Base Home Event
abstract class HomeEvent extends Equatable {
  const HomeEvent();
}

/// Event to Get the Latest Currency Exchange Rates
class GetLatestRates extends HomeEvent {
  const GetLatestRates();

  @override
  List<Object?> get props => [];
}

/// Event to Get the List of Currencies
class GetListOfCurrency extends HomeEvent {
  const GetListOfCurrency();

  @override
  List<Object?> get props => [];
}

/// Event to Get the List of Favourite Currencies
class GetFavouriteCurrency extends HomeEvent {
  const GetFavouriteCurrency();

  @override
  List<Object?> get props => [];
}

/// Event to Update the status of favourite currency.
/// It takes two parameters:
/// - [currency] : This is of type String and takes the currency symbol.
/// - [isSelected] : This is of type bool and the value
/// should be whether it is selected or not.
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

/// Event to Save the List of Favourite Currencies to local storage
class SaveFavouriteCurrency extends HomeEvent {
  const SaveFavouriteCurrency();

  @override
  List<Object?> get props => [];
}

/// Event to trigger the search functionality.
/// It takes a single param [searchString] of type [String].
class SearchTextChanged extends HomeEvent {
  const SearchTextChanged({required this.searchString});

  final String searchString;
  @override
  List<Object?> get props => [searchString];
}
