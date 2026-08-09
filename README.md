# Pyramids – Workforce Attendance App

A Flutter-based workforce attendance application that allows employees to securely check in and check out from their assigned workplace based on their real-time location.

The application verifies that the employee is within a defined radius of the selected workplace before allowing them to register their attendance.

---

## 📱 Overview

Pyramids is an employee attendance management mobile application designed to simplify workplace check-in and check-out.

Employees can:

- Create an account
- Log in securely
- Select their workplace
- Grant location access
- Check in only when they are within the allowed workplace radius
- Track their active attendance session
- Check out when they finish work
- View their attendance report

---

## ✨ Features

### 🔐 Authentication

- User Login
- User Registration
- Secure password input
- Authentication API integration
- User profile retrieval

### 🏢 Workplace Selection

Employees can select their workplace from the available locations:

- New Cairo Headquarters
- Administrative Capital

The selected workplace is displayed on the Home screen.

### 📍 Location-Based Check-In

The application uses the device's current location to verify the employee's distance from the selected workplace.

The employee must be within:

```text
900 meters
```

of the selected workplace to successfully check in.

### ⏱️ Attendance Session

After a successful check-in:

- The attendance session starts
- A timer displays the current working duration
- The employee can check out when the session is finished

### 📊 Attendance Report

After checking out, the application provides a summary of the attendance session, including:

- Workplace
- Check-in time
- Check-out time
- Total working duration

---

## 🛠️ Technologies

- Flutter
- Dart
- BLoC / Cubit
- Dio
- REST API
- Dartz
- JSON Serializable
- Flutter ScreenUtil
- Geolocation / Location Services

---

## 🏗️ Architecture

The project follows a feature-based architecture with separation between presentation, data, repositories, and business logic.

```text
lib/
│
├── Core/
│   │
│   ├── Features/
│   │
│   ├── Auth/
│   │   ├── Data/
│   │   │   ├── Models/
│   │   │   └── Repo/
│   │   │
│   │   └── Presentation/
│   │       ├── Cubit/
│   │       └── View/
│   │
│   ├── Home/
│   │   └── Presentation/
│   │       ├── Cubit/
│   │       └── View/
│   │
│   ├── Attendance/
│   │   ├── Data/
│   │   │   ├── Models/
│   │   │   └── Repo/
│   │   │
│   │   └── Presentation/
│   │       ├── Cubit/
│   │       └── View/
│   │
│   ├── Report/
│   │   ├── Data/
│   │   │   ├── Models/
│   │   │   └── Repo/
│   │   │
│   │   └── Presentation/
│   │       ├── Cubit/
│   │       └── View/
│   │
│   └── helper/
│
└── main.dart
```

---

## 🔄 Application Flow

```text
             ┌──────────────┐
             │     Login    │
             └──────┬───────┘
                    │
                    ▼
             ┌──────────────┐
             │     Home     │
             └──────┬───────┘
                    │
                    ▼
          ┌────────────────────┐
          │ Select Workplace   │
          └─────────┬──────────┘
                    │
                    ▼
          ┌────────────────────┐
          │ Location Permission│
          └─────────┬──────────┘
                    │
                    ▼
          ┌────────────────────┐
          │ Check Distance     │
          │      ≤ 900m        │
          └─────────┬──────────┘
                    │
              ┌─────┴─────┐
              │           │
             NO          YES
              │           │
              ▼           ▼
          Show Error   Check In
                          │
                          ▼
                   ┌────────────┐
                   │   Timer    │
                   └─────┬──────┘
                         │
                         ▼
                   ┌────────────┐
                   │ Check Out  │
                   └─────┬──────┘
                         │
                         ▼
                   ┌────────────┐
                   │   Report   │
                   └────────────┘
```

---

## 🧠 State Management

The application uses Cubit from the Flutter BLoC package to manage application state.

For example, authentication states include:

```text
LoginInitial
Loading
LoginSuccess
LoginFailure
```

The UI reacts to these states using:

```dart
BlocConsumer<AuthCubit, AuthState>
```

This keeps the UI separate from the business logic.

---

## 🌐 API Integration

API requests are handled using Dio.

Repositories return results using Either from the Dartz package.

Example:

```dart
Future<Either<String, LoginModel>> login({
  required String email,
  required String password,
}) async {
  try {
    final response = await dio.post(
      'auth/login',
      data: {
        'email': email,
        'password': password,
      },
    );

    return right(
      LoginModel.fromJson(response.data),
    );
  } catch (e) {
    return left(
      handleDioException(e),
    );
  }
}
```

This provides two possible results:

```text
Left  → Error message
Right → Successful response model
```

---

## 📍 Location Validation

Before registering attendance, the application:

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
