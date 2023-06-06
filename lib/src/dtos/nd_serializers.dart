import 'package:built_value/serializer.dart';
import 'package:nd_authentications/src/dtos/dtos.dart';

part 'nd_serializers.g.dart';

@SerializersFor([
  NDUser,
])
final Serializers serializers = _$serializers;
