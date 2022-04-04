// ignore_for_file: constant_identifier_names

class EnvironmentConfig {
  static const MSS_USER_BASE_URL = String.fromEnvironment('MSS_USER_BASE_URL',
      defaultValue:
          'https://76jdrw8lbe.execute-api.us-east-1.amazonaws.com/dev/smile-mss-cognito');
  static const MSS_ACTIVITIES_BASE_URL = String.fromEnvironment(
      'MSS_ACTIVITIES_BASE_URL',
      defaultValue:
          'http://lb-1268416342.us-east-1.elb.amazonaws.com/smile_mss_activities');
  static const S3_BASE_URL = String.fromEnvironment('S3_BASE_URL',
      defaultValue:
          'https://smile2022-frontend-assets.s3.sa-east-1.amazonaws.com/');
}
