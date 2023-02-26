import 'package:flutter/material.dart';
import 'package:vcard_maintained/vcard_maintained.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'dart:convert';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Contact Card QR Generator"),
        ),
        body: QRGeneratorForm(),
      ),
    );
  }
}

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   String data = "";

//   final myController = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppStyle.primaryColor,
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Center(
//             child: QrImage(
//               data: data,
//               backgroundColor: Colors.white,
//               size: 300.0,
//             ),
//           ),
//           const SizedBox(
//             height: 24,
//           ),
//           Container(
//             width: 300.0,
//             child: TextField(
//               controller: myController,
//               textAlign: TextAlign.center,
//               style: const TextStyle(color: Colors.white),
//               decoration: const InputDecoration(
//                 hintText: "Enter the phone number.",
//                 filled: true,
//                 fillColor: AppStyle.textInputColor,
//                 border: InputBorder.none,
//               ),
//             ),
//           ),
//           const SizedBox(
//             height: 24.0,
//           ),
//           RawMaterialButton(
//             onPressed: () {
//               setState(() {
//                 data = myController.text;
//               });
//             },
//             fillColor: AppStyle.accentColor,
//             shape: const StadiumBorder(),
//             padding:
//                 const EdgeInsets.symmetric(horizontal: 36.0, vertical: 26.0),
//             child: const Text("Generate QR Code"),
//           )
//         ],
//       ),
//     );
//   }
// }

class QRGeneratorForm extends StatefulWidget {
  const QRGeneratorForm({super.key});

  @override
  State<QRGeneratorForm> createState() => _QRGeneratorFormState();
}

class _QRGeneratorFormState extends State<QRGeneratorForm> {
  final _formKey = GlobalKey<FormState>();
  String data = "";
  final nameController = TextEditingController();
  final surnameController = TextEditingController();
  final phoneNumberController = TextEditingController();
  var vCard = VCard();

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Container(
          margin: const EdgeInsets.all(10.0),
          child: Column(children: [
            QrImage(
              data: data,
              version: QrVersions.auto,
              size: 175,
            ),
            const SizedBox(
              height: 24,
            ),
            TextFormField(
              controller: phoneNumberController,
              decoration: const InputDecoration(hintText: "Phone number"),
            ),
            const SizedBox(
              height: 24,
            ),
            TextFormField(
              controller: nameController,
              decoration: const InputDecoration(hintText: "Name"),
            ),
            const SizedBox(
              height: 24,
            ),
            TextFormField(
              controller: surnameController,
              decoration: const InputDecoration(hintText: "Surname"),
            ),
            const SizedBox(
              height: 24,
            ),
            RawMaterialButton(
                fillColor: Colors.blue,
                padding: const EdgeInsets.all(2.0),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    setState(() {
                      vCard.firstName = nameController.text;
                      vCard.lastName = surnameController.text;
                      vCard.cellPhone = phoneNumberController.text;
                      data = vCard.getFormattedString();
                    });
                  }
                },
                child: const Text(
                  "Generate new QR code",
                  style: TextStyle(fontSize: 24, color: Colors.white),
                ))
          ]),
        ));
  }
}
