import 'package:flutter/material.dart';
import '../../models/event_model.dart';

class EventCard extends StatelessWidget {
  final Event event;

  EventCard({required this.event});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10), // Add padding
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: SizedBox(
        width: 398, // Fixed width
        height: 294, // Fixed height
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: EdgeInsets.all(10), // Add padding
            child: Column(
              children: [
                Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10.0),
                        bottomLeft: Radius.circular(10.0),
                      ),
                      child: Image.asset(
                        event.imageUrl,
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(width: 8), // Add gap between image and text
                    Expanded(
                      child: Column(
                        children: [
                          SizedBox(height: 5),
                          Text(
                            event.title,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 3),
                          Row(
                            children: [
                              Icon(Icons.location_on,
                                  size: 12, color: Colors.grey),
                              SizedBox(width: 2),
                              Text(
                                event.location,
                                style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 3),
                          Row(
                            children: [
                              Icon(Icons.calendar_today,
                                  size: 12, color: Colors.grey),
                              SizedBox(width: 2),
                              Text(
                                event.date,
                                style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 3),
                          Text(
                            event.price,
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Spacer(),
                Center(
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text('Get Ticket'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFBC0C24),
                      textStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                      padding:
                          EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
