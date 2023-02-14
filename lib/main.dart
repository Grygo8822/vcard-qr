import 'package:flutter/material.dart';
import 'package:flutter_vcqr/ui/style/style.dart';
import 'package:qr_flutter/qr_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String data = "";

  final myController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyle.primaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: QrImage(
              data: data,
              backgroundColor: Colors.white,
              size: 300.0,
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          Container(
            width: 300.0,
            child: TextField(
              controller: myController,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                hintText: "Enter the phone number.",
                filled: true,
                fillColor: AppStyle.textInputColor,
                border: InputBorder.none,
              ),
            ),
          ),
          const SizedBox(
            height: 24.0,
          ),
          RawMaterialButton(
            onPressed: () {
              setState(() {
                data = myController.text;
              });
            },
            fillColor: AppStyle.accentColor,
            shape: const StadiumBorder(),
            padding:
                const EdgeInsets.symmetric(horizontal: 36.0, vertical: 26.0),
            child: const Text("Generate QR Code"),
          )
        ],
      ),
    );
  }
}
