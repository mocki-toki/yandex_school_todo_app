class StorageException implements Exception {
  StorageException(this.type);
  final StorageExceptionType type;
}

enum StorageExceptionType {
  duplicateItem,
  notFound,
  unexpected,
}
