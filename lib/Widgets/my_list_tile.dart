import 'package:flutter/material.dart';

class MyListTile extends StatelessWidget {
  const MyListTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      child: Material(
        elevation: 3, // Adds shadow effect
        borderRadius: BorderRadius.circular(12),
        child: ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          leading: Icon(
            Icons.account_circle, // Replace with desired icon
            size: 40,
            color: Colors.blueAccent,
          ),
          title: const Text(
            "Title of the Tile",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: const Text("Subtitle description goes here."),
          trailing: IconButton(
            icon: const Icon(Icons.chevron_right, color: Colors.grey),
            onPressed: () {
              // Add your action here
              print("Chevron pressed");
            },
          ),
          onTap: () {
            // Handle tap here
            print("Tile tapped");
          },
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          tileColor: Colors.white, // Background color
        ),
      ),
    );
  }
}

