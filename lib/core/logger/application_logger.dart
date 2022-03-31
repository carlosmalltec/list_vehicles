import 'application_print_logger.dart';

class ApplicationLogger {
  // Sample of abstract logging function
  static void write(String text, {bool isError = false}) {
    Future.microtask(() => ApplicationPrintLogger.w('** $text. isError: [$isError]'));
  }
}
