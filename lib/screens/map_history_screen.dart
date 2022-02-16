import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/providers.dart';

class MapHistoryScreen extends StatelessWidget {
  const MapHistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final scanListProvider = Provider.of<ScanListProvider>(context);
    final scans = scanListProvider.scans;
    return ListView.builder(
      itemCount: scans.length,
      itemBuilder: (context, index) {
        return ListTile(
          onTap: () {},
          leading: Icon(
            Icons.map,
            color: Theme.of(context).primaryColor,
          ),
          title: Text(scans[index].value),
          subtitle: Text(scans[index].id.toString()),
          trailing: const Icon(
            Icons.keyboard_arrow_right,
            color: Colors.grey,
          ),
        );
      },
    );
  }
}
