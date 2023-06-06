import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:nd_authentications/src/dtos/nd_exception.dart';
import 'package:nd_authentications/src/services/storage/nd_storage.dart';
import 'package:nd_core_utils/nd_core_utils.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

class NDStorageSecureImpl extends NDStorage {
  // NDStorageSecureImpl

  // NDStorage
  @override
  Future<String?> get(String key) async {
    try {
      return (await _storage.read(key: await _getRealKey(key)));
    } on Exception catch (ex) {
      throw _NDStorageSecureImplException('Cannot get key: \'$key\'',
          cause: ex);
    }
  }

  @override
  Future<void> set(String key, {String? value}) async {
    await _storage.write(key: await _getRealKey(key), value: value);
  }

  // Privates
  final _storage = const FlutterSecureStorage();
  late final _prefs = SharedPreferences.getInstance();
  Future<String> _getId() async {
    const key = 'kNDStorageSecureImplId';
    final prefs = await _prefs;
    var value = prefs.getString(key);
    if (value == null) {
      value = const Uuid().v4();
      if ((await prefs.setString(key, value))) {
        throw const _NDStorageSecureImplException('Cannot set id');
      }
    }
    return value;
  }

  Future<String> _getRealKey(String key) async {
    return (await _getId()).map((value) => '${value}_$key');
  }
}

class _NDStorageSecureImplException extends NDException {
  const _NDStorageSecureImplException(String message, {Exception? cause})
      : super(message: message, cause: cause);
}
