import 'package:flutter/material.dart';
import 'package:nd_authentications/src/ui/authentication_page/nd_authentication_page_view_model.dart';
import 'package:nd_core_utils/nd_core_utils.dart';
import 'package:nd_keys_observer/nd_keys_observer.dart';
import 'package:nd_mvvm/nd_mvvm.dart';

class NDAuthenticationPage extends StatefulWidget {
  const NDAuthenticationPage({super.key});

  @override
  State<StatefulWidget> createState() => _NDAuthenticationPageState();
}

class _NDAuthenticationPageState extends NDViewModelOwnerState<
    NDAuthenticationPage, NDAuthenticationPageViewModel> {
  // NDViewModelOwnerState
  @override
  void initState() {
    super.initState();
    rViewModel?.didLoad();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: SafeArea(
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(hintText: 'Phone number'),
              controller: _phoneController,
            ),
            TextButton(
              onPressed: rViewModel?.submitPhoneNumber.map(
                (value) => () {
                  value(_phoneController.text);
                },
              ),
              child: Text('Send OTP'),
            ),
            TextField(
              decoration: const InputDecoration(hintText: 'Verification'),
              controller: _verificationController,
            ),
            TextButton(
              onPressed: rViewModel?.submitVerification.map(
                (value) => () {
                  value(_verificationController.text);
                },
              ),
              child: Text('Send Verification'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _disposableBag.dispose();
    super.dispose();
  }

  @override
  NDAuthenticationPageViewModel createViewModel() =>
      NDAuthenticationPageViewModel();

  @override
  void disposeViewModel(NDAuthenticationPageViewModel viewModel) =>
      viewModel.dispose();

  // Privates
  final _disposableBag = NDDisposableBag();
  late final _phoneController = NDTextEditingController()
    ..disposedBy(_disposableBag);
  late final _verificationController = NDTextEditingController()
    ..disposedBy(_disposableBag);
}
