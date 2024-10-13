import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:untitled/controller/auth/home_controller.dart';
import 'package:untitled/core/constant/colore.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final CarouselSliderController _controller = CarouselSliderController();
  int _current = 0;

  final List<String> imgList = [
    'assets/images/9c060b534ab14925b4082e93e32af19f.jpg',
    'assets/images/9490133a2c60c78457d26b9bafb8a5a7.jpg',
    'assets/images/ee1b2eb87d55847447c09df6071e4f5a.jpg',
    'assets/images/835fbc4a85cc41cea86ce65cc6e886fc.jpg',
  ];

  final List<String> discounts = ['30%', '20%', '15%', '50%'];
  final List<String> titles = [
    "اماكن اثريه",
    "مناطق خياليه",
    "الشتاء من حولك",
    "غابات جميله!"
  ];
  final List<String> subtitles = [
    'Get discount for every order, only valid for today.',
    'Check out our latest collection.',
    'Hurry up before it\'s too late.',
    'Everything must go!'
  ];

  final List<String> categories = [
    'الكل',
    'المغامرة',
    'تخيم',
    'الاستجمام',
    'ثقافية وتراثية',
    'فاخرة',
    'رياضية',
    'البرية والسفاري',
    'عائلية',
  ];

  int _selectedCategoryIndex = 0;

  @override
  Widget build(BuildContext context) {
    homeControllerImp controller = Get.put(homeControllerImp());
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.only(left: 14.0),
          child: CircleAvatar(
            backgroundImage:
                AssetImage('assets/images/2023_03_29_16_43_IMG_4395.JPG'),
          ),
        ),
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Good Morning 👋',
              style: TextStyle(fontSize: 14),
            ),
            Text(
              'Andrew Ainsley',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 0.0),
            child: IconButton(
              icon: const Icon(Icons.notifications_none),
              onPressed: () {
                controller.gotoNotifications();
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: IconButton(
              icon: const Icon(Icons.favorite_border),
              onPressed: () {
                controller.goToMy_Wishlist();
              },
            ),
          ),
        ],
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: ListView(
          children: [
            SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                hintText: 'Search...',
                prefixIcon: Icon(Icons.search),
                suffixIcon: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: IconButton(
                    icon: Icon(Icons.settings),
                    onPressed: () {
                      // Add your settings functionality here
                    },
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none,
                ),
                fillColor: Colors.grey[200],
                filled: true,
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('العروض',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                TextButton(
                    onPressed: () {},
                    child: Text('الكل', style: TextStyle(color: Colors.black))),
              ],
            ),
            _buildCarousel(controller),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('الاقسام',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                TextButton(
                    onPressed: () {},
                    child: const Text(
                      'الكل',
                      style: TextStyle(color: Colors.black),
                    )),
              ],
            ),
            const SizedBox(height: 0),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(categories.length, (index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                    child: ChoiceChip(
                      label: Text(categories[index]),
                      selected: _selectedCategoryIndex == index,
                      onSelected: (selected) {
                        setState(() {
                          _selectedCategoryIndex = index;
                        });
                      },
                      selectedColor: AppColor.primaryColor,
                      backgroundColor: AppColor.waith,
                      labelStyle: TextStyle(
                        color: _selectedCategoryIndex == index
                            ? AppColor.waith
                            : AppColor.blak,
                        fontWeight: FontWeight.bold,
                      ),
                      shape: const StadiumBorder(
                        side: BorderSide(
                          color: AppColor.grey,
                          width: 1,
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
            const SizedBox(height: 5),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.75,
              ),
              itemCount: 6,
              itemBuilder: (context, index) {
                return _buildProductItem();
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCarousel(homeControllerImp controller) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        CarouselSlider.builder(
          itemCount: imgList.length, // عدد الصور في الكاروسيل
          carouselController: _controller, // تمرير المتحكم هنا
          itemBuilder: (context, index, realIdx) {
            return GestureDetector(
              onTap: () {
                controller.gotoSpecial_Offers(); // Add your action here
              },
              child: _buildCarouselItem(
                discounts[index],
                titles[index],
                subtitles[index],
                imgList[index],
              ),
            );
          },
          options: CarouselOptions(
            height: 160, // تعديل الارتفاع هنا
            autoPlay: true,
            enlargeCenterPage: true,
            aspectRatio: 16 / 9, // تعديل نسبة العرض إلى الارتفاع هنا
            enableInfiniteScroll: true,
            initialPage: 0,
            autoPlayAnimationDuration: Duration(seconds: 2),
            autoPlayInterval: Duration(seconds: 3),
            viewportFraction: 0.99, // تعديل عرض العنصر هنا
            onPageChanged: (index, reason) {
              setState(() {
                _current = index;
              });
            },
          ),
        ),
        Positioned(
          bottom: 10,
          child: AnimatedSmoothIndicator(
            activeIndex: _current,
            count: imgList.length,
            effect: ExpandingDotsEffect(
              activeDotColor: Colors.white,
              dotColor: Colors.grey,
              dotHeight: 8,
              dotWidth: 8,
              expansionFactor: 3,
            ),
            onDotClicked: (index) {
              _controller.animateToPage(index);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildCarouselItem(
      String discount, String title, String subtitle, String imagePath) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15), // تعديل الحواف هنا
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15), // تعديل الحواف هنا
            child: Image.asset(
              imagePath,
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15), // تعديل الحواف هنا
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  Colors.black.withOpacity(0.6),
                  Colors.transparent,
                ],
              ),
            ),
          ),
          Positioned(
            left: 16,
            bottom: 16,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(discount,
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
                SizedBox(height: 8),
                Text(title,
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
                SizedBox(height: 8),
                Text(subtitle,
                    style: TextStyle(fontSize: 14, color: Colors.white)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryButton(String label, IconData icon) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            shape: CircleBorder(),
            padding: EdgeInsets.all(16),
            backgroundColor:
                Color.fromARGB(211, 238, 238, 238), // <-- Button color
            foregroundColor: Colors.black, // <-- Splash color
          ),
          child: Icon(icon, size: 20),
        ),
        SizedBox(height: 5),
        Text(label,
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
      ],
    );
  }

  Widget _buildProductItem() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey[200],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
              child: Image.asset(
                'assets/images/b26c86257941cd1a2d2d2695f19fe754.jpg',
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('رحله الى صلاله',
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                SizedBox(height: 5),
                Text('متكامله', style: TextStyle(fontSize: 14)),
                SizedBox(height: 5),
                Text('\50 ريال عماني', style: TextStyle(fontSize: 16)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
