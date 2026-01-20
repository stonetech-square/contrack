import 'package:contrack/src/features/master_data/domain/usecase/watch_agencies_use_case.dart';
import 'package:contrack/src/features/master_data/domain/usecase/watch_ministries_use_case.dart';
import 'package:equatable/equatable.dart' show Equatable;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:contrack/src/core/database/database.dart';
import 'package:contrack/src/features/master_data/data/models/ministry_with_agency.dart';
import 'package:rxdart/rxdart.dart';

part 'master_data_event.dart';
part 'master_data_state.dart';
part 'master_data_bloc.freezed.dart';

@injectable
class MasterDataBloc extends Bloc<MasterDataEvent, MasterDataState> {
  final WatchAgenciesUseCase _watchAgenciesUseCase;
  final WatchMinistriesUseCase _watchMinistriesUseCase;

  MasterDataBloc(this._watchAgenciesUseCase, this._watchMinistriesUseCase)
    : super(const MasterDataState()) {
    on<MasterDataStarted>((event, emit) {
      add(const AgencySearchChanged(''));
      add(const MinistrySearchChanged(''));
    });

    on<AgencySearchChanged>(
      _onAgencySearchChanged,
      transformer: (events, mapper) {
        return events
            .debounceTime(const Duration(milliseconds: 300))
            .switchMap(mapper);
      },
    );

    on<MinistrySearchChanged>(
      _onMinistrySearchChanged,
      transformer: (events, mapper) {
        return events
            .debounceTime(const Duration(milliseconds: 300))
            .switchMap(mapper);
      },
    );
  }

  Future<void> _onAgencySearchChanged(
    AgencySearchChanged event,
    Emitter<MasterDataState> emit,
  ) async {
    emit(state.copyWith(isLoadingAgencies: true));
    await emit.forEach(
      _watchAgenciesUseCase(WatchAgenciesParams(query: event.query)),
      onData: (agencies) =>
          state.copyWith(agencies: agencies, isLoadingAgencies: false),
      onError: (error, st) =>
          state.copyWith(error: error.toString(), isLoadingAgencies: false),
    );
  }

  Future<void> _onMinistrySearchChanged(
    MinistrySearchChanged event,
    Emitter<MasterDataState> emit,
  ) async {
    emit(state.copyWith(isLoadingMinistries: true));
    await emit.forEach(
      _watchMinistriesUseCase(WatchMinistriesParams(query: event.query)),
      onData: (ministries) =>
          state.copyWith(ministries: ministries, isLoadingMinistries: false),
      onError: (error, st) =>
          state.copyWith(error: error.toString(), isLoadingMinistries: false),
    );
  }
}
