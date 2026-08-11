of the selected workplace to successfully check in.
## Pyramids

Pyramids is a Flutter workforce attendance app for employees to log in, check in, check out, and review attendance history using live location verification.

## What the app does

- Secure login and sign up
- Location-based check in and check out
- Active attendance timer during a session
- Monthly attendance history
- Daily attendance details
- Error handling through Cubit states and snack bars

## Main screens

- Login
- Sign Up
- Home
- Check Out
- Monthly Reports
- Daily Reports
- Location Permission
- Successful checkout screen

## Core features

### Authentication

- Email and password login
- Account creation
- Live password rules during input
- Confirm password validation while typing

### Attendance

- Check in from the selected workplace
- Check out when the shift ends
- Timer while checked in
- Request guard to avoid duplicate checkout calls
- Location permission handling

### Reports

- Monthly attendance summary
- Recent attendance logs
- Daily attendance detail view
- Present, absent, and weekend styling

## API and state management

The app uses `dio` for HTTP requests and `flutter_bloc` Cubits for state management.

Repositories return `Either<String, Model>` values using `dartz`, which keeps success and failure handling clean in the UI.

## Project structure

```text
lib/
├── Core/
│   ├── Features/
│   │   ├── Auth/
│   │   │   ├── Data/
│   │   │   │   ├── Models/
│   │   │   │   └── Repo/
│   │   │   └── Presentation/
│   │   │       ├── Cubit/
│   │   │       └── View/
│   │   ├── Attendance/
│   │   │   ├── Data/
│   │   │   │   ├── Models/
│   │   │   │   └── Repo/
│   │   │   └── Presentation/
│   │   │       ├── Cubit/
│   │   │       └── View/
│   │   └── Reports/
│   │       ├── Data/
│   │       │   ├── Models/
│   │       │   └── Repo/
│   │       └── Presentation/
│   │           ├── Cubit/
│   │           └── View/
│   ├── Navigation/
│   └── helper/
└── main.dart
```

## Technology stack

- Flutter
- Dart
- flutter_bloc
- dio
- dartz
- json_serializable
- flutter_screenutil
- flutter_spinkit
- geolocator
- permission_handler

## App flow

```text
Login -> Home -> Check In -> Timer -> Check Out -> Successful Screen -> Monthly Reports -> Daily Reports
```

The monthly reports screen is shown from the bottom navigation history tab, while the home screen handles attendance actions based on the current Cubit state.

## Setup

```bash
flutter pub get
dart run build_runner build --delete-conflicting-outputs
flutter run
```

## Notes

- The app uses `ScreenUtil` for responsive layouts.
- The attendance flow depends on device location services being enabled.
- JSON models are generated with `json_serializable`.

## Developer

Mohammed Elgammal

1. Requests location permission.
2. Gets the user's current GPS coordinates.
3. Gets the coordinates of the selected workplace.
4. Calculates the distance between the two locations.
5. Checks whether the employee is within the allowed radius.

```text
User Location
      │
      ▼
Calculate Distance
      │
      ▼
Distance ≤ 900m?
   │          │
  YES         NO
   │          │
   ▼          ▼
Check In    Reject
```

---

## 🎨 UI Design

The application uses a modern enterprise-focused design with:

- Dark navy branding
- Indigo primary actions
- Rounded cards
- Clean typography
- Location-focused UI
- Responsive layouts using flutter_screenutil

### Primary Color

```text
#4B42DB
```

### Background Color

```text
#1B1B4B
```

---

## 🚀 Getting Started

### 1. Clone the repository

```bash
git clone <repository-url>
```

### 2. Navigate to the project

```bash
cd pyramids
```

### 3. Install dependencies

```bash
flutter pub get
```

### 4. Generate JSON serialization files

If using json_serializable:

```bash
dart run build_runner build --delete-conflicting-outputs
```

### 5. Run the application

```bash
flutter run
```

---

## 📦 Main Dependencies

Some of the main packages used in the project:

```text
flutter_bloc

dio
dartz
json_annotation
flutter_screenutil
flutter_spinkit
```

---

## 🔒 Location Permission

The application requires access to the user's device location to perform workplace verification.

Location is used specifically for attendance validation.

---

## 📌 Future Improvements

Potential future improvements include:

- Attendance history
- Monthly attendance statistics
- Push notifications
- Leave management
- Multiple workplace management
- Admin dashboard
- Offline attendance handling
- Improved location spoofing detection
- Attendance analytics

---

## 👨‍💻 Developer

Mohammed Elgammal

Flutter Developer
