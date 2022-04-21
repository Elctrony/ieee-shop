import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:shop/utils/colors.dart';
import 'dart:math';
class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  final List<Map<String, dynamic>> listItem = [
    {
      'title': 'Apple Watch',
      'img': 'assets/images/apple.png',
      'description': 'Lorem Ipsum is simply dummy text of the printing and',
      'price': 59.99,
      'isFav': false,
      'isCart': false,
    },
    {
      'title': 'Air jorden',
      'img': 'assets/images/airjorden.png',
      'description': 'Lorem Ipsum is simply dummy text of the printing and',
      'price': 79.99,
      'isFav': false,
      'isCart': false,
    },
    {
      'title': 'Airpods',
      'img': 'assets/images/airpod_product.png',
      'description': 'Lorem Ipsum is simply dummy text of the printing and',
      'price': 64.99,
      'isFav': false,
      'isCart': false,
    },
    {
      'title': 'Amazon Speakre',
      'img': 'assets/images/amazon.png',
      'description': 'Lorem Ipsum is simply dummy text of the printing and',
      'price': 159.99,
      'isFav': false,
      'isCart': false,
    },
    {
      'title': 'Google shirt',
      'img': 'assets/images/tshirt.png',
      'description': 'Lorem Ipsum is simply dummy text of the printing and',
      'price': 29.99,
      'isFav': false,
      'isCart': false,
    },
    {
      'title': 'Speaker',
      'img': 'assets/images/product3.png',
      'description': 'Lorem Ipsum is simply dummy text of the printing and',
      'price': 39.99,
      'isFav': false,
      'isCart': false,
    }
  ];

  final favList = [];
  late List<Function> globalSetState;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.9),
      appBar: AppBar(
        title: Text('My Shop'),
        backgroundColor: Colors.orange,
        actions: [
          InkWell(
            onTap: () {
              Navigator.of(context).pushNamed('/favorite',arguments: favList).then((value) => print(value));
              print('Send');
            },
            child: Container(
              child: SvgPicture.asset(
                'assets/icons/favorite.svg',
                color: Colors.white,
                width: 30,
              ),
              margin: EdgeInsets.symmetric(horizontal: 12),
            ),
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.only(top: 8, right: 12, left: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.orange),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.orange),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        hintText: 'Search....',
                        label: Text('Search'),
                      ),
                      cursorColor: Colors.orange,
                    ),
                  ),
                ),
                SizedBox(
                  width: 8,
                ),
                CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.orange,
                  child: Padding(
                    padding: EdgeInsets.all(6),
                    child: SvgPicture.asset(
                      'assets/icons/cart.svg',
                      width: 30,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 6,
            ),
            Text(
              'All products',
              style: TextStyle(
                  fontSize: 28,
                  color: Colors.black,
                  fontWeight: FontWeight.w400),
            ),
            SizedBox(
              height: 6,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: listItem.length,
                itemBuilder: (context, index) => Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25)),
                  height: 110,
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(vertical: 8),
                  child: Row(
                    children: [
                      Container(
                        width: 100,
                        height: 110,
                        child: Image.asset(listItem[index]['img']),
                        decoration: BoxDecoration(
                          color: colorAvaliable[
                          Random().nextInt(colorAvaliable.length)],
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(25),
                            bottomLeft: Radius.circular(25),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                listItem[index]['title'],
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w400),
                              ),
                              Text(
                                listItem[index]['description'],
                                style: TextStyle(
                                    fontSize: 13, fontWeight: FontWeight.w300),
                              ),
                              Text(
                                '\$${listItem[index]['price']}',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          StatefulBuilder(builder: (context, setState) {
                            //globalSetState[index] = setState;
                            return InkWell(
                              onTap: () {
                                setState(() {
                                  listItem[index]['isFav'] =
                                  !listItem[index]['isFav'];
                                });
                                  favList.add(listItem[index]);
                              },
                              child: Container(
                                child: SvgPicture.asset(
                                  listItem[index]['isFav']
                                      ? 'assets/icons/fav.svg'
                                      : 'assets/icons/favorite.svg',
                                  width: 25,
                                ),
                                margin: EdgeInsets.symmetric(horizontal: 12),
                              ),
                            );
                          }),
                          StatefulBuilder(builder: (context, setState) {
                            return InkWell(
                              onTap: () {
                                setState(() {
                                  listItem[index]['isCart'] =
                                  !listItem[index]['isCart'];
                                });
                              },
                              child: CircleAvatar(
                                backgroundColor: listItem[index]['isCart']
                                    ? Colors.orange
                                    : Colors.white,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SvgPicture.asset(
                                    'assets/icons/cart.svg',
                                    width: 25,
                                  ),
                                ),
                              ),
                            );
                          })
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}