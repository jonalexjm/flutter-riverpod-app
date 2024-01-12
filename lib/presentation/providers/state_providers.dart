import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'state_providers.g.dart';

@riverpod
class Counter extends _$Counter {
  @override
  build() => 5;

  void increaseByOne() {
    print(state);
    state = state ?? 0 + 1;
    print(state);
  }
}
