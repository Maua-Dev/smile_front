import 'package:smile_front/app/modules/dashboard/domain/entities/faq.dart';
import 'package:smile_front/app/modules/dashboard/domain/repositories/faq_repository_interface.dart';
import 'package:smile_front/app/modules/dashboard/infra/datasources/faq_datasource_interface.dart';

class FaqRepositoryImpl extends FaqRepositoryInterface {
  final FaqDatasourceInterface datasource;

  FaqRepositoryImpl({required this.datasource});

  @override
  Future<List<Faq>> getAllFaq() async {
    final result = await datasource.getAllFaq();
    return result;
  }
}
