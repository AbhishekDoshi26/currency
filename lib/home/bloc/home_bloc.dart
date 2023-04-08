import 'package:api_repository/api_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc({required this.apiRepository}) : super(const HomeState.initial()) {
    on<FetchLatestRates>(_onFetchLatestRates);
  }

  final ApiRepository apiRepository;

  Future<void> _onFetchLatestRates(
    FetchLatestRates event,
    Emitter<HomeState> emit,
  ) async {
    try {
      emit(state.copyWith(status: HomeStatus.loading));
      final latestRates = await apiRepository.fetchLatestRate();
      emit(state.copyWith(
        status: HomeStatus.loaded,
        latestRatesModel: latestRates,
      ));
    } catch (_) {
      emit(state.copyWith(status: HomeStatus.error));
    }
  }
}
