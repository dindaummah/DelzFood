import 'package:flutter/material.dart';
import 'menu_screen.dart';
import 'drink_screen.dart';

class SnackScreen extends StatelessWidget {
  const SnackScreen({super.key});

  final List<Map<String, dynamic>> categories = const [
    {'name': 'Heavy Food', 'icon': Icons.rice_bowl},
    {'name': 'Snack', 'icon': Icons.fastfood},
    {'name': 'Drink', 'icon': Icons.local_drink},
  ];

  final List<Map<String, dynamic>> menuItems = const [
    {'name': 'Keripik', 'price': 5000, 'rating': 4.2, 'image': 'assets/snack1.jpg'},
    {'name': 'Kentang Goreng', 'price': 7000, 'rating': 4.6, 'image': 'assets/snack2.jpg'},
    {'name': 'Sosis Bakar', 'price': 8000, 'rating': 4.5, 'image': 'assets/snack3.jpg'},
    {'name': 'Otak-Otak', 'price': 6000, 'rating': 4.3, 'image': 'assets/snack4.jpg'},
    {'name': 'Cireng', 'price': 5000, 'rating': 4.0, 'image': 'assets/snack5.jpg'},
    {'name': 'Tahu Crispy', 'price': 5500, 'rating': 4.1, 'image': 'assets/snack6.jpg'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF85B7D9),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'Snack Menu',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                  ),
                  CircleAvatar(
                    radius: 22,
                    backgroundImage: AssetImage('assets/images/profil_delzfood.png'),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  color: Color(0xFFD6EAF8),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: const TextField(
                  decoration: InputDecoration(
                    icon: Icon(Icons.search),
                    hintText: 'Search',
                    border: InputBorder.none,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              const Text("Categories", style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: categories.map((category) {
                  Color bgColor;
                  switch (category['name']) {
                    case 'Heavy Food':
                      bgColor = const Color(0xFFA9D1E2);
                      break;
                    case 'Snack':
                      bgColor = const Color(0xFF6AA1C6);
                      break;
                    case 'Drink':
                      bgColor = const Color(0xFF6AA1C6);
                      break;
                    default:
                      bgColor = const Color(0xFFB4D6E5);
                  }

                  return GestureDetector(
                    onTap: () {
                      if (category['name'] == 'Heavy Food') {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (_) => const MenuScreen()),
                        );
                      } else if (category['name'] == 'Drink') {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (_) => const DrinkScreen()),
                        );
                      }
                    },
                    child: Container(
                      width: (MediaQuery.of(context).size.width - 48) / 3,
                      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                      decoration: BoxDecoration(
                        color: bgColor,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(category['icon'], size: 18, color: Colors.black),
                          const SizedBox(width: 6),
                          Text(
                            category['name'],
                            style: const TextStyle(color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(height: 10),
              Expanded(
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
            ],
          ),
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
