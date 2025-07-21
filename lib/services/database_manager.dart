import 'package:ipf_flutter_starter_pack/bases.dart';

class DatabaseManager extends BaseDatabaseManager {
	DatabaseManager._(): super("changisha.db", 1, _tables);
	static final DatabaseManager _instance = DatabaseManager._();
	static DatabaseManager get instance => _instance;

	static List<BaseDatabaseModel> get _tables {
		return [
			
		];
	}
}