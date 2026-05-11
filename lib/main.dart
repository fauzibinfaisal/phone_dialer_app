import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  HomePage({super.key});

  static const platform = MethodChannel('call_bridge');

  Future<void> makeCall(String phoneNumber) async {
    debugPrint("makeCall start");
    try {
      await platform.invokeMethod(
        'makeCall',
        {
          'phoneNumber': phoneNumber,
        },
      );
      debugPrint("makeCall finished");
    } on PlatformException catch (e) {
      debugPrint("Failed: ${e.message}");
      debugPrint("makeCall failed");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Call Bridge')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            makeCall('+62876543321');
          },
          child: const Text('Call'),
        ),
      ),
    );
  }
}