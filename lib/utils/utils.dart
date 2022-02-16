import 'package:flutter/material.dart';
import 'package:qr_reader_flutter/models/models.dart';
import 'package:qr_reader_flutter/router/router.dart';
import 'package:url_launcher/url_launcher.dart';

class Utils {
  static void launchURL(BuildContext context, ScanModel scan) async {
    if (scan.type == TypeScan.https) {
      final url = scan.value;
      if (!await launch(url)) throw 'Could not launch $url';
    } else {
      Navigator.pushNamed(
        context,
        AppRoutes.mapRoute,
        arguments: scan,
      );
    }
  }
}
