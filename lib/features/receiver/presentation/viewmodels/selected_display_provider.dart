import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:screen_retriever/screen_retriever.dart';

part 'selected_display_provider.g.dart';

/// 선택된 디스플레이를 관리하는 프로바이더입니다.
///
/// keepAlive를 사용하여 앱 실행 중 선택된 디스플레이가 유지됩니다.
@Riverpod(keepAlive: true)
class SelectedDisplayNotifier extends _$SelectedDisplayNotifier {
  @override
  Display? build() {
    // 기본값은 null (첫 번째 디스플레이 사용)
    return null;
  }

  /// 선택된 디스플레이를 업데이트합니다.
  void setDisplay(Display? display) {
    state = display;
  }
}

