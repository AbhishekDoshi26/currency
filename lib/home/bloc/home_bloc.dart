import 'package:api_repository/api_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:local_storage/local_storage.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc({
    required this.apiRepository,
    required this.localStorage,
  }) : super(const HomeState.initial()) {
    on<GetListOfCurrency>(_onGetListOfCurrency);
    on<GetLatestRates>(_onGetLatestRates);
    on<GetFavouriteCurrency>(_onGetFavouriteCurrency);
    on<UpdateFavouriteCurrency>(_onUpdateFavouriteCurrency);
    on<SaveFavouriteCurrency>(_onSaveFavouriteCurrency);
    on<SearchTextChanged>(_onSearchTextChanged);
  }

  final ApiRepository apiRepository;
  final LocalStorage localStorage;

  Future<void> _onGetListOfCurrency(
    GetListOfCurrency event,
    Emitter<HomeState> emit,
  ) async {
    try {
      emit(state.copyWith(status: HomeStatus.loading));
      final currencies = await apiRepository.getListOfCurrency();
      emit(
        state.copyWith(
          status: HomeStatus.loaded,
          currencies: currencies,
          searchedCurrencies: currencies,
        ),
      );
    } catch (_) {
      emit(state.copyWith(status: HomeStatus.error));
    }
  }

  Future<void> _onGetLatestRates(
    GetLatestRates event,
    Emitter<HomeState> emit,
  ) async {
    try {
      emit(state.copyWith(status: HomeStatus.loading));
      final latestRates = await apiRepository.getLatestRates();
      emit(state.copyWith(
        status: HomeStatus.dataLoaded,
        latestRatesModel: latestRates,
      ));
    } catch (_) {
      emit(state.copyWith(status: HomeStatus.error));
    }
  }

  Future<void> _onGetFavouriteCurrency(
    GetFavouriteCurrency event,
    Emitter<HomeState> emit,
  ) async {
    try {
      emit(state.copyWith(status: HomeStatus.loading));
      final favouriteCurrency = await localStorage.getFavouriteCurrency();
      emit(
        state.copyWith(
          status: HomeStatus.loaded,
          favouriteCurrency: favouriteCurrency,
        ),
      );
    } catch (_) {
      emit(state.copyWith(status: HomeStatus.error));
    }
  }

  Future<void> _onUpdateFavouriteCurrency(
    UpdateFavouriteCurrency event,
    Emitter<HomeState> emit,
  ) async {
    final List<String> favouriteCurrency = List.from(state.favouriteCurrency);

    if (!event.isSelected) {
      favouriteCurrency.add(event.currency);
    } else {
      favouriteCurrency.remove(event.currency);
    }
    emit(state.copyWith(favouriteCurrency: favouriteCurrency));
  }

  Future<void> _onSaveFavouriteCurrency(
    SaveFavouriteCurrency event,
    Emitter<HomeState> emit,
  ) async {
    try {
      emit(state.copyWith(status: HomeStatus.loading));
      await localStorage.setFavouriteCurrency(
          favouriteCurrency: state.favouriteCurrency);
      emit(state.copyWith(status: HomeStatus.savedSuccessfully));
    } catch (_) {
      emit(state.copyWith(status: HomeStatus.error));
    }
  }

  Future<void> _onSearchTextChanged(
    SearchTextChanged event,
    Emitter<HomeState> emit,
  ) async {
    final currencies = state.currencies;
    Map<String, String> searchedCurrencies = {};
    if (event.searchString.isNotEmpty) {
      currencies.forEach((key, value) {
        if (key.toLowerCase().contains(event.searchString.toLowerCase()) ||
            value.toLowerCase().contains(event.searchString.toLowerCase())) {
          searchedCurrencies.addAll({key: value});
        }
      });
    } else {
      searchedCurrencies = state.currencies;
    }
    emit(state.copyWith(searchedCurrencies: searchedCurrencies));
  }
}
