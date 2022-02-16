import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/providers.dart';

class AddressesScreen extends StatelessWidget {
  const AddressesScreen({Key? key}) : super(key: key);

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
            onTap: () {},
            leading: Icon(
              Icons.link,
              color: Theme.of(context).primaryColor,
            ),
            title: Text(scan.value),
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
