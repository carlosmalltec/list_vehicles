import 'package:appvehicles/core/logger/application_logger.dart';
import 'package:appvehicles/core/logger/application_print_logger.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import '../../constants/const_endpoint.dart';
import 'package:dio/dio.dart';

import 'interceptor/dio_connectivity_request_retrier.dart';
import 'interceptor/retry_interceptor.dart';
import 'network_request.dart';

class Network {
  Dio _client;

  Network(this._client) {
    BaseOptions options = BaseOptions(baseUrl: ENDPOINT);
    _client.options.sendTimeout = 1000 * 60 * 60;
    _client.options.connectTimeout = 1000 * 60 * 60;
    _client.options.receiveTimeout = 1000 * 60 * 60;
    _client.options.maxRedirects = 2;
    _client.options.responseType = ResponseType.json;
    _client.options.contentType = 'application/json;odata.metadata=minimal;odata.streaming=true';
    _client = Dio(options);

    _client.interceptors.add(
      RetryOnConnectionChangeInterceptor(
        requestRetrier: DioConnectivityRequestRetrier(
          dio: Dio(),
          connectivity: Connectivity(),
        ),
      ),
    );
  }

  Future<Response> get(String url, {NetworkRequest? body, NetworkRequest? headers, bool isAuth = true}) async {
    try {
      Map<String, dynamic> _headers = <String, dynamic>{};
      _headers = headers != null ? headers.toMap() : <String, dynamic>{};

      _headers[Headers.contentTypeHeader] = Headers.jsonContentType;
      _headers[Headers.acceptHeader] = Headers.jsonContentType;

      return await _client.get(
        Uri.encodeFull(url),
        options: Options(headers: _headers),
        queryParameters: body != null ? body.toMap() : {},
      );
    } on DioError catch (er) {
      ApplicationPrintLogger.d('ERROR: NETWORK STATUS CODE ===> ${er.response!.statusCode}');
      ApplicationPrintLogger.d('ERROR: NETWORK STATUS MESSAGE ===> ${er.response!.statusMessage}');
      ApplicationPrintLogger.d('ERROR: NETWORK TYPE ===> ${er.type}');
      var _statusCode = er.response?.statusCode?.toInt();
      var _statusMessage = er.response?.statusMessage.toString();
      var _data = er.response?.data ?? [];
      return Response(requestOptions: er.requestOptions, statusCode: _statusCode, statusMessage: _statusMessage, data: _data);
    }
  }
}
