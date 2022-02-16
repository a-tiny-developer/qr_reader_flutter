import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:provider/provider.dart';
import 'package:qr_reader_flutter/providers/providers.dart';

class ScanButton extends StatelessWidget {
  const ScanButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      elevation: 0,
      onPressed: () async {
        final barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#3D8BEF',
          'Cancel',
          false,
          ScanMode.QR,
        );

        final scanListProvider =
            Provider.of<ScanListProvider>(context, listen: false);
        scanListProvider.newScan(barcodeScanRes);
      },
      child: const Icon(Icons.filter_center_focus),
    );
  }
}
