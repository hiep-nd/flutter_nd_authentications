import 'package:flutter/material.dart';
import 'package:nd_authentications/nd_authentications.dart';

class ExamplePage extends StatelessWidget {
  final NDAuthentication authentication;
  const ExamplePage({super.key, required this.authentication});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Authentication Examples')),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              TextButton(
                onPressed: () async {
                  final user = await authentication.request(context);
                  debugPrint('Logged in user: ${user?.displayName ?? 'null'}');
                },
                child: const Text('Request Authenticate'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
