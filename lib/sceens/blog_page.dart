import 'package:flutter/material.dart';

class AdvertisementScreen extends StatelessWidget {
  const AdvertisementScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Advertisements'),
      ),
      body: ListView(
        children: [
          _buildAdvertisementCard(
            imageUrl: 'images/goa.jpg',
            description: 'Goa Beach beach view Hotels at cheat rate contact: +123456798 ',
          ),
          _buildAdvertisementCard(
            imageUrl: 'images/taj.jpg',
            description: 'Best Hotel in Mumbai with good views',
          ),
          _buildAdvertisementCard(
            imageUrl: 'images/goa1.webp',
            description: 'Goa Hotel at good rates has AC/Non AC,Pool view ',
          ),
          _buildAdvertisementCard(
            imageUrl: 'images/download.jpeg',
            description: 'bade miyan mumbai: Best Non- Veg rest Restaurant',
          ),
          // Add more cards as needed
        ],
      ),
    );
  }

  Widget _buildAdvertisementCard({required String imageUrl, required String description}) {
    return Card(
      child: Column(
        children: [
          Image.asset(imageUrl),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(description),
          ),
        ],
      ),
    );
  }
}
