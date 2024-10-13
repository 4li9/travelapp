import 'package:flutter/material.dart';

class Notifications extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            // تنفيذ إجراء العودة
          },
        ),
        title: Text('Notification',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        actions: [
          IconButton(
            icon: Icon(Icons.more_vert, color: Colors.black),
            onPressed: () {
              // تنفيذ إجراء المزيد
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            _buildSectionHeader('Today'),
            _buildNotificationItem(
              icon: Icons.local_offer,
              title: '30% Special Discount!',
              subtitle: 'Special promotion only valid today',
            ),
            _buildSectionHeader('Yesterday'),
            _buildNotificationItem(
              icon: Icons.account_balance_wallet,
              title: 'Top Up E-Wallet Successful!',
              subtitle: 'You have to top up your e-wallet',
            ),
            _buildNotificationItem(
              icon: Icons.new_releases,
              title: 'New Services Available!',
              subtitle: 'Now you can track orders in real time',
            ),
            _buildSectionHeader('December 22, 2024'),
            _buildNotificationItem(
              icon: Icons.credit_card,
              title: 'Credit Card Connected!',
              subtitle: 'Credit Card has been linked!',
            ),
            _buildNotificationItem(
              icon: Icons.account_circle,
              title: 'Account Setup Successful!',
              subtitle: 'Your account has been created!',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildNotificationItem(
      {required IconData icon,
      required String title,
      required String subtitle}) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 25,
            backgroundColor: Colors.black,
            child: Icon(icon, color: Colors.white, size: 30),
          ),
          SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5),
                Text(
                  subtitle,
                  style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
