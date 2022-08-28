import 'package:core_infrastructure/core_infrastructure.dart';

extension ObjectExtensions on Object {
  Logger getLogger() => Logger('$runtimeType');
}
