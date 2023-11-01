// ignore_for_file: constant_identifier_names

import 'package:enum_to_string/enum_to_string.dart';

import 'environment_enum.dart';

class EnvironmentConfig {
  static const MSS_USER_BASE_URL = String.fromEnvironment(
    'MSS_USER_BASE_URL',
  );
  static const MSS_ACTIVITIES_BASE_URL = String.fromEnvironment(
    'MSS_ACTIVITIES_BASE_URL',
  );
  static const S3_BASE_URL = String.fromEnvironment(
    'S3_BASE_URL',
  );
  static const MSS_CERTIFICATE_BASE_URL = String.fromEnvironment(
    'MSS_CERTIFICATE_BASE_URL',
  );
  static const SPONSOR_FORM_REQUEST_URL = String.fromEnvironment(
    'SPONSOR_FORM_REQUEST_URL',
  );
  // ignore: non_constant_identifier_names
  static const ENV = String.fromEnvironment(
    'ENV',
  );

  static bool getConfig() {
    EnvironmentEnum value = stringToEnumMap(ENV);
    return value.isDevelop;
  }

  static EnvironmentEnum stringToEnumMap(String toMap) {
    EnvironmentEnum type = EnvironmentEnum.values.firstWhere((type) =>
        EnumToString.convertToString(type).toUpperCase() ==
        toMap.toUpperCase());
    return type;
  }
}
