import 'package:flutter/material.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Scaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Uber Bagarre",
                style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20), // Espace entre le texte et la carte
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: SizedBox(
                  height: 250,
                  width: double.infinity,
                  child: MapWidget(
                    styleUri: MapboxStyles.STANDARD,

                    cameraOptions: CameraOptions(
                      center: Point(coordinates: Position(4.850000, 45.750000)),
                      zoom: 10,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20), // Espace entre le texte et la carte
              Column(
                children: [
                  Container(
                    child: Text("yuagfigaeviuaegviuaeviaevgieviaeuvfui"),
                    color: Colors.white,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
