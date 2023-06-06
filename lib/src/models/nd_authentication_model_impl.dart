import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:nd_authentications/src/dtos/dtos.dart';
import 'package:nd_authentications/src/dtos/nd_serializers.dart';
import 'package:nd_authentications/src/models/nd_authentication_model.dart';
import 'package:nd_authentications/src/services/api/nd_api.dart';
import 'package:nd_authentications/src/services/storage/nd_storage.dart';
import 'package:nd_core_utils/nd_core_utils.dart';

class NDAuthenticationModelImpl extends NDAuthenticationModel {
  // NDAuthenticationModelImpl
  NDAuthenticationModelImpl(this._api, this._storage);

  // NDAuthenticationModel
  @override
  NDUser? get activeUser => _activeUser;

  @override
  BuiltList<NDUser> get loggedUsers => _loggedUsers;

  // Phone
  @override
  Future<void> requestSmsOtpWithPhoneNumber(String value) async {
    await _api.requestSmsOtpWithPhoneNumber(value);
  }

  @override
  Future<bool> signInWithPhoneNumberAndSmsOtp(
      String phoneNumber, String smsOtp) async {
    final usr = await _api.signInWithPhoneNumberAndSmsOtp(phoneNumber, smsOtp);
    if (usr == null) {
      return false;
    }

    _loggedUsers = _loggedUsers.insertLead(usr).toBuiltList();
    _activeUser = usr;
    _storage.set(_activeUserKey, value: usr.toJson());
    _storage.set(
      _loggedUsersKey,
      value: json.encode(serializers.serialize(_loggedUsers)),
    );
    return true;
  }

  // Email/Password
  @override
  Future<void> createUserWithEmailAndPassword(String email, String password) {
    throw UnimplementedError();
  }

  @override
  Future<bool> signInWithEmailAndPassword(String email, String password) {
    throw UnimplementedError();
  }

  // Sign out
  @override
  Future<void> signOut() async {
    await _api.signOut();
    _storage.set(_activeUserKey);
    _activeUser = null;
  }

  // Privates
  static const _loggedUsersKey = 'kNDAuthenticationModelLoggedUsers';
  static const _activeUserKey = 'kNDAuthenticationModelActiveUser';
  NDUser? _activeUser;
  BuiltList<NDUser> _loggedUsers = BuiltList();
  final NDApi _api;
  final NDStorage _storage;
}
