import 'package:nd_core_utils/nd_core_utils.dart';
import 'package:nd_keys_observer/nd_keys_observer.dart';
import 'package:nd_mvvm/nd_mvvm.dart';

class NDAuthenticationPageViewModel extends NDViewModel
    implements NDDisposable {
  // NDAuthenticationPageViewModel
  final subject = NDSimpleSubject.create();

  // String? get phoneNumber => _phoneNumber;
  // String? get verification => _verification;
  bool? get phoneNumberVisble => _phoneNumberVisble;
  bool? get verificationVisible => _verificationVisible;

  void didLoad() {}

  Future<void> submitPhoneNumber(String value) async {}

  Future<void> submitVerification(String value) async {}

  // NDViewModel
  @override
  void didSetViewFromOldView(NDView? oldView) {}

  @override
  bool validateView(NDView view) => true;

  // NDDisposable

  @override
  void dispose() {
    subject.dispose();
  }

  @override
  bool get isDisposed => throw UnimplementedError();

  // Privates
  // String? _phoneNumber;
  // String? _verification;
  bool? _phoneNumberVisble;
  bool? _verificationVisible;
}
