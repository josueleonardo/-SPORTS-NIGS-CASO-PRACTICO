import 'dart:io';

//import 'package:flutter/foundation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner_plus/qr_code_scanner_plus.dart';
import 'package:turn_page_transition/turn_page_transition.dart';

import 'mainScreen.dart';

class ScanScreen extends StatefulWidget {
  const ScanScreen({super.key});

  @override
  State<ScanScreen> createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen> {
  late int aforoCurrent = 0;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  QRViewController? controller;

  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    } else if (Platform.isIOS) {
      controller!.resumeCamera();
    }

  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
          title:  Text(
            '',
            style: TextStyle(
              fontWeight:  FontWeight.bold,
              fontSize:  height / width * 11,
            ),
          )
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 5,
            child: QRView(
              key: qrKey,
              onQRViewCreated: _onQRViewCreated,

            ),
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: Text(
                'Tomemos asistencia',
                style: TextStyle(
                  fontWeight:  FontWeight.bold,
                  fontSize:  height / width * 11,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) async {

      controller.pauseCamera();
      final FirebaseFirestore db = FirebaseFirestore.instance;
      final CollectionReference clases = db.collection('clases');
      final DocumentSnapshot snapshot = await clases.doc(scanData.code.toString()).get();
      final userFields = snapshot.data() as Map<String, dynamic>;
      print(userFields);
      clases.doc(scanData.code.toString()).update({"aforo" : userFields["aforo"]+1});

      Navigator.of(context).pushReplacement(
          TurnPageRoute(
              overleafColor: Color(0xFFD99CB8),
              animationTransitionPoint: 0,
              transitionDuration: const Duration(
                  milliseconds: 500),
              reverseTransitionDuration: const Duration(
                  milliseconds: 500),
              builder: (context) => MainScreen()
          )
      );
        });
  }
}