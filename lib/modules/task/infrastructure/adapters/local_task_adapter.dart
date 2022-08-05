import 'dart:convert';

import 'package:todo_app/modules/task/domain/domain.dart';
import 'package:todo_app/modules/task/infrastructure/infrastructure.dart';

class LocalTaskAdapter extends TypeAdapter<LocalTask> {
  @override
  final typeId = 0;

  @override
  LocalTask read(BinaryReader reader) {
    final json = reader.readString();
    return LocalTask.fromJson(jsonDecode(json));
  }

  @override
  void write(BinaryWriter writer, LocalTask obj) {
    writer.writeString(jsonEncode(obj.toJson()));
  }
}
