## Md Ashraful Kabir Ashik

## Flutter MVC Architectural With GetX And API Integration

A Flutter mobile application using **GetX** for state management,
designed with **MVC architecture**, and fully integrated with a RESTFUL **backend API**.


## 📦 Project Structure

```
lib/
├── core/                      # Global services, themes, constants
│   ├── api/                   # Your centralized API endpoints
│   ├── routes/                # Global route definitions using GetX
│   ├── services/              # Shared services (e.g., API, storage)
│   ├── themes/                # Theme & style configs
│   ├── utils/                 # Helper functions, extensions
│   ├── values/                # App config values & global variable
│   └── widgets/               # Reusable widgets across features
│
├── features/                  # Each feature/module is isolated here
│   ├── splash/
│   │   ├── controller/        # AuthController, LoginController
│   │   ├── model/             # LoginUserModel, etc.
│   │   ├── view/              # LoginPage, RegisterPage, etc.
│   │   └── bindings.dart      # GetX Bindings for auth module
│   │
│   ├── .................more
│
└── main.dart                  # Entry point
```


### ● Technology Stack Used

- **Framework**: Flutter (Cross-platform for iOS & Android)
- **State Management**: GetX (reactive state management, dependency injection, route management)
- **Architecture**: MVC (Model-View-Controller)
- **HTTP Client**: http (or Dio if customized)
- **Environment Management**: flutter_dotenv
- **Other Key Packages**:
    - flutter_native_splash (Native splash screen)
    - flutter_launcher_icons (App icon generation)
    - change_app_package_name (Change Android/iOS package name)
    - rename_app (Rename application name)

### ● How to Run the Project (iOS/Android)

- **Android** flutter run --debug   # or --release
- **iOS (requires macOS and Xcode) flutter run --debug   # or --release**
- **Run on specific device flutter devices                # List connected devices**
- **flutter run -d <device-id>**
- **Build APK/AAB**flutter build apk --release
- **flutter build appbundle --release**
- **Build iOS IPABashflutter build ios --release**