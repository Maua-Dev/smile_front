import 'package:smile_front/app/modules/home/infra/datasources/speakers_datasource_interface.dart';
import 'package:smile_front/app/modules/home/infra/models/home_speaker_model.dart';
import 'package:smile_front/app/modules/home/utils/mocks/speakers_mock.dart';

class SpeakersDatasourceImpl extends SpeakersDatasourceInterface {
  @override
  Future<List<HomeSpeakerModel>> getRectors() async {
    return await Future.value(speakersMock);
  }
}
