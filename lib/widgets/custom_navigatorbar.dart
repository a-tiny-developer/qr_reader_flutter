import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_reader_flutter/providers/providers.dart';

class CustomNavigationBar extends StatelessWidget {
  const CustomNavigationBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final uiProvider = Provider.of<UiProvider>(context);
    return BottomNavigationBar(
      currentIndex: uiProvider.selectMenuOpt,
      onTap: uiProvider.changeMenuOpt,
      elevation: 0,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.map),
          label: 'Map',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.compass_calibration),
          label: 'Addresses',
        ),
      ],
    );
  }
}
