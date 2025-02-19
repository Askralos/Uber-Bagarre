import 'package:flutter/material.dart';

import 'user_details_screen.dart';

class FighterScreen extends StatefulWidget {
  const FighterScreen({super.key});

  @override
  _FighterScreenState createState() => _FighterScreenState();
}

class _FighterScreenState extends State<FighterScreen> {
  final List<Map<String, dynamic>> users = [
    {
      "name": "Mamadou Pokala",
      "image": "https://randomuser.me/api/portraits/men/1.jpg",
      "distance": "4 min",
      "rating": "4.3",
      "weight": "80 kg",
      "height": "1m85",
      "pricing": "30",
      "wins": "25",
      "sex": "Homme",
      "fights": "32",
      "fight_style": ["Kickboxing", "Muay Thai"],
      "description":
          "Un combattant redoutable avec une excellente technique de jambes et une endurance impressionnante.",
    },
    {
      "name": "Honoré Coincidence",
      "image": "https://randomuser.me/api/portraits/men/2.jpg",
      "distance": "10 min",
      "rating": "3.7",
      "weight": "75 kg",
      "height": "1m78",
      "wins": "18",
      "pricing": "28",
      "fights": "28",
      "sex": "Homme",
      "fight_style": ["Jiu-Jitsu Brésilien", "MMA"],
      "description":
          "Maître du sol, il sait soumettre ses adversaires grâce à son expertise en grappling.",
    },
    {
      "name": "Hakim Morel",
      "image": "https://randomuser.me/api/portraits/men/3.jpg",
      "distance": "7 min",
      "rating": "4.5",
      "weight": "83 kg",
      "height": "1m80",
      "wins": "22",
      "fights": "23",
      "sex": "Homme",
      "fight_style": ["Muay Thai", "Boxe anglaise"],
      "pricing": "35",
      "description":
          "Un combattant explosif avec des coups de coude et de genou ravageurs.",
    },
    {
      "name": "Emma Lefevre",
      "image": "https://randomuser.me/api/portraits/women/4.jpg",
      "distance": "12 min",
      "rating": "4.2",
      "weight": "60 kg",
      "height": "1m70",
      "wins": "15",
      "sex": "Femme",
      "fights": "18",
      "pricing": "30",
      "fight_style": ["Boxe anglaise", "Kickboxing"],
      "description":
          "Dotée d’un jeu de pieds exceptionnel et d’un jab précis, elle met ses adversaires en difficulté dès le premier round.",
    },
    {
      "name": "Nicolas Martin",
      "image": "https://randomuser.me/api/portraits/men/5.jpg",
      "distance": "3 min",
      "rating": "4.5",
      "weight": "90 kg",
      "height": "1m88",
      "wins": "30",
      "sex": "Homme",
      "fight_style": ["MMA", "Jiu-Jitsu Brésilien", "Boxe anglaise"],
      "pricing": "45",
      "fights": "54",
      "description":
          "Un combattant complet maîtrisant aussi bien la lutte que le striking, avec une grande expérience en cage.",
    },
  ];
  late List<Map<String, dynamic>> filteredUsers;
  final TextEditingController _searchController = TextEditingController();
  int? selectedSort;

  @override
  void initState() {
    super.initState();
    filteredUsers = List.from(users);
    _searchController.addListener(() {
      _filterUsers();
    });
  }

  void _filterUsers() {
    setState(() {
      filteredUsers =
          users
              .where(
                (user) => user["name"]!.toLowerCase().contains(
                  _searchController.text.toLowerCase(),
                ),
              )
              .toList();
    });
  }

  void _sortByRatingAscending() {
    setState(() {
      selectedSort = 1; // 1 pour croissant
      filteredUsers.sort(
        (a, b) =>
            double.parse(a["rating"]!).compareTo(double.parse(b["rating"]!)),
      );
    });
  }

  void _sortByRatingDescending() {
    setState(() {
      selectedSort = 2; // 2 pour décroissant
      filteredUsers.sort(
        (a, b) =>
            double.parse(b["rating"]!).compareTo(double.parse(a["rating"]!)),
      );
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Bagarreurs",
              style: TextStyle(
                fontFamily: 'UberMove',
                fontSize: 34,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                filled: true,
                fillColor: Color(0xFFE8E8E8),
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
            ),
            const SizedBox(height: 10),

            // Boutons de tri
            Row(
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    _sortByRatingAscending();
                  },
                  icon: Icon(Icons.arrow_upward),
                  label: Text("Note croissante"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        selectedSort == 1
                            ? Colors.grey[200]
                            : null, // Change la couleur en vert si sélectionné
                  ),
                ),
                SizedBox(width: 10),
                ElevatedButton.icon(
                  onPressed: () {
                    _sortByRatingDescending();
                  },
                  icon: Icon(Icons.arrow_downward),
                  label: Text("Note décroissante"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        selectedSort == 2
                            ? Colors.grey[200]
                            : null, // Change la couleur en vert si sélectionné
                  ),
                ),
              ],
            ),

            const SizedBox(height: 10),

            Expanded(
              child: ListView.builder(
                itemCount: filteredUsers.length,
                itemBuilder: (context, index) {
                  final user = filteredUsers[index];
                  return _buildUserTile(user);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildUserTile(Map<String, dynamic> user) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => UserDetailsScreen(user: user),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5.0),
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: ListTile(
          leading: CircleAvatar(backgroundImage: NetworkImage(user["image"]!)),
          title: Text(user["name"]!),
          subtitle: Text(user["distance"]!),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(user["rating"]!, style: TextStyle(fontSize: 18)),
              SizedBox(width: 5),
              Icon(Icons.star),
            ],
          ),
        ),
      ),
    );
  }
}
