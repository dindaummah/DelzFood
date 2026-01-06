import 'package:flutter/material.dart';

class DrinkScreen extends StatelessWidget {
  const DrinkScreen({super.key});

  final List<Map<String, dynamic>> menuItems = const [
    {'name': 'Es Teh', 'price': 3000, 'rating': 4.5, 'image': 'assets/drink1.jpg'},
    {'name': 'Jus Alpukat', 'price': 8000, 'rating': 4.8, 'image': 'assets/drink2.jpg'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF85B7D9),
      appBar: AppBar(
        title: const Text('Drink Menu'),
        backgroundColor: Colors.orange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: GridView.builder(
          itemCount: menuItems.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.75,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemBuilder: (context, index) {
            final item = menuItems[index];
            return buildMenuItem(item);
          },
        ),
      ),
    );
  }

  Widget buildMenuItem(Map<String, dynamic> item) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
            child: Image.asset(
              item['image'],
              height: 100,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(item['name'],
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                Text('Rp. ${item['price']}'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.star, size: 14, color: Colors.orange),
                        const SizedBox(width: 4),
                        Text(item['rating'].toString()),
                      ],
                    ),
                    const Icon(Icons.favorite_border, color: Colors.red),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
