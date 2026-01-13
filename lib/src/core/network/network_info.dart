import 'package:injectable/injectable.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

abstract class NetworkInfo {
  Stream<InternetStatus> get onStatusChange;
  Future<bool> get isConnected;
}

@LazySingleton(as: NetworkInfo)
class NetworkInfoImpl implements NetworkInfo {
  final InternetConnection _internetConnection;

  NetworkInfoImpl() : _internetConnection = InternetConnection();

  @override
  Stream<InternetStatus> get onStatusChange =>
      _internetConnection.onStatusChange;

  @override
  Future<bool> get isConnected => _internetConnection.hasInternetAccess;
}
