# Phone Dialer App

Simple Flutter MethodChannel example for opening phone dialer.

Supports:
- Android Kotlin
- iOS Swift

---

# Video Records


https://github.com/user-attachments/assets/8b63b20e-2323-4bb8-a33c-70b6cef78ea9



# Features

- Open phone dialer
- Native bridge communication

---

# Flutter Call

```dart
await repository.makeCall("+62876543321");
```

---

# Android

Uses:

```kotlin
Intent.ACTION_DIAL
```

No CALL_PHONE permission required.

---

# iOS

Uses:

```swift
tel://
```

---

# Run

```bash
flutter pub get
flutter run
```
