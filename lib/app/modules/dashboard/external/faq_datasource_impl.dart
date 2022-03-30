import 'package:smile_front/app/modules/dashboard/domain/entities/faq.dart';
import 'package:smile_front/app/modules/dashboard/infra/datasources/faq_datasource.dart';

import '../utils/faq_mock.dart';

class FaqDatasouceImpl extends FaqDatasource {
  @override
  Future<List<Faq>> getAllFaq() async {
    return faqMock;
  }
}
