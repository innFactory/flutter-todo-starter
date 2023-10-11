import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:core/core.dart';
import 'package:mocktail/mocktail.dart';
import 'package:network_info/network_info.dart';
import 'package:network_info/src/network_info_impl.dart';
import 'package:test/test.dart';

class MockConnectivity extends Mock implements Connectivity {}

// ignore: long-method
void main() {
  late NetworkInfo networkInfo;
  late MockConnectivity mockConnectivity;

  setUp(() {
    mockConnectivity = MockConnectivity();
    networkInfo = NetworkInfoImpl(connectivity: mockConnectivity);
  });

  group('onlineOrFailure', () {
    test(
      'should return Right<Unit> when there is a connection',
      () async {
        //* arrange
        final tHasConnectionFuture = Future.value(ConnectivityResult.wifi);

        when(mockConnectivity.checkConnectivity)
            .thenAnswer((_) => tHasConnectionFuture);
        //* act
        final result = await networkInfo.onlineOrFailure.run();
        //* assert
        verify(mockConnectivity.checkConnectivity);
        expect(result, const Right<Failure, Unit>(unit));
      },
    );

    test(
      'should return Left<OfflineFailure> when there is no connection',
      () async {
        //* arrange
        final tHasConnectionFuture = Future.value(ConnectivityResult.none);

        when(mockConnectivity.checkConnectivity)
            .thenAnswer((_) => tHasConnectionFuture);
        //* act
        final result = await networkInfo.onlineOrFailure.run();
        //* assert
        verify(mockConnectivity.checkConnectivity);
        expect(result, const Left<Failure, Unit>(OfflineFailure()));
      },
    );
  });
}
