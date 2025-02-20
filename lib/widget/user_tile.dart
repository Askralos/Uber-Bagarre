import 'package:flutter/material.dart';

import '../screen/user_details_screen.dart';

class UserTile extends StatelessWidget {
  final Map<String, dynamic> user;

  const UserTile({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
