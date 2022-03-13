class Speaker {
  final String name;
  final String bio;
  final String? linkPhoto;

  Speaker({
    this.linkPhoto,
    required this.name,
    required this.bio,
  });

  factory Speaker.newInstance() {
    return Speaker(name: '', bio: '', linkPhoto: '');
  }
}
