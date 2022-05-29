import 'package:smile_front/app/modules/dashboard/domain/entities/certificate.dart';

class CertificateModel extends Certificate {
  CertificateModel({required String name, required String url})
      : super(name: name, url: url);

  static List<CertificateModel> fromMaps(List array) {
    List<CertificateModel> list = [];
    for (var e in array) {
      e.forEach(
        (key, value) =>
            list.add(CertificateModel(name: value['name'], url: value['link'])),
      );
    }

    return list;
  }

  CertificateModel copyWith({
    String? name,
    String? url,
  }) {
    return CertificateModel(
      name: name ?? this.name,
      url: url ?? this.url,
    );
  }

  factory CertificateModel.newInstance() {
    return CertificateModel(
      name: '',
      url: '',
    );
  }
}
