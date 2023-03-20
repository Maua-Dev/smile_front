import 'package:smile_front/app/modules/dashboard/domain/repositories/user_repository_interface.dart';
import 'package:smile_front/app/shared/models/responsible_professor_model.dart';

abstract class GetResponsibleProfessorsInterface {
  Future<List<ResponsibleProfessorModel>> call();
}

class GetResponsibleProfessorsList
    implements GetResponsibleProfessorsInterface {
  final UserRepositoryInterface repository;

  GetResponsibleProfessorsList({required this.repository});

  @override
  Future<List<ResponsibleProfessorModel>> call() async {
    return await repository.getResponsibleProfessors();
  }
}
