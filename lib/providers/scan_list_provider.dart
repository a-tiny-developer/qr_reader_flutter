import 'package:flutter/material.dart';
import 'package:qr_reader_flutter/models/models.dart';
import 'package:qr_reader_flutter/providers/db_provider.dart';

class ScanListProvider extends ChangeNotifier {
  List<ScanModel> scans = [];
  String selectedType = 'https';

  Future<void> newScan(String value) async {
    final newScan = ScanModel(value: value);
    final id = await DBProvider.newScan(newScan);
    newScan.id = id;
    if (selectedType == newScan.type) {
      scans.add(newScan);
      notifyListeners();
    }
  }

  Future<void> loadScans() async {
    final scans = await DBProvider.getAllScans();
    this.scans = scans;
    notifyListeners();
  }

  Future<void> loadScanByType(String type) async {
    final scans = await DBProvider.getScansByType(type);
    this.scans = scans;
    selectedType = type;
    notifyListeners();
  }

  Future<void> clearAll() async {
    await DBProvider.deleteAllScan();
    scans = [];
    notifyListeners();
  }

  Future<void> clearScanById(int id) async {
    await DBProvider.deleteScan(id);
    loadScanByType(selectedType);
  }
}
