enum EnvironmentEnum { dev, prod }

extension EnvironmentEnumExtension on EnvironmentEnum {
  bool get isDevelop {
    switch (this) {
      case EnvironmentEnum.dev:
        return true;
      case EnvironmentEnum.prod:
        return false;
    }
  }
}
