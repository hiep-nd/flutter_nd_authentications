import 'package:nd_authentications/src/dtos/nd_exception.dart';
import 'package:nd_authentications/src/services/storage/nd_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NDStorageImpl extends NDStorage {
  // NDStorage
  @override
  Future<String?> get(String key) async {
    return (await _storage).getString(key);
  }

  @override
  Future<void> set(String key, {String? value}) async {
    final storage = await _storage;
    if (value == null) {
      if (!(await storage.remove(key))) {
        throw _NDStorageImplException('Cannot remove key: \'$key\'');
      }
      return;
    }

    if (!(await storage.setString(key, value))) {
      throw _NDStorageImplException('Cannot setString with key: \'$key\'');
    }
  }

  // Privates
  late final _storage = SharedPreferences.getInstance();
}

class _NDStorageImplException extends NDException {
  const _NDStorageImplException(String message) : super(message: message);
}
