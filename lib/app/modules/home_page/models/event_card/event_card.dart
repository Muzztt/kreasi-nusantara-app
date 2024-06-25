import 'package:flutter/material.dart';

class EventCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String location;
  final String date;
  final String price;

  const EventCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.location,
    required this.date,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Image.network(
              imageUrl,
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text(location),
                  Text(date),
                  Text(price, style: const TextStyle(color: Colors.red)),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Beli Tiket'),
            ),
          ],
        ),
      ),
    );
  }
}
