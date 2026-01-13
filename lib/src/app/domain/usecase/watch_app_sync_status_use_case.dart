import 'package:contrack/src/app/domain/repository/app_repository.dart';
import 'package:contrack/src/core/sync/app_sync_status.dart';
import 'package:contrack/src/core/usecase/usecase.dart';
import 'package:injectable/injectable.dart';

@injectable
class WatchAppSyncStatusUseCase
    implements UseCase<Stream<AppSyncStatus>, NoParams> {
  final AppRepository _repository;

  WatchAppSyncStatusUseCase(this._repository);

  @override
  Stream<AppSyncStatus> call(NoParams params) => _repository.syncStatus;
}
