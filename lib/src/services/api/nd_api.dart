import 'package:nd_authentications/src/dtos/dtos.dart';
import 'package:nd_authentications/src/services/api/nd_firebase_api_impl.dart';

abstract class NDApi {
  // Phone
  Future<void> requestSmsOtpWithPhoneNumber(String value);
  Future<NDUser?> signInWithPhoneNumberAndSmsOtp(
      String phoneNumber, String smsOtp);

  // Email/Password
  Future<void> createUserWithEmailAndPassword(String email, String password);
  Future<NDUser?> signInWithEmailAndPassword(String email, String password);

  // Sign out
  Future<void> signOut();
}

extension NDFirebaseApi on NDApi {
  static NDApi create() => NDFirebaseApiImpl();
}
