import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: OSMMapScreen(),
  ));
}

class OSMMapScreen extends StatelessWidget {
  const OSMMapScreen({super.key});

  final LatLng dohLocation = const LatLng(14.5786, 121.0364);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Department of Health - Republic of the Philippines',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 12),

              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: SizedBox(
                    height: 250,
                    child: FlutterMap(
                      options: MapOptions(
                        center: LatLng(14.5786, 121.0364),
                        zoom: 16,
                      ),
                      children: [
                        TileLayer(
                          urlTemplate:
                          'https://{s}.basemaps.cartocdn.com/light_all/{z}/{x}/{y}{r}.png',
                          subdomains: const ['a', 'b', 'c'],
                        ),
                        MarkerLayer(
                          markers: [
                            Marker(
                              point: LatLng(14.5786, 121.0364),
                              width: 40,
                              height: 40,
                              child: const Icon(
                                Icons.location_pin,
                                color: Colors.red,
                                size: 40,
                              ),
                            ),
                          ],
                        ),
                      ],
                    )

                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
