import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:provider/provider.dart';
import 'package:qr_reader_flutter/providers/providers.dart';
import 'package:qr_reader_flutter/utils/utils.dart';

import '../models/models.dart';

class ScanButton extends StatelessWidget {
  const ScanButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      elevation: 0,
      onPressed: () async {
        // final barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
        //   '#3D8BEF',
        //   'Cancel',
        //   false,
        //   ScanMode.QR,
        // );
        const barcodeScanRes = 'geo:16.752258, -93.176553';

        if (barcodeScanRes.contains(TypeScan.geo.name) ||
            barcodeScanRes.contains(TypeScan.https.name)) {
          final scanListProvider =
              Provider.of<ScanListProvider>(context, listen: false);
          final scan = await scanListProvider.newScan(barcodeScanRes);
          Utils.launchURL(context, scan);
        }
      },
      child: const Icon(Icons.filter_center_focus),
    );
  }
}
