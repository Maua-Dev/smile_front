// ignore_for_file: constant_identifier_names

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
}
