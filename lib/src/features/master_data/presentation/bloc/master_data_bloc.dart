import 'package:contrack/src/features/master_data/domain/usecase/add_agency_use_case.dart';
import 'package:contrack/src/features/master_data/domain/usecase/add_ministry_use_case.dart';
import 'package:contrack/src/features/master_data/domain/usecase/delete_agency_use_case.dart';
import 'package:contrack/src/features/master_data/domain/usecase/delete_ministry_use_case.dart';
import 'package:contrack/src/features/master_data/domain/usecase/update_agency_use_case.dart';
import 'package:contrack/src/features/master_data/domain/usecase/update_ministry_use_case.dart';
import 'package:contrack/src/features/master_data/domain/usecase/watch_agencies_use_case.dart';
import 'package:contrack/src/features/master_data/domain/usecase/watch_ministries_use_case.dart';
import 'package:equatable/equatable.dart' show Equatable;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:contrack/src/core/database/database.dart';
import 'package:contrack/src/features/master_data/data/models/agency_with_ministry.dart';
import 'package:rxdart/rxdart.dart';

part 'master_data_event.dart';
part 'master_data_state.dart';
part 'master_data_bloc.freezed.dart';

@injectable
class MasterDataBloc extends Bloc<MasterDataEvent, MasterDataState> {
  final WatchMinistriesUseCase _watchMinistriesUseCase;
  final WatchAgenciesUseCase _watchAgenciesUseCase;
  final AddMinistryUseCase _addMinistryUseCase;
  final AddAgencyUseCase _addAgencyUseCase;
  final DeleteMinistryUseCase _deleteMinistryUseCase;
  final DeleteAgencyUseCase _deleteAgencyUseCase;
  final UpdateMinistryUseCase _updateMinistryUseCase;
  final UpdateAgencyUseCase _updateAgencyUseCase;

  MasterDataBloc(
    this._watchMinistriesUseCase,
    this._watchAgenciesUseCase,
    this._addMinistryUseCase,
    this._addAgencyUseCase,
    this._deleteMinistryUseCase,
    this._deleteAgencyUseCase,
    this._updateMinistryUseCase,
    this._updateAgencyUseCase,
  ) : super(const MasterDataState()) {
    on<MasterDataStarted>((event, emit) {
      add(const MinistrySearchChanged(''));
      add(const AgencySearchChanged(''));
    });

    on<MinistrySearchChanged>(
      _onMinistrySearchChanged,
      transformer: (events, mapper) {
        return events
            .debounceTime(const Duration(milliseconds: 300))
            .switchMap(mapper);
      },
    );

    on<AgencySearchChanged>(
      _onAgencySearchChanged,
      transformer: (events, mapper) {
        return events
            .debounceTime(const Duration(milliseconds: 300))
            .switchMap(mapper);
      },
    );

    on<MinistryAdded>(_onMinistryAdded);
    on<AgencyAdded>(_onAgencyAdded);
    on<MinistryDeleted>(_onMinistryDeleted);
    on<AgencyDeleted>(_onAgencyDeleted);
    on<MinistryUpdated>(_onMinistryUpdated);
    on<AgencyUpdated>(_onAgencyUpdated);
  }

  Future<void> _onMinistryAdded(
    MinistryAdded event,
    Emitter<MasterDataState> emit,
  ) async {
    try {
      await _addMinistryUseCase(
        AddMinistryParams(name: event.name, code: event.code),
      );
    } catch (e) {
      emit(state.copyWith(error: e.toString()));
    }
  }

  Future<void> _onAgencyAdded(
    AgencyAdded event,
    Emitter<MasterDataState> emit,
  ) async {
    try {
      await _addAgencyUseCase(
        AddAgencyParams(
          name: event.name,
          code: event.code,
          ministryId: event.ministryId,
          ministryRemoteId: event.ministryRemoteId ?? '',
        ),
      );
    } catch (e) {
      emit(state.copyWith(error: e.toString()));
    }
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

  Future<void> _onMinistryDeleted(
    MinistryDeleted event,
    Emitter<MasterDataState> emit,
  ) async {
    try {
      await _deleteMinistryUseCase(DeleteMinistryParams(event.ministry));
    } catch (e) {
      emit(state.copyWith(error: e.toString()));
    }
  }

  Future<void> _onAgencyDeleted(
    AgencyDeleted event,
    Emitter<MasterDataState> emit,
  ) async {
    try {
      await _deleteAgencyUseCase(DeleteAgencyParams(event.agency));
    } catch (e) {
      emit(state.copyWith(error: e.toString()));
    }
  }

  Future<void> _onMinistryUpdated(
    MinistryUpdated event,
    Emitter<MasterDataState> emit,
  ) async {
    try {
      await _updateMinistryUseCase(UpdateMinistryParams(event.ministry));
    } catch (e) {
      emit(state.copyWith(error: e.toString()));
    }
  }

  Future<void> _onAgencyUpdated(
    AgencyUpdated event,
    Emitter<MasterDataState> emit,
  ) async {
    try {
      await _updateAgencyUseCase(
        UpdateAgencyParams(event.agencyWithMinistry.agency),
      );
    } catch (e) {
      emit(state.copyWith(error: e.toString()));
    }
  }
}
