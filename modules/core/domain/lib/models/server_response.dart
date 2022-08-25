import 'package:core_domain/core_domain.dart';

abstract class ServerResponse<T> extends DataProvidable<T> {
  const ServerResponse({
    required this.status,
    required this.revision,
    super.element,
    super.list,
  });

  final String status;
  @IntToRevisionConvertor()
  final Revision revision;
}
