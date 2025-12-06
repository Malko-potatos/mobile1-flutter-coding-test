import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:mobile1_flutter_coding_test/core/errors/app_exception.dart';

part 'global_error_handler.g.dart';

/// 전역 에러 핸들러를 제공합니다.
@Riverpod(keepAlive: true)
GlobalErrorHandler globalErrorHandler(Ref ref) {
  return GlobalErrorHandler();
}

/// 전역 에러 핸들러 클래스입니다.
///
/// Flutter 프레임워크나 Riverpod에서 발생한 에러를 처리합니다.
class GlobalErrorHandler {
  /// Flutter 프레임워크나 Riverpod에서 잡힌 에러를 처리합니다.
  void handleError(Object error, StackTrace? stackTrace) {
    if (error is AppException) {
      // 로그 기록 또는 분석 서버 전송
      debugPrint('App Exception: ${error.message} (Code: ${error.code})');
      if (error.originalError != null) {
        debugPrint('   Original Error: ${error.originalError}');
      }
    } else {
      // 알 수 없는 에러
      debugPrint('Unknown Error: $error');
      if (stackTrace != null) {
        debugPrintStack(stackTrace: stackTrace);
      }
    }
  }

  /// 사용자 친화적인 에러 메시지를 표시합니다 (SnackBar).
  void showErrorMessage(BuildContext context, Object error) {
    final message = _getErrorMessage(error);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  /// 에러 타입에 따라 사용자 친화적인 메시지를 반환합니다.
  String _getErrorMessage(Object error) {
    if (error is NetworkException) {
      return 'Connection lost. Please check your network.';
    } else if (error is SensorException) {
      return 'Sensor error: ${error.message}';
    } else if (error is ValidationException) {
      return error.message;
    } else if (error is AppException) {
      return error.message;
    } else {
      return 'An unexpected error occurred.';
    }
  }
}
