import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_reader_flutter/providers/providers.dart';
import 'package:qr_reader_flutter/screens/screens.dart';
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
            onPressed: () {},
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
    switch (uiProvider.selectMenuOpt) {
      case 0:
        return const MapHistoryScreen();
      case 1:
        return const AddressesScreen();
      default:
        return const MapHistoryScreen();
    }
  }
}
