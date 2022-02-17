import 'dart:async';

import 'package:flutter/material.dart';
import 'package:qr_reader_flutter/models/models.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final Completer<GoogleMapController> _controller = Completer();
  var mapType = MapType.normal;

  @override
  Widget build(BuildContext context) {
    final scan = ModalRoute.of(context)?.settings.arguments as ScanModel;

    final CameraPosition startingPoint = CameraPosition(
      target: scan.getLatLng(),
      zoom: 17.5,
      // tilt: 50,
    );

    final markers = <Marker>{
      Marker(
        markerId: const MarkerId('geo-location'),
        position: scan.getLatLng(),
      ),
    };

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Map'),
        actions: [
          IconButton(
            onPressed: () async {
              final GoogleMapController controller = await _controller.future;
              controller.animateCamera(
                CameraUpdate.newCameraPosition(
                  CameraPosition(
                    target: scan.getLatLng(),
                    zoom: 17.5,
                    // tilt: 50,
                  ),
                ),
              );
            },
            icon: const Icon(Icons.location_on),
          ),
        ],
      ),
      body: GoogleMap(
        myLocationButtonEnabled: false,
        mapType: mapType,
        markers: markers,
        initialCameraPosition: startingPoint,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            mapType =
                mapType == MapType.normal ? MapType.satellite : MapType.normal;
          });
        },
        child: const Icon(Icons.layers),
      ),
    );
  }
}
