import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:laundry/view/form.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QRCodeScannerView extends StatefulWidget {
  const QRCodeScannerView({super.key});

  @override
  QRCodeScannerViewState createState() => QRCodeScannerViewState();
}

class QRCodeScannerViewState extends State<QRCodeScannerView> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  QRViewController? controller;
  final String qrResult = "sozlerkosku"; // Tanımlanan karekod değeri

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('QR Okut')),
      body: Column(
        children: [
          Expanded(
            flex: 5,
            child: QRView(key: qrKey, onQRViewCreated: _onQRViewCreated),
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: Text('Sonuç: ${result != null ? "Başarılı" : "Henüz bir karekod okunmadı."}'),
            ),
          ),
        ],
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    this.controller!.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
        if (result!.code == qrResult) {
          // Eğer okunan karekod tanımlanan değerle eşleşiyorsa, başka bir sayfaya geçiş yapabilirsiniz.
          controller.pauseCamera();
          Get.to(() => const FormView());
        }
      });
    });
  }

  @override
  void dispose() {
    controller!.dispose();
    super.dispose();
  }
}
