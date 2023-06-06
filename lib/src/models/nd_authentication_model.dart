import 'package:nd_authentications/src/dtos/dtos.dart';
import 'package:built_collection/built_collection.dart';

abstract class NDAuthenticationModel {
  NDUser? get activeUser;
  BuiltList<NDUser> get loggedUsers;

  // Phone
  Future<void> requestSmsOtpWithPhoneNumber(String value);
  Future<bool> signInWithPhoneNumberAndSmsOtp(
      String phoneNumber, String smsOtp);

  // Email/Password
  Future<void> createUserWithEmailAndPassword(String email, String password);
  Future<bool> signInWithEmailAndPassword(String email, String password);

  // Sign out
  Future<void> signOut();
}
