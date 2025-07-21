import 'package:changisha/models/user_model.dart';
import 'package:ipf_flutter_starter_pack/bases.dart';

/// * ---------- Auto Generated Code ---------- * ///

class UserModelGen extends BaseDatabaseModel {
	int? _id;
	String? _avator;
	String? _fullName;
	String? _phoneNumber;
	String? _dateOfBirth;
	String? _occupation;
	String? _street;
	int? _maritalStatus;
	int? _gender;
	
	UserModelGen(this._id, this._avator, this._fullName, this._phoneNumber, this._dateOfBirth, this._occupation, this._street, this._maritalStatus, this._gender, );

	int? get id => _id;
	String? get avator => _avator;
	String? get fullName => _fullName;
	String? get phoneNumber => _phoneNumber;
	String? get dateOfBirth => _dateOfBirth;
	String? get occupation => _occupation;
	String? get street => _street;
	int? get maritalStatus => _maritalStatus;
	int? get gender => _gender;
	
	set id(int? id) => this._id = id;
	set avator(String? avator) => this._avator = avator;
	set fullName(String? fullName) => this._fullName = fullName;
	set phoneNumber(String? phoneNumber) => this._phoneNumber = phoneNumber;
	set dateOfBirth(String? dateOfBirth) => this._dateOfBirth = dateOfBirth;
	set occupation(String? occupation) => this._occupation = occupation;
	set street(String? street) => this._street = street;
	set maritalStatus(int? maritalStatus) => this._maritalStatus = maritalStatus;
	set gender(int? gender) => this._gender = gender;
	

	static UserModel fromJson(Map<String, dynamic> map) {
		return UserModel(id: BaseModel.castToInt(map['id']), avator: map['avator'], fullName: map['fullName'], phoneNumber: map['phoneNumber'], dateOfBirth: map['dateOfBirth'], occupation: map['occupation'], street: map['street'], maritalStatus: BaseModel.castToInt(map['maritalStatus']), gender: BaseModel.castToInt(map['gender']), );
	}

	static UserModel fromDatabase(Map<String, dynamic> map) {
		return UserModel(id: BaseModel.castToInt(map['id']), avator: map['avator'], fullName: map['full_name'], phoneNumber: map['phone_number'], dateOfBirth: map['date_of_birth'], occupation: map['occupation'], street: map['street'], maritalStatus: BaseModel.castToInt(map['marital_status']), gender: BaseModel.castToInt(map['gender']), );
	}

	@override
	String get tableName => "user";

	@override
	Map<String, dynamic> get toMap {
		return { "id": id, "avator": avator, "full_name": fullName, "phone_number": phoneNumber, "date_of_birth": dateOfBirth, "occupation": occupation, "street": street, "marital_status": maritalStatus, "gender": gender, };
	}

	Map<String, dynamic> get toJson {
		return { "id": id, "avator": avator, "fullName": fullName, "phoneNumber": phoneNumber, "dateOfBirth": dateOfBirth, "occupation": occupation, "street": street, "maritalStatus": maritalStatus, "gender": gender, };
	}

	@override
	Map<String, String> get toSchema {
		return { "id": "INTEGER PRIMARY KEY", "avator": "TEXT", "full_name": "TEXT", "phone_number": "TEXT", "date_of_birth": "TEXT", "occupation": "TEXT", "street": "TEXT", "marital_status": "INTEGER", "gender": "INTEGER", };
	}

	UserModel merge(UserModel model) {
		return UserModel(
			id: model.id ?? this._id,
			avator: model.avator ?? this._avator,
			fullName: model.fullName ?? this._fullName,
			phoneNumber: model.phoneNumber ?? this._phoneNumber,
			dateOfBirth: model.dateOfBirth ?? this._dateOfBirth,
			occupation: model.occupation ?? this._occupation,
			street: model.street ?? this._street,
			maritalStatus: model.maritalStatus ?? this._maritalStatus,
			gender: model.gender ?? this._gender
		);
	}

	@override
	Map<String, Map<String, String>>? get dataRelation => null;

}