import 'package:flutter/foundation.dart';
import 'package:ipf_flutter_starter_pack/bases.dart';

class EnvHelper extends BaseEnvHelper {
  EnvHelper._();
  static final EnvHelper _instance = EnvHelper._();
  static EnvHelper get instance => _instance;

  static String get localUrl => BaseEnvHelper.read("LOCAL_URL")!;

  static String get stagingUrl => BaseEnvHelper.read("STAGING_URL")!;
}