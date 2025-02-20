import 'package:flutter/material.dart';
import 'package:uber_bagarre/screen/recap_screen.dart';

class UserDetailsScreen extends StatelessWidget {
  final Map<String, dynamic> user;

  UserDetailsScreen({super.key, required this.user});

  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _timeController =
      TextEditingController(); // Nouveau contrôleur pour l'heure

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          width: double.infinity,
          child: Row(
            children: [
              Text(
                user['pricing']! + " €",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(width: 30),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) {
                        return Container(
                          padding: EdgeInsets.all(30),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(12),
                            ),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "Commander le Fighter",
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Divider(color: Colors.grey[300]),
                              SizedBox(height: 20),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Date",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  TextField(
                                    controller: _dateController,
                                    decoration: InputDecoration(
                                      labelText: "Date",
                                      filled: true,
                                      prefixIcon: Icon(Icons.calendar_month),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                      ),
                                    ),
                                    readOnly: true,
                                    onTap: () {
                                      selectDate(context);
                                    },
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Heure",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  TextField(
                                    controller: _timeController,
                                    // Utilise le contrôleur pour l'heure
                                    decoration: InputDecoration(
                                      labelText: "Heure",
                                      filled: true,
                                      prefixIcon: Icon(Icons.access_time),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                      ),
                                    ),
                                    readOnly: true,
                                    onTap: () {
                                      selectTime(
                                        context,
                                      ); // Appelle la fonction selectTime
                                    },
                                  ),
                                ],
                              ),
                              SizedBox(height: 20),
                              SizedBox(
                                width: double.infinity,
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => RecapScreen(),
                                      ),
                                    );
                                  },
                                  style: ButtonStyle(
                                    padding: WidgetStateProperty.all(
                                      EdgeInsets.symmetric(
                                        horizontal: 12,
                                        vertical: 12,
                                      ),
                                    ),
                                    backgroundColor: MaterialStateProperty.all(
                                      Colors.green,
                                    ),
                                    shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                    ),
                                  ),
                                  child: Text(
                                    "Confirmer",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all(EdgeInsets.all(12)),
                    backgroundColor: MaterialStateProperty.all(Colors.green),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  child: Text(
                    "Commander",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(user["image"]!),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    user["name"]!,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          Row(
                            children: [
                              Icon(Icons.star),
                              SizedBox(width: 6),
                              Text(
                                user["rating"]!,
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            "Note",
                            style: TextStyle(
                              color: Colors.grey[400],
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Row(
                            children: [
                              Icon(Icons.add_chart),
                              SizedBox(width: 6),
                              Text(
                                user["wins"]!,
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            "Victoire",
                            style: TextStyle(
                              color: Colors.grey[400],
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Row(
                            children: [
                              Icon(Icons.handshake),
                              SizedBox(width: 6),
                              Text(
                                user["fights"]!,
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            "Combats",
                            style: TextStyle(
                              color: Colors.grey[400],
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 40),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Caractéristiques",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 15),
                    Row(
                      children: [
                        Icon(Icons.person),
                        SizedBox(width: 15),
                        Text(user["sex"]!, style: TextStyle(fontSize: 18)),
                      ],
                    ),
                    SizedBox(height: 15),
                    Row(
                      children: [
                        Icon(Icons.scale),
                        SizedBox(width: 15),
                        Text(user["weight"]!, style: TextStyle(fontSize: 18)),
                      ],
                    ),
                    SizedBox(height: 15),
                    Row(
                      children: [
                        Icon(Icons.height),
                        SizedBox(width: 15),
                        Text(user["height"]!, style: TextStyle(fontSize: 18)),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 40),
            Row(
              children:
                  user["fight_style"].map<Widget>((style) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: Chip(
                        label: Text(style),
                        backgroundColor: Colors.grey[200],
                        side: BorderSide(color: Colors.transparent),
                      ),
                    );
                  }).toList(),
            ),
            SizedBox(height: 10),
            Text(
              user["description"]!,
              style: TextStyle(fontSize: 16, color: Colors.grey[600]),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> selectDate(BuildContext context) async {
    DateTime? newDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (newDate != null) {
      _dateController.text = "${newDate.day}/${newDate.month}/${newDate.year}";
    }
  }

  Future<void> selectTime(BuildContext context) async {
    TimeOfDay? newTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (newTime != null) {
      _timeController.text =
          "${newTime.hour}:${newTime.minute.toString().padLeft(2, '0')}"; // Format de l'heure
    }
  }
}
