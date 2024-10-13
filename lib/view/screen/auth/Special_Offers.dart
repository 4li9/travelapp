import 'package:flutter/material.dart';

class Special_Offers extends StatelessWidget {
  final List<Map<String, String>> offers = [
    {
      'discount': '30%',
      'title': "Today's Special!",
      'description': 'Get discount for every order, only valid for today',
      'image': 'assets/images/2023_07_10_11_14_IMG_4409.JPG',
    },
    {
      'discount': '25%',
      'title': 'Weekends Deals',
      'description': 'Get discount for every order, only valid for today',
      'image': 'assets/images/2023_07_10_11_14_IMG_4409.JPG',
    },
    {
      'discount': '40%',
      'title': 'New Arrivals',
      'description': 'Get discount for every order, only valid for today',
      'image': 'assets/images/2023_07_10_11_14_IMG_4409.JPG',
    },
    {
      'discount': '20%',
      'title': 'Black Friday',
      'description': 'Get discount for every order, only valid for today',
      'image': 'assets/images/2023_07_10_11_14_IMG_4409.JPG',
    },
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
          'Special Offers',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.more_vert, color: Colors.black),
            onPressed: () {
              // Implement more action
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: offers.length,
        itemBuilder: (context, index) {
          return _buildOfferCard(offers[index]);
        },
      ),
    );
  }

  Widget _buildOfferCard(Map<String, String> offer) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      offer['discount']!,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      offer['title']!,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      offer['description']!,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: ClipRRect(
                borderRadius:
                    BorderRadius.horizontal(right: Radius.circular(10)),
                child: Image.asset(
                  offer['image']!,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
