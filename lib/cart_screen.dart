import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  final String name;
  final String image;
  final int price;
  final double rating;

  const CartScreen({
    super.key,
    required this.name,
    required this.image,
    required this.price,
    required this.rating,
  });

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  String selectedSize = 'Small';
  String paymentMethod = 'Cash';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFB4D6E5),
      appBar: AppBar(
        backgroundColor: const Color(0xFFB4D6E5),
        elevation: 0,
        title: const Text('Cart', style: TextStyle(color: Colors.black)),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Product Image
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                widget.image,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 16),

            // Product Name and Price
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(widget.name,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 18)),
                Text('Rp. ${widget.price}',
                    style: const TextStyle(fontSize: 16)),
              ],
            ),

            // Rating
            Row(
              children: List.generate(5, (index) {
                return Icon(Icons.star,
                    size: 20,
                    color: index < widget.rating.round()
                        ? Colors.amber
                        : Colors.grey);
              }),
            ),

            const SizedBox(height: 10),

            // Size Selection
            const Align(
              alignment: Alignment.centerLeft,
              child: Text("Coffee size", style: TextStyle(fontWeight: FontWeight.bold)),
            ),
            const SizedBox(height: 8),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: ['Small', 'Medium', 'Large'].map((size) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 12),
                    child: ChoiceChip(
                      label: Text(size),
                      selected: selectedSize == size,
                      onSelected: (_) {
                        setState(() => selectedSize = size);
                      },
                      selectedColor: Colors.blue.shade200,
                    ),
                  );
                }).toList(),
              ),
            ),

            const SizedBox(height: 16),

            // About Description
            const Align(
              alignment: Alignment.centerLeft,
              child: Text("About", style: TextStyle(fontWeight: FontWeight.bold)),
            ),
            const SizedBox(height: 4),
            const Text(
              "A cappuccino is an espresso-based coffee drink that originated in Australia with later development taking place in Italy.",
              style: TextStyle(fontSize: 14),
            ),

            const SizedBox(height: 20),

            // Payment Method
            const Align(
              alignment: Alignment.centerLeft,
              child: Text("Payment Method", style: TextStyle(fontWeight: FontWeight.bold)),
            ),
            const SizedBox(height: 8),
            Row(
              children: ['Cash', 'CRIS'].map((method) {
                return Expanded(
                  child: RadioListTile<String>(
                    title: Text(method),
                    value: method,
                    groupValue: paymentMethod,
                    onChanged: (value) {
                      setState(() {
                        paymentMethod = value!;
                      });
                    },
                  ),
                );
              }).toList(),
            ),

            const Spacer(),

            // Order Button
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
              ),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (_) => AlertDialog(
                    title: const Text('Pesanan Terkirim!'),
                    content: Text(
                      'Pesanan Anda berupa ${selectedSize} ${widget.name} dengan pembayaran $paymentMethod sudah masuk dan terkirim ke penjual.',
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text('OK'),
                      ),
                    ],
                  ),
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Add to cart', style: TextStyle(color: Colors.white)),
                  Text('Rp. ${widget.price}', style: const TextStyle(color: Colors.white)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
