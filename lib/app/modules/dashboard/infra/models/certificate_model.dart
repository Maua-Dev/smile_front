import 'package:smile_front/app/modules/dashboard/domain/entities/certificate.dart';

class CertificateModel extends Certificate {
  CertificateModel({required String name, required String url})
      : super(name: name, url: url);

  factory CertificateModel.fromMap(Map<String, dynamic> map) {
    return CertificateModel(name: map['activity'], url: map['url']);
  }

  static List<CertificateModel> fromMaps(List array) {
    return array.map((e) => CertificateModel.fromMap(e)).toList();
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
