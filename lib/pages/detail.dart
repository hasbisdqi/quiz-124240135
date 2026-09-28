import 'package:flutter/material.dart';
import 'package:kuis/models/destinationModels.dart';
import 'package:kuis/pages/destination.dart';

class Detail extends StatefulWidget {
  const Detail({super.key, required this.destination});

  final DestinationModel destination;

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  @override
  Widget build(BuildContext context) {
    final destination = widget.destination;
    return Scaffold(
      appBar: AppBar(title: Text(destination.name)),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DestinationImage(
              destination: destination,
              width: double.infinity,
              height: 300,
            ),
            SizedBox(height: 2),
            Padding(
              padding: EdgeInsetsGeometry.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Text(
                        destination.name,
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight(800),
                        ),
                      ),
                      Spacer(),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.favorite_outline),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(destination.location),
                      SizedBox(width: 4),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                        ),
                        padding: EdgeInsets.only(left: 8, right: 8),
                        child: Text(destination.category),
                      ),
                    ],
                  ),
                  SizedBox(height: 26),

                  Text(
                    "Description: ",
                    style: TextStyle(fontWeight: FontWeight(800)),
                  ),
                  Text(destination.description),

                  SizedBox(height: 18),

                  _DestinationInfo(
                    icon: Icons.attractions,
                    label: "Attractions",
                    value: destination.attraction,
                  ),
                  _DestinationInfo(
                    icon: Icons.timer,
                    label: "Opening Hours",
                    value: destination.openingHours,
                  ),
                  _DestinationInfo(
                    icon: Icons.event,
                    label: "Ticket Info",
                    value: destination.ticketInfo,
                  ),
                  _DestinationInfo(
                    icon: Icons.link,
                    label: "Wikipedia",
                    value: destination.wikipediaUrl,
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

class _DestinationInfo extends StatelessWidget {
  const _DestinationInfo({
    required this.icon,
    required this.label,
    required this.value,
  });

  final IconData icon;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      padding: EdgeInsets.all(6),
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.grey),
        borderRadius: BorderRadius.all(Radius.circular(8)),
        color: Colors.blue[50],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, size: 18),
              SizedBox(width: 8),
              Text(label, style: Theme.of(context).textTheme.bodyLarge),
            ],
          ),
          Text(value, style: Theme.of(context).textTheme.bodySmall),
        ],
      ),
    );
  }
}
