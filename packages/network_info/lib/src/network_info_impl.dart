import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:network_info/network_info.dart';

class NetworkInfoImpl implements NetworkInfo {
  NetworkInfoImpl({
    Connectivity? connectivity,
  }) : _connectivity = connectivity ?? Connectivity();

  final Connectivity _connectivity;

  @override
  Stream<bool> get connectionStream async* {
    yield await isConnected;
    yield* _connectivity.onConnectivityChanged
        .map(connectivityResultToIsConnected);
  }

  @override
  Future<bool> get isConnected async =>
      connectivityResultToIsConnected(await _connectivity.checkConnectivity());

  bool connectivityResultToIsConnected(ConnectivityResult result) =>
      result != ConnectivityResult.none;
}
