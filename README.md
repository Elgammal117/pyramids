# Pyramids

A modern Flutter app for secure, location-based workforce attendance.

[![Flutter](https://img.shields.io/badge/Flutter-3.x-blue?logo=flutter)](https://flutter.dev)
[![Dart](https://img.shields.io/badge/Dart-3.x-blue?logo=dart)](https://dart.dev)

---

## Overview

Pyramids helps employees check in and out from their assigned workplace using GPS verification. Attendance is only accepted when the user is within a defined radius of the selected location.

## Features

- Secure login and registration
- Workplace selection
- Location permission and real-time GPS verification
- Attendance timer and checkout flow
- Attendance summary report

## Tech Stack

- Flutter
- Dart
- BLoC / Cubit
- Dio
- Dartz
- Flutter ScreenUtil

## Project Structure

```text
lib/
├── Core/
│   ├── Auth/
│   ├── Home/
│   ├── Attendance/
│   └── Report/
└── main.dart
```

## Getting Started

```bash
git clone <repository-url>
cd pyramids
flutter pub get
flutter run
```

## Developer

Mohammed Elgammal
Flutter Developer
