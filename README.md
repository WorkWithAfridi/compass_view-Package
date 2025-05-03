# 📍 compass_view

A customizable and lightweight Flutter package that provides beautiful compass UI components and direction/heading utilities out of the box. Designed for easy integration and scalability, this package makes it simple to build compass-based applications with minimal effort.

## ✨ Features

- 🔄 Real-time compass rotation with smooth animations.
- 🧭 Beautiful customizable compass painter widget.
- 📐 Heading/degree calculation with cardinal directions (N, NE, SW, etc).
- ⚠️ Built-in error handling with customizable `errorBuilder`.
- 🧱 Modular components for easy integration and reuse.

## Images/ Screenshots

![Demo Image](https://github.com/WorkWithAfridi/compass_view-Package/blob/master/assets/IMG_0348.PNG?raw=true)
![Demo Image](https://github.com/WorkWithAfridi/compass_view-Package/blob/master/assets/IMG_0349.PNG?raw=true)

## Video

## 📦 Installation

Add the following line to your `pubspec.yaml`:

```yaml
dependencies:
  compass_view: ^0.0.1 # replace with latest version
```

```bash
flutter pub get
```

## 🧑‍💻 Usage

🔁 Compass with Live Heading

```dart
import 'package:compass_view/compass_view.dart';

CompassHeading(
    textStyle: TextStyle(
        fontSize: 32, 
        fontWeight: FontWeight.bold, 
        color: Colors.black
    ),
),

```

🎨 Display the Compass Only (No Heading)

```dart
import 'package:compass_view/compass_view.dart';

CompassWidget(
  size: 100,
  backgroundColor: Colors.white,
  markerColor: Colors.black,
  textStyle: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black),
)

```

## ⚙️ Permissions
Ensure your app requests sensor permissions on Android and iOS.

Android
Add the following to AndroidManifest.xml:
```xml
<uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
<uses-feature android:name="android.hardware.sensor.compass" android:required="false" />
```

iOS
```xml
<key>NSLocationWhenInUseUsageDescription</key>
<string>This app uses your location to show compass heading.</string>
```

## 🙌 Contributing
Pull requests and suggestions are welcome! Please open issues to report bugs or feature requests.