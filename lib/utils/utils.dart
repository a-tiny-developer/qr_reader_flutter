import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_reader_flutter/models/models.dart';
import 'package:qr_reader_flutter/providers/providers.dart';
import 'package:qr_reader_flutter/router/router.dart';
import 'package:url_launcher/url_launcher.dart';

class Utils {
  static void selectType(BuildContext context, ScanModel scan) async {
    final uiProvider = Provider.of<UiProvider>(context, listen: false);
    if (scan.type == TypeScan.https) {
      final url = scan.value;
      if (!await launch(url)) throw 'Could not launch $url';
      uiProvider.changeMenuOpt(1);
    } else {
      Navigator.pushNamed(
        context,
        AppRoutes.mapRoute,
        arguments: scan,
      );
      uiProvider.changeMenuOpt(0);
    }
  }
}
