import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:mocktail/mocktail.dart';
import 'package:network_info/src/network_info_impl.dart';
import 'package:test/test.dart';

class MockConnectivity extends Mock implements Connectivity {}

void main() {
  late NetworkInfoImpl networkInfo;
  late MockConnectivity mockConnectivity;

  setUp(() {
    mockConnectivity = MockConnectivity();
    networkInfo = NetworkInfoImpl(connectivity: mockConnectivity);
  });

  group('connectionStream', () {
    test(
      'should return [true,false] when ConnectivityResults are [wifi,none]',
      () {
        //* arrange
        final results = [
          ConnectivityResult.wifi,
          ConnectivityResult.none,
        ];
        final expected = Stream.fromIterable(results.sublist(1));

        when(() => mockConnectivity.checkConnectivity())
            .thenAnswer((_) async => results[0]);
        when(() => mockConnectivity.onConnectivityChanged)
            .thenAnswer((_) => expected);

        //* act
        final actual = networkInfo.connectionStream;

        //* assert
        expect(actual, emitsInOrder([true, false]));
      },
    );
  });

  group('isConnected', () {
    test(
      'should return true when ConnectivityResult is not ConnectivityResult.none',
      () async {
        //* arrange
        when(() => mockConnectivity.checkConnectivity())
            .thenAnswer((_) async => ConnectivityResult.wifi);

        //* act
        final actual = await networkInfo.isConnected;

        //* assert
        expect(actual, true);
      },
    );
  });

  group('connectivityResultToIsConnected', () {
    final results = {
      for (final trueResult in ConnectivityResult.values.where(
        (element) => element != ConnectivityResult.none,
      ))
        trueResult: true,
      ConnectivityResult.none: false,
    };

    for (final result in results.entries) {
      test(
        'should return ${result.value} for ${result.key.name}',
        () async {
          //* arrange
          final tHasConnectionFuture = Future.value(result.key);

          when(mockConnectivity.checkConnectivity)
              .thenAnswer((_) => tHasConnectionFuture);
          //* act
          final actual = await networkInfo.isConnected;
          //* assert
          verify(mockConnectivity.checkConnectivity).called(1);
          verifyNoMoreInteractions(mockConnectivity);
          expect(actual, result.value);
        },
      );
    }
  });
}
