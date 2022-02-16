import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_reader_flutter/models/models.dart';
import 'package:qr_reader_flutter/providers/providers.dart';
import 'package:qr_reader_flutter/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: const Text('History'),
        actions: [
          IconButton(
            onPressed: () {
              final scanListProvider =
                  Provider.of<ScanListProvider>(context, listen: false);
              scanListProvider.clearAll();
              DBProvider.deleteAllScan();
            },
            icon: const Icon(
              Icons.delete_forever,
            ),
          )
        ],
      ),
      body: const _HomePageBody(),
      bottomNavigationBar: const CustomNavigationBar(),
      floatingActionButton: const ScanButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class _HomePageBody extends StatelessWidget {
  const _HomePageBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final uiProvider = Provider.of<UiProvider>(context);

    final scanListProvider =
        Provider.of<ScanListProvider>(context, listen: false);

    switch (uiProvider.selectMenuOpt) {
      case 0:
        scanListProvider.loadScanByType(TypeScan.geo);
        return const ScanTiles(type: TypeScan.geo);
      case 1:
        scanListProvider.loadScanByType(TypeScan.https);
        return const ScanTiles(type: TypeScan.https);
      default:
        return const SizedBox();
    }
  }
}
