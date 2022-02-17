import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_reader_flutter/models/models.dart';
import 'package:qr_reader_flutter/utils/utils.dart';

import '../providers/providers.dart';

class ScanTiles extends StatelessWidget {
  const ScanTiles({Key? key, required this.type}) : super(key: key);

  final TypeScan type;

  @override
  Widget build(BuildContext context) {
    final scanListProvider = Provider.of<ScanListProvider>(context);
    final scans = scanListProvider.scans;
    return ListView.builder(
      itemCount: scans.length,
      itemBuilder: (context, index) {
        final scan = scans[index];
        return Dismissible(
          onDismissed: (direction) {
            scanListProvider.clearScanById(scan.id!);
          },
          key: UniqueKey(),
          background: Container(
            color: Colors.red,
          ),
          child: ListTile(
            onTap: () {
              Utils.selectType(context, scan);
            },
            leading: Icon(
              type == TypeScan.https ? Icons.link : Icons.map,
              color: Theme.of(context).primaryColor,
            ),
            title: Text(
              scan.value,
              style: const TextStyle(overflow: TextOverflow.ellipsis),
            ),
            subtitle: Text(scan.id.toString()),
            trailing: const Icon(
              Icons.keyboard_arrow_right,
              color: Colors.grey,
            ),
          ),
        );
      },
    );
  }
}
