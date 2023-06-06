import 'package:nd_authentications/src/services/storage/nd_storage_impl.dart';
import 'package:nd_authentications/src/services/storage/nd_storage_secure_impl.dart';

abstract class NDStorage {
  Future<void> set(String key, {String? value});
  Future<String?> get(String key);

  // Creator
  static NDStorage create() => NDStorageImpl();
  static NDStorage createSecure() => NDStorageSecureImpl();
}
