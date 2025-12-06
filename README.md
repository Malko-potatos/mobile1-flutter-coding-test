# Mobile Laser Pointer (Rsupport Assignment)

모바일 기기(Android/iOS)의 센서를 이용하여 PC(Windows/macOS) 화면의 포인터를 제어하는 **원격 레이저 포인터 애플리케이션**입니다.

> **플랫폼 지원:** 모바일(Android/iOS), PC(Windows/macOS)만 지원하며, 웹(Web) 플랫폼은 지원하지 않습니다.

## 목차 (Table of Contents)

- [Architecture & Tech Stack](#architecture--tech-stack)
- [시작하기 (Getting Started)](#시작하기-getting-started)
- [프로젝트 구조 (Project Structure)](#프로젝트-구조-project-structure)
- [기능 및 폴더 설명](#기능-및-폴더-설명)
- [주의사항 (Notes)](#주의사항-notes)
- [AI와 인간의 역할 분담](#ai와-인간의-역할-분담)
- [개발 이력](#개발-이력)
- [문서 (Documents)](#문서-documents)

---

## Architecture & Tech Stack

유지보수성과 확장성을 고려하여 **Feature-First MVVM + Repository** 패턴을 적용했습니다.

### Tech Stack
- **Framework:** Flutter 3.38.4 (고정, Visual Studio 2026 호환성)
- **State Management:** **Riverpod** (비동기 스트림 처리 및 DI)
- **Routing:** **GoRouter** (플랫폼별 자동 분기 처리)
- **Network:** UDP (Low Latency Data Transmission)
- **Platform Control:** `window_manager` (Desktop), `sensors_plus` (Mobile)

### Architecture Overview
```mermaid
graph LR
    subgraph Mobile [Mobile Sender]
        S[Sensor Stream] -->|Filter| VM_S[Sender VM]
        VM_S -->|Data| Repo_S[UDP Repository]
    end

    Repo_S -.->|Network| Repo_R

    subgraph Desktop [PC Receiver]
        Repo_R[UDP Repository] -->|Stream| VM_R[Receiver VM]
        VM_R -->|State| UI[Transparent Window]
    end
```

---

## 시작하기 (Getting Started)

이 프로젝트를 로컬 환경에서 실행하기 위한 방법입니다.

### 전제 조건 (Prerequisites)

- [Flutter SDK](https://docs.flutter.dev/get-started/install) **Version 3.38.4 (필수, Visual Studio 2026 호환성)**
- Android Studio 또는 VS Code
- 테스트를 위한 모바일 기기 (Android/iOS) 및 PC (Windows/macOS)
- **중요:** 모바일 기기와 PC는 **동일한 Wi-Fi 네트워크**에 접속해 있어야 합니다.

### 설치 (Installation)

프로젝트 클론 후 의존성 패키지를 설치합니다.

```bash
flutter pub get
```

코드 생성이 필요한 경우 (Freezed, Riverpod Generator 등):

```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

### 실행 방법 (How to Run)

본 프로젝트는 하나의 코드베이스로 Mobile(송신)과 Desktop(수신)을 모두 처리합니다.

#### 1. PC Receiver (수신부) 실행

먼저 PC에서 애플리케이션을 실행하여 수신 대기 상태로 만듭니다.

```bash
# macOS
flutter run -d macos

# Windows
flutter run -d windows
```

- 앱이 실행되면 현재 PC의 IP 주소가 화면에 표시됩니다 (또는 설정 메뉴 확인).
- 방화벽 경고가 뜨는 경우, **네트워크 액세스 허용**을 해야 합니다.

#### 2. Mobile Sender (송신부) 실행

모바일 기기에서 애플리케이션을 실행합니다.

```bash
# 연결된 디바이스 확인
flutter devices

# 디바이스 선택 후 실행
flutter run -d <device_id>
```

- 앱 실행 후, PC 화면에 표시된 IP 주소를 입력하거나 QR 코드를 스캔하여 연결합니다.
- 연결이 완료되면 스마트폰을 움직여 PC의 포인터를 제어할 수 있습니다.

---

## 프로젝트 구조 (Project Structure)

Feature-First 아키텍처에 따라 기능별로 디렉토리를 구분했습니다.

```
lib/
├── main.dart                # 앱 진입점 (Entry Point)
│
├── core/                    # 공통 유틸리티 및 설정
│   ├── constants/           # 상수 값 (포트 번호, 타임아웃 등)
│   │   └── app_constants.dart
│   ├── router/              # GoRouter 설정 (플랫폼 분기 처리)
│   │   └── app_router.dart
│   ├── theme/               # 앱 테마 및 스타일
│   │   └── app_theme.dart
│   ├── network/             # 네트워크 관련 유틸리티
│   └── errors/              # 에러 처리 및 핸들러
│
├── domain/                  # 도메인 모델 (공유 엔티티)
│   └── models/
│       └── laser_packet.dart  # UDP 패킷 데이터 모델
│
└── features/                # 핵심 기능 모듈
    ├── sender/              # [Mobile] 송신 기능 관련
    │   ├── data/            # UDP 전송 로직
    │   │   └── sender_repository.dart
    │   └── presentation/    # 모바일 UI 화면 및 ViewModel
    │       ├── views/       # 화면 위젯
    │       ├── viewmodels/  # 상태 관리 (Riverpod)
    │       ├── widgets/     # 재사용 가능한 위젯
    │       └── constants/   # 화면별 상수
    │
    └── receiver/            # [PC] 수신 기능 관련
        ├── data/            # UDP 수신 및 패킷 파싱
        │   └── receiver_repository.dart
        └── presentation/    # PC 오버레이 UI 및 ViewModel
            ├── views/       # 화면 위젯
            ├── viewmodels/  # 상태 관리 (Riverpod)
            ├── widgets/     # 재사용 가능한 위젯
            └── constants/   # 화면별 상수
```

---

## 기능 및 폴더 설명

각 주요 폴더 및 기능에 대한 상세 설명입니다.

### 1. Features/Sender (Mobile)

모바일 기기에서 실행되는 로직입니다.

- **Sensor Logic:** `sensors_plus` 패키지를 사용하여 자이로스코프 및 가속도계 데이터를 수집합니다.
- **Data Filtering:** 센서 데이터의 노이즈를 제거하고 이동 좌표로 변환합니다.
- **UDP Client:** 변환된 좌표 데이터를 UDP 패킷으로 PC에 전송합니다.
- **UI:** IP 주소 입력, QR 코드 스캔, 터치패드 제어 화면을 제공합니다.

### 2. Features/Receiver (PC)

PC(Desktop) 환경에서 실행되는 로직입니다.

- **UDP Server:** 특정 포트(50051)를 열어 모바일로부터 데이터를 수신합니다.
- **Window Control:** `window_manager`를 통해 배경이 투명한 오버레이 윈도우를 생성하고 "Always on Top" 상태를 유지합니다.
- **Rendering:** 수신된 좌표에 맞춰 화면에 레이저 포인터 UI를 그립니다.
- **QR Code:** 현재 PC의 IP 주소를 QR 코드로 표시하여 모바일 연결을 용이하게 합니다.

### 3. Core & Domain

- **GoRouter:** 앱 실행 시 `Platform.isAndroid || Platform.isIOS` 여부를 체크하여 자동으로 `/sender` 또는 `/receiver` 라우트로 이동시킵니다.
- **Network:** UDP 통신의 지연 시간을 최소화하기 위한 로직이 포함되어 있습니다.
- **Domain Models:** `LaserPacket`과 같은 공유 데이터 모델을 정의합니다.

---

## 주의사항 (Notes)

개발 및 빌드 시 다음 사항을 유의해 주세요.

### 1. 네트워크 환경

- UDP 통신 특성상 **동일 네트워크(같은 Wi-Fi)** 환경이 필수입니다.
- **방화벽(Firewall):** Windows/macOS의 방화벽이 들어오는 UDP 패킷을 차단할 수 있습니다. 앱 실행 시 네트워크 권한을 허용하거나 방화벽 설정을 확인하세요.
- **포트 충돌:** 기본 설정된 포트(50051)가 이미 사용 중이라면 `lib/core/constants/app_constants.dart`에서 포트 번호를 변경해야 합니다.

### 2. 플랫폼 권한 (Permissions)

- **macOS:**
  - `macos/Runner/DebugProfile.entitlements` 및 `Release.entitlements` 파일에 `com.apple.security.network.client` 및 `com.apple.security.network.server` 권한이 추가되어 있어야 합니다.
- **Windows:**
  - 방화벽에서 UDP 포트(50051)에 대한 인바운드 연결을 허용해야 합니다.
- **Android:**
  - 센서 사용을 위한 권한은 보통 자동으로 처리되나, `AndroidManifest.xml`에 인터넷 권한(`<uses-permission android:name="android.permission.INTERNET"/>`)이 필수입니다.

### 3. Flutter & Package 버전

- 본 프로젝트는 **Flutter 3.38.4 (고정 버전)**을 사용합니다. Visual Studio 2026과의 호환성을 위해 이 버전으로 고정되어 있습니다.
- 다른 Flutter 버전에서는 호환성 문제가 발생할 수 있으므로 반드시 3.38.4 버전을 사용해 주세요.
- `pubspec.yaml`의 주요 패키지(`riverpod`, `go_router`) 버전 업데이트 시 Breaking Change에 유의하세요.

### 4. 코드 생성 (Code Generation)

- Freezed 및 Riverpod Generator를 사용하므로, 모델이나 Provider 변경 후에는 다음 명령어를 실행해야 합니다:

```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

---

## AI와 인간의 역할 분담

본 프로젝트는 AI 코딩 어시스턴트(Cursor)와 인간 개발자 간의 협업을 통해 개발되었습니다. AI가 자동으로 적용하는 규칙과 프롬프트를 명시하여 일관된 코드 품질을 유지합니다.

### AI의 역할

AI 코딩 어시스턴트는 다음 규칙들을 자동으로 적용하여 코드를 작성하고 리팩토링합니다:

#### 1. 문서화 규칙 (Documentation Rules)

**트리거**: "document code", "add dart doc", "주석 달아줘", `/doc` 명령어 사용 시

**규칙 파일**: `.cursor/commands/docs.md`

- **언어**: 항상 한국어로 작성 (명시적 요청 시 제외)
- **문법**: `///` (triple slashes) 사용, `/** ... */` 사용 금지
- **요약 문장**: 첫 문장은 간결하고 독립적인 요약으로 마침표로 끝남
- **문체**:
  - 함수/메서드: 3인칭 동사로 시작 (예: "계산합니다...", "업데이트합니다...")
  - 변수/속성: 명사구로 시작 (예: "현재 너비는...")
  - 불린 값: "~인지 여부" 형식 선호 (예: "화면이 켜져 있는지 여부입니다.")
- **참조**: 대괄호 `[...]`로 매개변수, 변수, 클래스, 예외 링크
- **마크다운**: 코드 키워드나 값은 백틱 사용 (예: `true`, `null`)

#### 2. 에러 처리 및 Null Safety 규칙

**트리거**: 비즈니스 로직, Repository, 에러 처리 코드 작성 시

**규칙 파일**: `.cursor/commands/error.md`

- **엄격한 Null Safety**:
  - `!` (bang operator) 사용 금지 (수학적으로 null이 아님을 증명할 수 있는 경우 제외)
  - `late` 키워드 지양, nullable 타입 또는 `AsyncValue` 사용
  - 필수 매개변수는 `required` 사용
- **예외 계층 구조**:
  - 일반 `Exception()` 또는 `Error()` 던지기 금지
  - 도메인별 커스텀 예외 정의 (`AppException` 확장)
  - 예: `NetworkException`, `SensorException`, `ValidationException`
  - Repository 레이어에서 3rd-party 에러를 캐치하여 커스텀 예외로 래핑
- **전역 에러 처리**:
  - UI 위젯에서 임시 `try-catch-print` 블록 사용 금지
  - Riverpod 통합: `AsyncValue.guard(() => ...)` 사용
  - 미처리 에러는 전역 핸들러로 라우팅 (로깅 및 사용자 알림)

#### 3. 리팩토링 및 현대화 규칙

**트리거**: "/refactor", "clean up", "modernize", "코드 정리", "리팩토링", "분리해줘" 요청 시

**규칙 파일**: `.cursor/commands/refactor.md`

- **Dart 3.x 현대 문법**:
  - Switch Expressions 사용 (verbose `switch`/`if-else`를 간결한 표현식으로 변환)
  - Records 사용 (간단한 헬퍼 클래스 대신 `(double x, double y)` 형식)
  - `final`, `const`, `required` 엄격히 사용
- **상태 관리 (Riverpod v3 / Generator Style)**:
  - 수동 Provider 정의 금지 (`StateNotifierProvider` 또는 `Provider` 수동 정의 금지)
  - Generator 문법:
    - 함수 기반: 읽기 전용 값 (`@riverpod`)
    - 클래스 기반: 변경 가능한 상태 (extends `_$Name`)
  - 비동기: `AsyncNotifier`의 `build()`에서 `Future<T>` 반환
  - 비즈니스 로직은 Notifier에 유지, UI에 두지 않음
- **컴포넌트 모듈화**:
  - `build` 메서드가 50줄 이상이면 하위 위젯 추출
  - 추출된 위젯은 책임에 따라 명명 (예: `_StatusBadge`)
  - 위젯 분리: `widgets/` 폴더에 개별 파일로 이동
  - 위젯 내보내기: `widgets/widgets.dart` 생성하여 단일 진입점 제공
  - 상수 분리: `constants/` 폴더에 설명적인 클래스 이름 사용 (예: `ReceiverScreenConstants`)
  - 상수 내보내기: `constants/constants.dart` 생성하여 단일 진입점 제공
  - 구조: `features/{feature}/presentation/{widgets|constants|views}/` 패턴 따름

### 인간의 역할

- **아키텍처 설계**: 전체 시스템 구조 및 패턴 결정
- **비즈니스 로직 검토**: AI가 생성한 코드의 로직 정확성 검증
- **통합 테스트**: 실제 디바이스에서의 동작 확인
- **성능 최적화**: 병목 지점 식별 및 개선 방향 결정
- **규칙 정의**: AI가 따를 규칙 및 프롬프트 작성 및 업데이트



---

## 개발 이력

프로젝트 개발 과정에서 완료된 주요 작업들을 Story 단위로 정리한 문서입니다.

- [📜 Development History (개발 이력)](doc/HISTORY.md)

---

## 문서 (Documents)

프로젝트 상세 문서는 `doc/` 폴더 내에 위치합니다.

- [📜 Development History (개발 이력)](doc/HISTORY.md)
- [📋 Requirements Specification (요구사항 정의서)](doc/REQUIREMENTS.md)
- [⚙️ Functional Specifications (기능 명세서)](doc/FUNCTIONAL_SPEC.md)

