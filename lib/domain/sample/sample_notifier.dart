import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'sample_service.dart';
import 'sample_state.dart';

///UIとロジックの橋渡し
///UIに対する処理
final sampleNotifierProvider =
    StateNotifierProvider.autoDispose<SampleNotifier, SampleState>((ref) {
  return SampleNotifier(
    sampleService: ref.read(sampleService),
  )..init();
});

class SampleNotifier extends StateNotifier<SampleState> {
  SampleNotifier({
    required this.sampleService,
  }) : super(const SampleState());

  final SampleService sampleService;

  Future<void> init() async {
    // 通常のFutureのサンプル
    final sampleList = await sampleService.fetchSampleModelList();
    state = state.copyWith(
      sampleList: sampleList,
    );

    // AsyncValueのサンプル
    final futureSampleModelList = await sampleService.fetchSampleModelList();
    state = state.copyWith(
      futureSampleList: AsyncValue.data(futureSampleModelList),
    );
  }
}
