import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class CardTicketBottom extends StatelessWidget {
  final String title;
  final String subtittle;
  final String dateTime;
  final String price;
  final String seat;
  final String image;
  const CardTicketBottom({
    super.key,
    required this.title,
    required this.subtittle,
    required this.dateTime,
    required this.price,
    required this.seat,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    Color secondaryTextColor = Colors.grey;
    Color primaryColor = Theme.of(context).primaryColor;

    return Center(
      child: SizedBox(
        height: 150.0,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(image),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                      color: secondaryTextColor,
                    ),
                  ),
                  const SizedBox(
                    height: 4.0,
                  ),
                  Text(
                    subtittle,
                    style: TextStyle(
                      color: secondaryTextColor,
                      fontSize: 10.0,
                    ),
                  ),
                  const SizedBox(
                    height: 12.0,
                  ),
                  Row(
                    children: [
                      Icon(
                        MdiIcons.clock,
                        size: 18.0,
                        color: secondaryTextColor,
                      ),
                      const SizedBox(
                        width: 4.0,
                      ),
                      Text(
                        dateTime,
                        style: TextStyle(
                          fontSize: 12.0,
                          color: secondaryTextColor,
                        ),
                      ),
                    ],
                  ),
                  Divider(
                    color: Colors.grey[300],
                  ),
                  Row(
                    children: [
                      Text(
                        price,
                        style: const TextStyle(
                          fontSize: 10.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
