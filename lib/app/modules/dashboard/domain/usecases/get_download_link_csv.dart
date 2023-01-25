import 'package:smile_front/app/modules/dashboard/domain/repositories/activities_repository_interface.dart';

abstract class GetDownloadLinkCsvInterface {
  Future<String> call();
}

class GetDownloadLinkCsv implements GetDownloadLinkCsvInterface {
  final ActivitiesRepositoryInterface repository;

  GetDownloadLinkCsv({required this.repository});

  @override
  Future<String> call() {
    return repository.getDownloadLinkCsv();
  }
}
