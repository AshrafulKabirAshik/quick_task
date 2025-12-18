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


## 🚀 Key Features

- ✅ **State Management**: GetX provides simple yet powerful reactive state management.
- ✅ **Architecture Pattern**: Organized using the **MVC** pattern to separate concerns:
  - **Model**: Handles data structure.
  - **View**: UI components and widgets.
  - **Controller**: Handles business logic, communicates with models, and updates views.
- ✅ **Backend Integration**: Easily connects to REST APIs using `http` package or other API clients.

## 🏐 Important Packages

- ✅ **Native Splash** https://pub.dev/packages/flutter_native_splash
  - dart run flutter_native_splash:create --path=flutter_native_splash.yaml
- ✅ **App Icon** https://pub.dev/packages/flutter_launcher_icons
  - dart run flutter_launcher_icons -f flutter_launcher_icons.yaml
- ✅ **Environment Variables** https://pub.dev/packages/flutter_dotenv
- ✅ **Change App Package Name** https://pub.dev/packages/change_app_package_name
- ✅ **Rename App** https://pub.dev/packages/rename_app

