import 'package:flutter/material.dart';

class RecapScreen extends StatelessWidget {
  const RecapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Text(
            "Vérification de la réservation",
            style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
