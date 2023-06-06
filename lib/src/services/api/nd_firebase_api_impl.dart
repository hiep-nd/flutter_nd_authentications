import 'package:firebase_auth/firebase_auth.dart';
import 'package:nd_authentications/src/dtos/dtos.dart';
import 'package:nd_authentications/src/services/api/nd_api.dart';
import 'package:nd_core_utils/nd_core_utils.dart';

class NDFirebaseApiImpl extends NDApi {
  // NDApi
  // Phone
  @override
  Future<void> requestSmsOtpWithPhoneNumber(String value) async {
    _waittingPhoneNumber = value;
    _confirmation = null;
    _confirmation = await FirebaseAuth.instance.signInWithPhoneNumber(value);
  }

  @override
  Future<NDUser?> signInWithPhoneNumberAndSmsOtp(
      String phoneNumber, String smsOtp) async {
    assert(phoneNumber == _waittingPhoneNumber);
    final cres = await _confirmation?.confirm(smsOtp);
    return cres?.map((value) =>
        NDUser((b) => b..displayName = value.user?.displayName ?? ''));
  }

  // Email/Password
  @override
  Future<void> createUserWithEmailAndPassword(
      String email, String password) async {
    throw UnimplementedError();
  }

  @override
  Future<NDUser?> signInWithEmailAndPassword(String email, String password) {
    throw UnimplementedError();
  }

  // Sign out
  @override
  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  // Privates
  String? _waittingPhoneNumber;
  ConfirmationResult? _confirmation;
}
