class SponsorEmailModel {
  final String? companyName;
  final String? colabName;
  final String? email;
  final String? number;
  final String? cnpj;
  final String? sponsorType;
  final String? closureDate;

  SponsorEmailModel(
      {this.companyName,
      this.colabName,
      this.email,
      this.number,
      this.cnpj,
      this.sponsorType,
      this.closureDate});

  SponsorEmailModel copyWith(
      {String? companyName,
      String? colabName,
      String? email,
      String? number,
      String? cnpj,
      String? sponsorType,
      String? closureDate}) {
    return SponsorEmailModel(
      companyName: companyName ?? this.companyName,
      colabName: colabName ?? this.colabName,
      email: email ?? this.email,
      number: number ?? this.number,
      cnpj: cnpj ?? this.cnpj,
      sponsorType: sponsorType ?? this.sponsorType,
      closureDate: closureDate ?? this.closureDate,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['company_name'] = companyName;
    data['colab_name'] = colabName;
    data['email'] = email;
    data['number'] = number;
    data['cnpj'] = cnpj;
    data['sponsor_type'] = sponsorType;
    data['closure_date'] = '0';
    return data;
  }
}
