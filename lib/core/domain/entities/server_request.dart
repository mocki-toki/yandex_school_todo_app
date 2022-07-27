import 'package:todo_app/core/domain/domain.dart';

abstract class ServerRequest<T> extends DataProvidable<T> {
  const ServerRequest({
    super.element,
    super.list,
  });
}
