import 'package:todo_app/core/domain/domain.dart';

class IntToRevisionConvertor implements JsonConverter<Revision, int> {
  const IntToRevisionConvertor();

  @override
  Revision fromJson(int value) {
    return Revision(value);
  }

  @override
  int toJson(Revision revision) => revision.value;
}
