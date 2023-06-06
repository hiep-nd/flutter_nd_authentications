import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:nd_authentications/src/dtos/nd_serializers.dart';

part 'nd_user.g.dart';

abstract class NDUser implements Built<NDUser, NDUserBuilder> {
  // Fields
  String get displayName;

  NDUser._();

  factory NDUser([void Function(NDUserBuilder) updates]) = _$NDUser;

  String toJson() {
    return json.encode(serializers.serializeWith(NDUser.serializer, this));
  }

  static NDUser fromJson(String jsonString) {
    return serializers.deserializeWith(
        NDUser.serializer, json.decode(jsonString))!;
  }

  static Serializer<NDUser> get serializer => _$nDUserSerializer;
}
