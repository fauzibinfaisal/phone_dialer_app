# Phone Dialer App

Simple Flutter MethodChannel example for opening phone dialer.

Supports:
- Android Kotlin
- iOS Swift

---

# Video Records

## IOS
https://github.com/user-attachments/assets/8b63b20e-2323-4bb8-a33c-70b6cef78ea9

## Android


https://github.com/user-attachments/assets/a14feabd-d461-4980-84ae-3a1d1a3997f8



# Features

- Open phone dialer
- Native bridge communication

---


# Flutter ↔ Native Call Flow

Simple communication flow using `MethodChannel`.

```text
Flutter UI
   ↓
MethodChannel ("call_bridge")
   ↓
Native Platform
   ├── Android Kotlin
   │      ↓
   │   Intent.ACTION_DIAL
   │
   └── iOS Swift
          ↓
       tel:// URL Scheme
```

---

# Flutter Side

Flutter sends request to native:

```dart
await platform.invokeMethod(
  'makeCall',
  {
    'phoneNumber': '+62876543321',
  },
);
```

Method:
- `makeCall`

Parameter:
- `phoneNumber`

---

# Android Side (Kotlin)

Android receives method call:

```kotlin
if (call.method == "makeCall")
```

Extract phone number:

```kotlin
val phoneNumber =
    call.argument<String>("phoneNumber")
```

Open dialer:

```kotlin
Intent.ACTION_DIAL
```

---

# iOS Side (Swift)

iOS receives method call:

```swift
if call.method == "makeCall"
```

Extract phone number:

```swift
let phoneNumber = args["phoneNumber"]
```

Open phone app:

```swift
tel://
```

---

# Result

Flutter can communicate with:
- Android native Kotlin
- iOS native Swift

using:
- `MethodChannel`

---


# Run

```bash
flutter pub get
flutter run
```
