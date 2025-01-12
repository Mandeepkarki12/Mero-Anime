import 'package:flutter/material.dart';

class MyListTile extends StatelessWidget {
  final String leadingImage;
  final String title;
  final String? subtitle;

  const MyListTile({
    super.key,
    required this.leadingImage,
    required this.title,
    this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      child: Material(
        elevation: 3, // Adds shadow effect
        borderRadius: BorderRadius.circular(12),
        child: ListTile(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(8), // Adds rounded corners
            child: Image.network(
              leadingImage,
              width: 50, // Adjust as needed
              height: 50, // Adjust as needed
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => const Icon(
                Icons.image_not_supported,
                size: 40,
                color: Colors.grey,
              ),
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) {
                  return child;
                } else {
                  return const SizedBox(
                    width: 50,
                    height: 50,
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }
              },
            ),
          ),
          title: Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: subtitle != null
              ? Text('Rank : $subtitle') // Only show subtitle if not null
              : null,
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
