import 'failures.dart';

class DatasourceError implements Failures {
  final String message;
  DatasourceError({required this.message});
}
