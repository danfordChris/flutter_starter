import 'package:changisha/starter_models/user_model.g.dart';

/// * ---------- Auto Generated Code ---------- * ///

class UserModel extends UserModelGen {
	UserModel({
		int? id,
		String? avator,
		String? fullName,
		String? phoneNumber,
		String? dateOfBirth,
		String? occupation,
		String? street,
		int? maritalStatus,
		int? gender
	}): super(id, avator, fullName, phoneNumber, dateOfBirth, occupation, street, maritalStatus, gender);

	factory UserModel.fromDatabase(Map<String, dynamic> map) {
		return UserModelGen.fromDatabase(map);
	}

	factory UserModel.fromJson(Map<String, dynamic> map) {
		return UserModelGen.fromJson(map);
	}

}