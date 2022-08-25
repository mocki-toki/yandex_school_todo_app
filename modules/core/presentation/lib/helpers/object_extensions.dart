import 'package:core_presentation/core_presentation.dart';

extension ObjectExtensions on Object {
  Logger getLogger() => Logger('$runtimeType');
}
