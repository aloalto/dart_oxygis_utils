part of dart_hydrologis_utils;


class HashUtilities {
  /// Generates a hash code for multiple [objects].
  static int hashObjects(Iterable objects) =>
      _finish(objects.fold(0, (h, i) => _combine(h, i.hashCode)));

  static int _combine(int hash, int value) {
    hash = 0x1fffffff & (hash + value);
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int _finish(int hash) {
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}