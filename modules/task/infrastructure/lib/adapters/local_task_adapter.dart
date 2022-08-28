import 'dart:convert';

import 'package:task_domain/task_domain.dart';
import 'package:task_infrastructure/task_infrastructure.dart';

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
