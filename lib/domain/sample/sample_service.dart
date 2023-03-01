import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../infrastructure/model/sample/sample_model.dart';
import '../../infrastructure/repository/sample/sample_repository.dart';

///リポジトリから受け取ったデータを使ってロジックを書く
///notifierの階層に渡す
final sampleService = Provider.autoDispose(
  (ref) => SampleService(
    sampleRepository: ref.read(sampleRepository),
  ),
);

class SampleService {
  SampleService({
    required this.sampleRepository,
  });

  final SampleRepository sampleRepository;

  Future<List<SampleModel>> fetchSampleModelList() async {
    return sampleRepository.fetchSampleModelList();
  }
}
