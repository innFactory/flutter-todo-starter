import 'package:core/core.dart';
import 'package:network_info/network_info.dart';
import 'package:network_info/src/network_info_impl.dart';

final networkInfoProvider = Provider<NetworkInfo>(
  (ref) => NetworkInfoImpl(),
);
