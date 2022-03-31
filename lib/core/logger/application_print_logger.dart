import 'dart:developer';

class ApplicationPrintLogger {
  static const String _LOG_INFO = "_LOG_INFO";
  static const String _LOG_WARNING = "_LOG_WARNING";
  static const String _LOG_DANGER = "_LOG_DANGER";
  static const String _LOG_SUCCESS = "_LOG_SUCCESS";

  static s(String success, {String name = _LOG_SUCCESS, Object? error, StackTrace? stackTrace}) {
    log('\x1B[32m$success\x1B[0m', time: DateTime.now(), name: name, error: error, stackTrace: stackTrace);
  }

  static i(String info, {String name = _LOG_INFO, Object? error, StackTrace? stackTrace}) {
    log('\x1B[36m$info\x1B[0m', time: DateTime.now(), name: name, error: error, stackTrace: stackTrace);
  }

  static w(String warning, {String name = _LOG_WARNING, Object? error, StackTrace? stackTrace}) {
    log('\x1B[33m$warning\x1B[0m', time: DateTime.now(), name: name, error: error, stackTrace: stackTrace);
  }

  static d(String danger, {String name = _LOG_DANGER, Object? error, StackTrace? stackTrace}) {
    log('\x1B[31m$danger\x1B[0m', time: DateTime.now(), name: name, error: error, stackTrace: stackTrace);
  }
}