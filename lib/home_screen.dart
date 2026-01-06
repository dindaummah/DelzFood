import 'package:delzfood/profile_screen.dart';
import 'package:flutter/material.dart';
import 'menu_screen.dart'; // Ganti dengan file lain jika perlu


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}


// navigasi
class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const HomeContent(),
    const MenuScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() => _currentIndex = index);
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.menu_book), label: 'Menu'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  static Widget _buildFavoriteItem(String title, String price, String imagePath) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Container(
        width: 150,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.all(8),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AspectRatio(
                  aspectRatio: 1,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(imagePath, fit: BoxFit.cover),
                  ),
                ),
                const SizedBox(height: 8),
                Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
                Text(price),
                const SizedBox(height: 8),
                const Row(
                  children: [
                    Icon(Icons.star, color: Colors.amber, size: 16),
                    SizedBox(width: 2),
                    Text('4.8', style: TextStyle(fontSize: 12)),
                  ],
                ),
              ],
            ),
            Positioned(
              bottom: 12,
              right: 12,
              child: Container(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 255, 255, 255).withOpacity(0.9),
                  shape: BoxShape.circle,
                ),
                child: const Padding(
                  padding: EdgeInsets.all(4.0),
                  child: Icon(Icons.favorite_border, color: Colors.red, size: 20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Widget _buildPopularCard(String title) {
    String imagePath = title == 'Avocado Juice'
        ? 'assets/images/bakso.png'
        : 'assets/images/es coklat.png';
    String price = title == 'Avocado Juice' ? 'Rp. 15.000' : 'Rp. 10.000';

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(imagePath, width: 90, height: 90, fit: BoxFit.cover),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                Text(price),
                const Row(
                  children: [
                    Icon(Icons.star, color: Colors.amber, size: 16),
                    SizedBox(width: 4),
                    Text('4.9'),
                  ],
                ),
              ],
            ),
          ),
          const Icon(Icons.favorite_border, color: Colors.red),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF85B7D9),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      'Welcome in DelzFood',
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                    ),
                    CircleAvatar(
                      radius: 22,
                      backgroundImage: AssetImage('assets/images/profil_delzfood.png'),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
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
                const SizedBox(height: 25),
                ClipRRect(
                  child: Image.asset(
                    'assets/images/banner.jpg',
                    height: 160,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 20),
                const Text('Favorite', style: TextStyle(fontSize: 20)),
                const SizedBox(height: 10),
                SizedBox(
                  height: 230,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      _buildFavoriteItem('Caffe Latte', 'Rp. 10.000', 'assets/images/caffe latte 1.png'),
                      _buildFavoriteItem('Mie Ayam', 'Rp. 10.000', 'assets/images/mie ayam1.png'),
                      _buildFavoriteItem('Tahu Walik', 'Rp. 5.000', 'assets/images/tahu walik.png'),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                const Text('Popular', style: TextStyle(fontSize: 20)),
                const SizedBox(height: 10),
                _buildPopularCard("Avocado Juice"),
                _buildPopularCard("Chocolate Cake"),
                _buildPopularCard("Caffe Latte"),
                const SizedBox(height: 80),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
