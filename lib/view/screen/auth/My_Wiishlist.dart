import 'package:flutter/material.dart';

class My_Wiishlist extends StatelessWidget {
  final List<Map<String, dynamic>> products = [
    {
      'image':
          'assets/images/aa.JPG', // استبدل هذا بالمسار الصحيح لصورة الكاميرا
      'name': 'Fujifilm Camera',
      'rating': 4.6,
      'sold': 6641,
      'price': 550.00,
    },
    {
      'image': 'assets/images/aa.JPG', // استبدل هذا بالمسار الصحيح لصورة الساعة
      'name': 'Silver Watch',
      'rating': 4.8,
      'sold': 7461,
      'price': 875.00,
    },
    {
      'image':
          'assets/images/aa.JPG', // استبدل هذا بالمسار الصحيح لصورة الميكروفون
      'name': 'Airtight Microphone',
      'rating': 4.8,
      'sold': 6378,
      'price': 345.00,
    },
    {
      'image':
          'assets/images/aa.JPG', // استبدل هذا بالمسار الصحيح لصورة السماعات
      'name': 'Silent Headphones',
      'rating': 4.5,
      'sold': 5372,
      'price': 460.00,
    },
    // أضف المزيد من المنتجات هنا إذا لزم الأمر
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            // Implement back action
          },
        ),
        title: Text(
          'My Wishlist',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: Colors.black),
            onPressed: () {
              // Implement search action
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _buildCategoryChip('All', true),
                  _buildCategoryChip('Clothes', false),
                  _buildCategoryChip('Shoes', false),
                  _buildCategoryChip('Bags', false),
                  _buildCategoryChip('Electronics', false),
                  // أضف المزيد من الفئات هنا إذا لزم الأمر
                ],
              ),
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(16.0),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 16.0,
                crossAxisSpacing: 16.0,
                childAspectRatio: 0.7,
              ),
              itemCount: products.length,
              itemBuilder: (context, index) {
                return _buildProductCard(products[index]);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryChip(String label, bool isSelected) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: ChoiceChip(
        label: Text(label),
        selected: isSelected,
        onSelected: (bool selected) {
          // Implement category filter action
        },
        selectedColor: Colors.black,
        backgroundColor: Colors.grey[200],
        labelStyle: TextStyle(
          color: isSelected ? Colors.white : Colors.black,
        ),
      ),
    );
  }

  Widget _buildProductCard(Map<String, dynamic> product) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
                child: Image.asset(
                  product['image'],
                  fit: BoxFit.cover,
                  height: 120,
                  width: double.infinity,
                ),
              ),
              Positioned(
                top: 8,
                right: 8,
                child: CircleAvatar(
                  radius: 15,
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.favorite,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product['name'],
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Row(
                  children: [
                    Icon(Icons.star, color: Colors.amber, size: 16),
                    SizedBox(width: 4),
                    Text(
                      product['rating'].toString(),
                      style: TextStyle(fontSize: 14),
                    ),
                    SizedBox(width: 8),
                    Text(
                      '${product['sold']} sold',
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Text(
                  '\$${product['price'].toStringAsFixed(2)}',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
