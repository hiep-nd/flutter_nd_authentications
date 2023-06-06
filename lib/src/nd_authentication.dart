import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:nd_authentications/src/dtos/dtos.dart';
import 'package:nd_authentications/src/nd_authentication_impl.dart';
import 'package:nd_authentications/src/services/services.dart';

abstract class NDAuthentication {
  // Logic
  Future<NDUser?> request(BuildContext context);

  // Configurations
  NDStorage Function()? storageBuilder;
  NDApi Function()? apiBuilder;
  NDUser? activeUser;

  // Creators
  static create() => NDAuthenticationImpl();
}
