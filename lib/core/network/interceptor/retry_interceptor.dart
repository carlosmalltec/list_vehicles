import 'dart:io';

import 'package:appvehicles/core/logger/application_print_logger.dart';
import 'package:dio/dio.dart';

import 'dio_connectivity_request_retrier.dart';

class RetryOnConnectionChangeInterceptor extends Interceptor {
  final DioConnectivityRequestRetrier requestRetrier;

  RetryOnConnectionChangeInterceptor({required this.requestRetrier});

  @override
  Future onResponse(Response response, ResponseInterceptorHandler handler) async {
    Map<String, dynamic> _onResponse = {
      "METHOD": response.requestOptions.method,
      "PATH": response.requestOptions.path,
      "BASE_URL": response.requestOptions.baseUrl,
      "STATUS_CODE": response.statusCode,
      "STATUS_MESSAGE": response.statusMessage,
      "CONNECTIMEOUT": response.requestOptions.connectTimeout,
      "DATA": response.data != null && response.data.toString().length >= 50 ? response.data.toString().substring(1, 50) : "---",
      // "QUERY_PARAMETRES": response.request.queryParameters.toString() ?? null,
      // "HEADERS": response.headers.toString() ?? null,
      // "RESPONSE_TYPE": response.request.responseType.index ?? null,
    };
    ApplicationPrintLogger.s("$_onResponse", name: 'RESPONSE INTECEPTORS');
    return super.onResponse(response, handler);
    // return handler.next(response);
    // return super.onResponse(response, handler);
  }

  @override
  Future onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    Map<String, dynamic>? _data = options.data;
    Map<String, dynamic> _onRequest = {
      "METHOD": options.method,
      "PATH": options.path,
      "BASE_URL": options.baseUrl,
      "CONNECTIMEOUT": options.connectTimeout,
      "QUERY_PARAMETRES": options.queryParameters.toString(),
      "HEADERS": options.headers.toString(),
      "DATA": _data.toString(),
    };
    ApplicationPrintLogger.w("$_onRequest", name: 'REQUEST INTECEPTORS');
    return super.onRequest(options, handler);
    // return handler.next(options);
    // return super.onRequest(options, handler);
  }

  @override
  Future onError(DioError error, ErrorInterceptorHandler handler) async {
    Map<String, dynamic>? _data = error.requestOptions.data;
    Map<String, dynamic> _onError = {
      "METHOD": error.requestOptions.method,
      "PATH": error.requestOptions.path,
      "BASE_URL": error.requestOptions.baseUrl,
      "STATUS_CODE": error.response?.statusCode,
      "CONNECTIMEOUT": error.requestOptions.connectTimeout,
      "QUERY_PARAMETRES": error.requestOptions.queryParameters.toString(),
      "HEADERS": error.requestOptions.headers.toString(),
      "DATA": _data.toString(),
    };
    ApplicationPrintLogger.d("$_onError", name: 'ERROR INTECEPTORS');
    if (error.response?.statusCode == 401 && error.response?.statusMessage == 'Unauthorized') {
      /// DEPOIS IMPLEMENTAR O REFRESH LOGIN
      /// 1 - POSSO GRAVAR LOCAL O USUÁRIO E SENHA E CRIAR NOVA REQUEST
      /// 2 - USAR ALGUM ENDPOINT PARA RENOVAR O TOKEN
      await refreshToken();
      return error;
    }

    if (_shouldRetry(error)) {
      try {
        return requestRetrier.scheduleRequestRetry(error.requestOptions, handler);
      } catch (e) {
        return e;
      }
    }
    return super.onError(error, handler);
    // return handler.next(error);
  }

  bool _shouldRetry(DioError err) {
    return err.type == DioErrorType.other && err.error != null && err.error is SocketException;
  }
}

Future<void> refreshToken() async {}
