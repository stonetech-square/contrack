import 'package:contrack/src/core/database/database.dart';
import 'package:contrack/src/core/usecase/usecase.dart';
import 'package:contrack/src/features/user_management/domain/repository/user_management_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class WatchUsersUseCase
    implements UseCase<Stream<List<User>>, WatchUsersParams> {
  final UserManagementRepository _repository;

  WatchUsersUseCase(this._repository);

  @override
  Stream<List<User>> call(WatchUsersParams params) {
    return _repository.watchUsers(searchQuery: params.searchQuery);
  }
}

class WatchUsersParams extends Equatable {
  final String? searchQuery;

  const WatchUsersParams({this.searchQuery});

  @override
  List<Object?> get props => [searchQuery];
}
