import 'package:flutter/material.dart';
import 'package:kuis/models/destinationModels.dart';
import 'package:kuis/pages/detail.dart';

class Destination extends StatelessWidget {
  const Destination({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Destinations")),
      body: ListView.builder(
        itemCount: destinationList.length,
        itemBuilder: (context, index) {
          DestinationModel destination = destinationList[index];
          return GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Detail(destination: destination),
              ),
            ),
            child: ListTile(
              title: Text(destination.name),
              subtitle: Row(
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
              leading: DestinationImage(
                destination: destination,
                height: 50,
                width: 50,
              ),
              // trailing: Column(
              //   children: [
              //     const Icon(Icons.star, color: Colors.amber),
              //     Text(destination.rating.toString()),
              //   ],
              // ),
            ),
          );
        },
      ),
    );
  }
}

class DestinationImage extends StatelessWidget {
  const DestinationImage({
    super.key,
    required this.destination,
    required this.width,
    required this.height,
  });

  final DestinationModel destination;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Image.network(
      destination.imageUrl,
      height: height,
      width: width,
      fit: BoxFit.contain,
      errorBuilder: (context, error, stackTrace) {
        return SizedBox(
          height: height,
          width: width,
          child: Icon(Icons.image, color: Colors.grey),
        );
      },
    );
  }
}
