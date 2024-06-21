import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class CardTicket2 extends StatelessWidget {
  final String title;
  final String subtittle;
  final String dateTime;
  final String price;

  final String image;
  const CardTicket2({
    super.key,
    required this.title,
    required this.subtittle,
    required this.dateTime,
    required this.price,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    Color secondaryTextColor = Colors.grey;
    Color primaryColor = Theme.of(context).primaryColor;

    return Center(
      child: SizedBox(
        height: 160.0,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(image),
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: secondaryTextColor,
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
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
                  const SizedBox(
                    height: 12.0,
                  ),
                  Text(
                    price,
                    style: TextStyle(
                      color: secondaryTextColor,
                      fontSize: 12.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 4.0,
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
