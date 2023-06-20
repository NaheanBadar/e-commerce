import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CategoryListPage extends StatefulWidget {
  @override
  State<CategoryListPage> createState() => _CategoryListPageState();
}

class _CategoryListPageState extends State<CategoryListPage> {
  @override
  Widget build(BuildContext context) {
    const white = Color(0xffffffff);
    const red = Color(0xFFDB3022);
    const lightGrey = Color(0xFFf5f5f5);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: SvgPicture.asset('assets/images/svg/arrow.svg'),
        ),
        title: Text(
          'Categories',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset('assets/images/svg/search.svg'),
          ),
        ],
      ),
      body: Container(
        color: lightGrey,
        child: ListView(
          children: [
            Container(
              color: Color.fromARGB(255, 252, 252, 252),
              child: Row(
                children: [
                  _buildTab('Women', isSelected: true),
                  _buildTab('Men', isSelected: false),
                  _buildTab('Kids', isSelected: false),
                ],
              ),
            ),
            SizedBox(height: 20),
            _buildBanner('SUMMER SALES', 'Up to 50% off', red),
            SizedBox(height: 20),
            _buildProductCard('New', 'assets/images/png/new.png'),
            SizedBox(height: 20),
            _buildProductCard('Clothes', 'assets/images/png/clothes.png'),
            SizedBox(height: 20),
            _buildProductCard('Shoes', 'assets/images/png/shoes.png'),
            SizedBox(height: 20),
            _buildProductCard('Accesories', 'assets/images/png/accesories.png'),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildTab(String title, {bool isSelected = false}) {
    FontWeight fontWeight = isSelected
        ? FontWeight.bold
        : (title == 'Men' || title == 'Kids')
            ? FontWeight.normal
            : FontWeight.bold;

    return Expanded(
      child: Column(
        children: [
          Text(
            title,
            style: TextStyle(
              color: isSelected
                  ? Colors.black
                  : const Color.fromARGB(255, 50, 50, 50),
              fontWeight: fontWeight,
            ),
          ),
          SizedBox(height: 8),
          if (isSelected)
            Container(
              width: double.infinity,
              height: 3,
              color: Color(0xFFDB3022),
            ),
        ],
      ),
    );
  }

  Widget _buildBanner(String title, String subtitle, Color bgColor) {
    return Container(
      height: 100,
      margin: EdgeInsets.symmetric(horizontal: 15),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyle(
                fontFamily: 'Metropolis',
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Text(
              subtitle,
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProductCard(String cardText, String imagePath) {
    return Container(
      height: 100,
      margin: EdgeInsets.symmetric(horizontal: 15),
      padding: EdgeInsets.all(0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            offset: Offset(0, 4), // Position de l'ombre.
            blurRadius: 10, // Flou de l'ombre.
            spreadRadius: 1, // Étendue de l'ombre.
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 20, top: 2),
              child: Text(
                cardText,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(imagePath),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNavigationBar() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16.0),
          topRight: Radius.circular(16.0),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 4,
            offset: Offset(0, -2),
          ),
        ],
      ),
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/home');
                },
                child: SvgPicture.asset(
                  'assets/images/svg/home-unselected.svg',
                  width: 25,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/home');
                },
                child: Text(
                  'Home',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'assets/images/svg/shop-rouge.svg',
                width: 25,
              ),
              Text(
                'Shop',
                style: TextStyle(color: Colors.red),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'assets/images/svg/bag.svg',
                width: 25,
              ),
              Text(
                'Bag',
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'assets/images/svg/favorites.svg',
                width: 25,
              ),
              Text(
                'Favorites',
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'assets/images/svg/profile.svg',
                width: 25,
              ),
              Text(
                'Profile',
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
