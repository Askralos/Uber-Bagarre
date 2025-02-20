import 'package:flutter/material.dart';

class ResearchBar extends StatelessWidget {
  final TextEditingController researchController;

  const ResearchBar({super.key, required this.researchController});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: researchController,
      decoration: InputDecoration(
        filled: true,
        fillColor: Color(0xFFF0F0F0),
        prefixIcon: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0),
          child: Icon(Icons.search),
        ),
        hintText: "Rechercher",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide.none,
        ),
      ),
      style: TextStyle(fontSize: 16.0),
    );
  }
}
