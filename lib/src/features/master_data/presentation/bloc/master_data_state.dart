part of 'master_data_bloc.dart';

@freezed
sealed class MasterDataState with _$MasterDataState {
  const factory MasterDataState({
    @Default([]) List<Agency> agencies,
    @Default([]) List<MinistryWithAgency> ministries,
    @Default(false) bool isLoadingAgencies,
    @Default(false) bool isLoadingMinistries,
    @Default(false) bool isSuccess,
    @Default(false) bool isError,
    String? error,
  }) = _MasterDataState;
}
