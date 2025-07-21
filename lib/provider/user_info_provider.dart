import 'package:changisha/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:ipf_flutter_starter_pack/services.dart';

class UserInfoProvider extends ChangeNotifier {
  static UserInfoProvider of(BuildContext context) =>
      UserInfoProvider.of(context);

  // General loading state for fetches
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  //setup user info
  UserModel? _userModel;
  UserModel get usermodel => _userModel!;

  Future<void> getUserInfo() async {
    try {
      _setLoading(true);
      notifyListeners();
      AppUtility.log("Fetching User info...");
      await Future.delayed(const Duration(seconds: 3));

      _userModel = UserModel(
        fullName: 'Danford Chris',
        phoneNumber: '255699500156',
        dateOfBirth: '12-01-2012',
        occupation: 'Engineer',
        street: 'Makuti',
        maritalStatus: 1,
        gender: 1,
      );

      notifyListeners();
    } catch (e) {
      AppUtility.log("Failed to fetch User info $e");
      throw Exception('Failed to fetch user Info');
    } finally {
      _setLoading(false);
      notifyListeners();
    }
  }

  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }
}
