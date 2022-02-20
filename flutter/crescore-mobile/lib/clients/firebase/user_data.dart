import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:crypto/crypto.dart';

class UserData {
  String get displayName => _user.displayName ?? _user.uid;

  String get uid => _user.uid;

  final User _user;

  String getPhotoUrl({int size = 24}) {
    var url = _user.photoURL;
    if (url != null) {
      return url;
    }

    var hash = md5.convert(utf8.encode(_user.email!)).toString();

    return "https://www.gravatar.com/avatar/$hash?s=$size&d=identicon";
  }

  UserData(this._user);
}
