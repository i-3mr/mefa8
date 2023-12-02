import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class QrCodeScannerScreen extends StatelessWidget {
  const QrCodeScannerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MobileScanner(
      fit: BoxFit.contain,
      controller: MobileScannerController(
        // facing: CameraFacing.back,
        // torchEnabled: false,
        returnImage: true,
      ),
      onDetect: (capture) {
        final List<Barcode> barcodes = capture.barcodes;
        for (final barcode in barcodes) {
          debugPrint('Barcode found! ${barcode.rawValue}');
        }
      },
    );
  }
}
