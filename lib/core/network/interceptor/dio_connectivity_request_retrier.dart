import 'dart:async';

import 'package:appvehicles/constants/const_endpoint.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';

class DioConnectivityRequestRetrier {
  final Dio dio;
  final Connectivity connectivity;

  DioConnectivityRequestRetrier({required this.dio, required this.connectivity});

  Future<Response?>? scheduleRequestRetry(RequestOptions requestOptions, ErrorInterceptorHandler handler) async {
    StreamSubscription? streamSubscription;
    final responseCompleter = Completer<Response>();

    streamSubscription = connectivity.onConnectivityChanged.listen(
      (connectivityResult) {
        if (connectivityResult != ConnectivityResult.none) {
          streamSubscription?.cancel();
          responseCompleter.complete(
            dio.request(
              ENDPOINT_PROD + requestOptions.path,
              cancelToken: requestOptions.cancelToken,
              data: requestOptions.data,
              onReceiveProgress: requestOptions.onReceiveProgress,
              onSendProgress: requestOptions.onSendProgress,
              queryParameters: requestOptions.queryParameters,
              options: Options(headers: requestOptions.headers),
            ),
          );
        }
      },
    );
    var _data = await responseCompleter.future;
    handler.resolve(Response(requestOptions: requestOptions, data: _data.data));
  }
}
