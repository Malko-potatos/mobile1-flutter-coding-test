/// 애플리케이션 특정 예외를 위한 기본 클래스입니다.
abstract class AppException implements Exception {
  /// 에러 메시지
  final String message;

  /// 에러 코드 (선택적)
  final String? code;

  /// 원본 에러 (선택적)
  final dynamic originalError;

  /// [AppException]을 생성합니다.
  AppException(
    this.message, {
    this.code,
    this.originalError,
  });

  @override
  String toString() => code != null ? '[$code] $message' : message;
}

/// 네트워크/소켓 작업 실패 시 발생하는 예외입니다.
class NetworkException extends AppException {
  /// [NetworkException]을 생성합니다.
  NetworkException({
    required String message,
    dynamic originalError,
  }) : super(
          message,
          code: 'NETWORK_ERR',
          originalError: originalError,
        );
}

/// 센서 초기화 또는 읽기 실패 시 발생하는 예외입니다.
class SensorException extends AppException {
  /// [SensorException]을 생성합니다.
  SensorException({
    required String message,
    dynamic originalError,
  }) : super(
          message,
          code: 'SENSOR_ERR',
          originalError: originalError,
        );
}

/// 입력 검증 실패 시 발생하는 예외입니다.
class ValidationException extends AppException {
  /// [ValidationException]을 생성합니다.
  ValidationException(String message)
      : super(message, code: 'VALIDATION_ERR');
}

