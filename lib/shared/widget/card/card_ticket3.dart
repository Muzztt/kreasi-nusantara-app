import 'package:flutter/material.dart';

class CardTicket3 extends StatelessWidget {
  final String title;
  final String subtittle;
  final String dateTime;
  final String? trailing;
  final String image;

  const CardTicket3(
      {super.key,
      required this.title,
      required this.subtittle,
      required this.dateTime,
      required this.image,
      this.trailing});

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
              padding: const EdgeInsets.all(14.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 4.0,
                  ),
                  Text(
                    dateTime,
                    style: TextStyle(
                      color: secondaryTextColor,
                      fontSize: 10.0,
                    ),
                  ),
                  const SizedBox(
                    height: 12.0,
                  ),
                  Text(
                    subtittle,
                    style: const TextStyle(
                      fontSize: 14.0,
                    ),
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
