import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CategoryFilterPage extends StatefulWidget {
  @override
  State<CategoryFilterPage> createState() => _CategoryFilterPageState();
}

class _CategoryFilterPageState extends State<CategoryFilterPage> {
  List<bool> favoriteStatusList = [false, false, true, false];
  @override
  Widget build(BuildContext context) {
    const white = Color(0xffffffff);
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
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset('assets/images/svg/search.svg'),
          ),
        ],
      ),
      body: Container(
        color: white,
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                "Women's tops",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
              ),
            ),
            Container(
              height: 50.0,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  _buildFilterChip('T-shirts'),
                  _buildFilterChip('Crop Tops'),
                  _buildFilterChip('Sleeveless'),
                  _buildFilterChip('Shirt'),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                children: [
                  SvgPicture.asset('assets/images/svg/filtre.svg'),
                  Text(" Filters", style: TextStyle(color: Colors.black)),
                  Spacer(),
                  SvgPicture.asset('assets/images/svg/prixFiltre.svg'),
                  Text(" Price: lowest to high",
                      style: TextStyle(color: Colors.black)),
                  Spacer(),
                  SvgPicture.asset('assets/images/svg/carres-icon.svg'),
                ],
              ),
            ),
            Container(
              color: lightGrey,
              child: Column(
                children: [
                  _buildProductCard('Pullover', 'Mango', 4, '51',
                      'assets/images/png/pullover-image.png', 0),
                  _buildProductCard('Blouse', 'Dorothy Perkins', 0, '34',
                      'assets/images/png/blouse-image.png', 1),
                  _buildProductCard('T-shirt', 'LOST Ink', 10, '40',
                      'assets/images/png/t-shirt-image.png', 2),
                  _buildProductCard('Shirt', 'Zara', 3, '40',
                      'assets/images/png/shirt-image.png', 3),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 10),
            ),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildFilterChip(String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 9.5),
      child: Chip(
        label: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
          child: Text(
            label,
            style: TextStyle(color: Colors.white),
          ),
        ),
        backgroundColor: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    );
  }

  Widget _buildProductCard(String title, String brand, int rating, String price,
      String imagePath, int index) {
    final Widget favorite = GestureDetector(
      onTap: () {
        // Nous changeons l'état ici
        setState(() {
          favoriteStatusList[index] = !favoriteStatusList[index];
        });
      },
      child: SvgPicture.asset(
        favoriteStatusList[index]
            ? 'assets/images/svg/favoris-rouge.svg'
            : 'assets/images/svg/favoris.svg',
        width: 10,
      ),
    );

    return Stack(
      children: [
        Container(
          height: 100,
          margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 0,
                blurRadius: 5,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(imagePath),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      Text(
                        brand,
                        style: TextStyle(color: Colors.grey, fontSize: 16),
                      ),
                      Row(
                        children: [
                          for (var i = 0; i < 5; i++)
                            SvgPicture.asset(
                              i < rating
                                  ? 'assets/images/svg/yellow-star.svg'
                                  : 'assets/images/svg/star.svg',
                              width: 20,
                            ),
                          Text(
                            '($rating)',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                      Text(
                        '\$$price',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 1,
          right: 10,
          child: Container(
              padding: const EdgeInsets.all(9),
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 0,
                    blurRadius: 10,
                    offset: Offset(0, 6),
                  ),
                ],
              ),
              width: 35,
              height: 35,
              child: favorite),
        ),
      ],
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
