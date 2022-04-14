import 'package:smile_front/app/modules/dashboard/domain/entities/faq.dart';
import 'package:smile_front/app/modules/dashboard/infra/datasources/faq_datasource_interface.dart';

import '../utils/mocks/faq_mock.dart';

class FaqDatasourceImpl extends FaqDatasourceInterface {
  @override
  Future<List<Faq>> getAllFaq() async {
    return await Future.value(faqMock);
  }
}
