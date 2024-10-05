import 'package:flutter/material.dart';

class FollowProvider with ChangeNotifier {
  bool _isFollowing = false;

  bool get isFollowing => _isFollowing;

  void toggleFollow() {
    _isFollowing = !_isFollowing;
    notifyListeners();
  }
}
