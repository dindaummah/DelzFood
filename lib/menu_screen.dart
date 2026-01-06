import 'package:flutter/material.dart';
import 'cart_screen.dart'; // Pastikan file ini sudah ada

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  final PageController _pageController = PageController();
  int _selectedCategoryIndex = 0;

  final List<Map<String, dynamic>> categories = const [
    {'name': 'Heavy Food', 'icon': Icons.rice_bowl},
    {'name': 'Snack', 'icon': Icons.fastfood},
    {'name': 'Drink', 'icon': Icons.local_drink},
  ];

  final List<Map<String, dynamic>> heavyFoodItems = const [
    {'name': 'Mie Ayam', 'price': 10000, 'rating': 4.5, 'image': 'assets/images/mie ayam1.png'},
    {'name': 'Ayam Geprek', 'price': 10000, 'rating': 4.0, 'image': 'assets/images/ayam1.jpg'},
    {'name': 'Bakso Campur', 'price': 10000, 'rating': 4.3, 'image': 'assets/images/bakso.png'},
    {'name': 'Ayam Sambal', 'price': 10000, 'rating': 4.7, 'image': 'assets/images/ayam sambal.png'},
    {'name': 'Ayam Geprek', 'price': 10000, 'rating': 4.2, 'image': 'assets/images/ayam geprek.png'},
    {'name': 'Bakso', 'price': 10000, 'rating': 4.6, 'image': 'assets/images/bakso.png'},
  ];

  final List<Map<String, dynamic>> snackItems = const [
    {'name': 'Bola Keju', 'price': 5000, 'rating': 4.2, 'image': 'assets/images/bola keju.png'},
    {'name': 'Roti Isi', 'price': 8000, 'rating': 4.4, 'image': 'assets/images/roti.png'},
    {'name': 'Lumpia', 'price': 6000, 'rating': 4.1, 'image': 'assets/images/lumpia.png'},
    {'name': 'Tahu Walik', 'price': 7000, 'rating': 4.3, 'image': 'assets/images/tahu walik.png'},
    {'name': 'Cookies', 'price': 6000, 'rating': 4.0, 'image': 'assets/images/kukis.png'},
    {'name': 'Kentang Goreng', 'price': 7000, 'rating': 4.5, 'image': 'assets/images/kentang.png'},
  ];

  final List<Map<String, dynamic>> drinkItems = const [
    {'name': 'Kopi', 'price': 3000, 'rating': 4.0, 'image': 'assets/images/kopi.png'},
    {'name': 'Jus Jeruk', 'price': 8000, 'rating': 4.5, 'image': 'assets/images/jus jeruk.png'},
    {'name': 'Es Teh', 'price': 5000, 'rating': 4.2, 'image': 'assets/images/es teh.png'},
    {'name': 'Es Campur', 'price': 10000, 'rating': 4.6, 'image': 'assets/images/es campur.png'},
    {'name': 'Es Coklat', 'price': 2000, 'rating': 4.1, 'image': 'assets/images/es coklat.png'},
    {'name': 'Caffe Latte', 'price': 7000, 'rating': 4.3, 'image': 'assets/images/caffe latte 1.png'},
  ];

  List<List<Map<String, dynamic>>> get allMenuItems => [
        heavyFoodItems,
        snackItems,
        drinkItems,
      ];

  void _onCategoryTap(int index) {
    setState(() {
      _selectedCategoryIndex = index;
    });
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

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
                    'Menu DelzFood',
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
                children: categories.asMap().entries.map((entry) {
                  int index = entry.key;
                  Map<String, dynamic> category = entry.value;
                  bool isSelected = _selectedCategoryIndex == index;

                  Color selectedColor = const Color(0xFF6AA1C6);
                  Color unselectedColor = const Color(0xFFA9D1E2);

                  return GestureDetector(
                    onTap: () => _onCategoryTap(index),
                    child: Container(
                      width: (MediaQuery.of(context).size.width - 48) / 3,
                      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                      decoration: BoxDecoration(
                        color: isSelected ? selectedColor : unselectedColor,
                        borderRadius: BorderRadius.circular(30),
                        border: isSelected ? Border.all(color: Colors.white, width: 2) : null,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(category['icon'],
                              size: 18, color: isSelected ? Colors.white : Colors.black),
                          const SizedBox(width: 6),
                          Text(
                            category['name'],
                            style: TextStyle(
                              color: isSelected ? Colors.white : Colors.black,
                              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(height: 10),
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  onPageChanged: (index) {
                    setState(() {
                      _selectedCategoryIndex = index;
                    });
                  },
                  itemCount: allMenuItems.length,
                  itemBuilder: (context, pageIndex) {
                    final menuItems = allMenuItems[pageIndex];
                    return GridView.builder(
                      itemCount: menuItems.length,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.75,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                      ),
                      itemBuilder: (context, index) {
                        final item = menuItems[index];
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
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold, fontSize: 14)),
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
                                        IconButton(
                                          icon: const Icon(Icons.add, color: Colors.green),
                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (_) => CartScreen(
                                                  name: item['name'],
                                                  image: item['image'],
                                                  price: item['price'],
                                                  rating: item['rating'],
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}