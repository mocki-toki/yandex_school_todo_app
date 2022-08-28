import 'package:core_domain/core_domain.dart';

abstract class ServerRequest<T> extends DataProvidable<T> {
  const ServerRequest({
    super.element,
    super.list,
  });
}
