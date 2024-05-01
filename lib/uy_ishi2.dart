import 'dart:io';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Find Your Favorite Food',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _searchQuery = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: TextField(
            onChanged: (value) {
              setState(() {
                _searchQuery = value;
              });
            },
            decoration: InputDecoration(
              hintText: 'What do you want to order?',
              border: InputBorder.none,
              icon: Icon(Icons.search),
              contentPadding: EdgeInsets.all(8.0),
            ),
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Popular Menu',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _buildFoodItem(
                  imageAsset: 'herbal_pancake.jpg',
                  name: 'Herbal Pancake',
                  price: 7.0,
                ),
                _buildFoodItem(
                  imageAsset: 'fruit_salad.jpg',
                  name: 'Fruit Salad',
                  price: 5.0,
                ),
                _buildFoodItem(
                  imageAsset: 'green_noodle.jpg',
                  name: 'Green Noodle',
                  price: 15.0,
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
        ],
      ),
    );
  }

  Widget _buildFoodItem({
    required String imageAsset,
    required String name,
    required double price,
  }) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Row(
        children: [
          Image.asset(
            _getImageAssetPath(imageAsset),
            width: 80.0,
            height: 80.0,
          ),
          SizedBox(width: 16.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  '\$${price.toStringAsFixed(2)}',
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String _getImageAssetPath(String imageAsset) {
    String path = 'assets/images/$imageAsset';
    // Check if the image file exists, if not, use a placeholder image
    if (!File(path).existsSync()) {
      // Use a placeholder image or update the path accordingly
      path = 'assets/images/placeholder_image.jpg';
    }
    return path;
  }
}
