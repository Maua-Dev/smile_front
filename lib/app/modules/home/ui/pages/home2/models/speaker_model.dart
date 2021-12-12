class SpeakerModel {
  final String name;
  final String description;
  final String date;
  final String linkPhoto;

  SpeakerModel({
    required this.name,
    required this.description,
    required this.date,
    required this.linkPhoto,
  });

  factory SpeakerModel.newInstance() {
    return SpeakerModel(name: '', description: '', date: '', linkPhoto: '');
  }
}
