class Speaker {
  String? name;
  String? bio;
  String? linkPhoto;
  String? company;

  Speaker(
      {this.linkPhoto, required this.name, required this.bio, this.company});

  factory Speaker.newInstance() {
    return Speaker(name: '', bio: '', linkPhoto: '');
  }
}
