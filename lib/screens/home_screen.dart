import 'package:flutter/material.dart';
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
      body: const Center(
        child: Text('HomeScreen'),
      ),
      bottomNavigationBar: const CustomNavigationBar(),
      floatingActionButton: const ScanButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
