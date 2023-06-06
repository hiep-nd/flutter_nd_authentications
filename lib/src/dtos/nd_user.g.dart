// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nd_user.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<NDUser> _$nDUserSerializer = new _$NDUserSerializer();

class _$NDUserSerializer implements StructuredSerializer<NDUser> {
  @override
  final Iterable<Type> types = const [NDUser, _$NDUser];
  @override
  final String wireName = 'NDUser';

  @override
  Iterable<Object?> serialize(Serializers serializers, NDUser object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'displayName',
      serializers.serialize(object.displayName,
          specifiedType: const FullType(String)),
    ];

    return result;
  }

  @override
  NDUser deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new NDUserBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'displayName':
          result.displayName = serializers.deserialize(value,
              specifiedType: const FullType(String))! as String;
          break;
      }
    }

    return result.build();
  }
}

class _$NDUser extends NDUser {
  @override
  final String displayName;

  factory _$NDUser([void Function(NDUserBuilder)? updates]) =>
      (new NDUserBuilder()..update(updates))._build();

  _$NDUser._({required this.displayName}) : super._() {
    BuiltValueNullFieldError.checkNotNull(
        displayName, r'NDUser', 'displayName');
  }

  @override
  NDUser rebuild(void Function(NDUserBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NDUserBuilder toBuilder() => new NDUserBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NDUser && displayName == other.displayName;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, displayName.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'NDUser')
          ..add('displayName', displayName))
        .toString();
  }
}

class NDUserBuilder implements Builder<NDUser, NDUserBuilder> {
  _$NDUser? _$v;

  String? _displayName;
  String? get displayName => _$this._displayName;
  set displayName(String? displayName) => _$this._displayName = displayName;

  NDUserBuilder();

  NDUserBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _displayName = $v.displayName;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NDUser other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$NDUser;
  }

  @override
  void update(void Function(NDUserBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  NDUser build() => _build();

  _$NDUser _build() {
    final _$result = _$v ??
        new _$NDUser._(
            displayName: BuiltValueNullFieldError.checkNotNull(
                displayName, r'NDUser', 'displayName'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
