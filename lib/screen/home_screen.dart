import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart' as geo;
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  MapboxMap? mapboxMap;
  StreamSubscription<geo.Position>? positionStream;
  geo.Position? currentPosition;

  final List<Map<String, dynamic>> fighters = [
    {
      "image": "https://picsum.photos/200/304",
      "name": "Georges White",
      "rating": 4.5,
    },
    {
      "image": "https://picsum.photos/200/301",
      "name": "Alice Blue",
      "rating": 4.8,
    },
    {
      "image": "https://picsum.photos/200/302",
      "name": "John Doe",
      "rating": 4.2,
    },
  ];

  final List<Map<String, dynamic>> fights = [
    {
      "address": "Lyon",
      "fighter": "Georges White VS un Alcoolo",
      "hour": "11h35",
    },
    {
      "address": "Paris",
      "fighter": "Alice Blue VS Jules Besson",
      "hour": "12h30",
    },
    {"address": "Bordeaux", "fighter": "Thomas K VS Un ours", "hour": "22h45"},
  ];

  @override
  void initState() {
    super.initState();
    _requestLocationPermission();
  }

  Future<void> _requestLocationPermission() async {
    var status = await Permission.location.request();
    if (status.isGranted) {
      _enableUserLocation();
    }
  }

  void _enableUserLocation() {
    mapboxMap?.location.updateSettings(
      LocationComponentSettings(
        enabled: true,
        pulsingEnabled: true,
        showAccuracyRing: true,
      ),
    );

    positionStream = geo.Geolocator.getPositionStream(
      locationSettings: const geo.LocationSettings(
        accuracy: geo.LocationAccuracy.high,
        distanceFilter: 5,
      ),
    ).listen((geo.Position position) {
      setState(() {
        currentPosition = position;
      });
      _updateUserPosition(position);
    });

    geo.Geolocator.getCurrentPosition(
      desiredAccuracy: geo.LocationAccuracy.high,
    ).then((geo.Position position) {
      setState(() {
        currentPosition = position;
      });
      _updateUserPosition(position);
    });
  }

  void _updateUserPosition(geo.Position position) {
    mapboxMap?.flyTo(
      CameraOptions(
        center: Point(
          coordinates: Position(position.longitude, position.latitude),
        ),
        zoom: 15,
      ),
      MapAnimationOptions(duration: 1000),
    );
  }

  @override
  void dispose() {
    positionStream?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: SizedBox(
                      height: 280,
                      width: double.infinity,
                      child: MapWidget(
                        styleUri: MapboxStyles.STANDARD,
                        cameraOptions: CameraOptions(
                          center: Point(
                            coordinates: Position(4.850000, 45.750000),
                          ),
                          zoom: 10,
                        ),
                        onMapCreated: (controller) {
                          setState(() {
                            mapboxMap = controller;
                          });
                        },
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 20,
                    right: 20,
                    child: FloatingActionButton(
                      mini: true,
                      onPressed: _requestLocationPermission,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Icon(
                        currentPosition != null
                            ? Icons.my_location
                            : Icons.location_searching,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Text(
                "Les meilleurs combattants",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Container(
                height: 170,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: fighters.length,
                  itemBuilder: (context, index) {
                    final fighter = fighters[index];
                    return Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.network(
                              fighter["image"],
                              height: 130,
                              width: 200,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(height: 5),
                          Container(
                            width: 200,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(fighter["name"]),
                                Row(
                                  children: [
                                    Icon(Icons.star, color: Colors.yellow[800]),
                                    Text(fighter["rating"].toString()),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "Combats à venir",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: fights.length,
                  itemBuilder: (context, index) {
                    final fight = fights[index];
                    return ListTile(
                      leading: Icon(Icons.handshake_rounded),
                      title: Text(fight["fighter"]),
                      subtitle: Text(
                        fight["address"],
                        style: TextStyle(color: Colors.grey),
                      ),
                      trailing: Text(fight["hour"]),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
