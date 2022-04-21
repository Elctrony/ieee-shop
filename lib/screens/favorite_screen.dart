import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../utils/colors.dart';

class FavoriteScreen extends StatelessWidget {
   FavoriteScreen({Key? key}) : super(key: key);

  late List favoriteList =[];

  @override
  Widget build(BuildContext context) {
    favoriteList = ModalRoute.of(context)?.settings.arguments as List;
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.9),
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.arrow_back), onPressed: () {
          Navigator.of(context).pop('Favorite');
        },),
        title: Text('Favorite Items'),
        backgroundColor: Colors.orange,

      ),
      body: Container(
        padding: EdgeInsets.only(top: 8, right: 12, left: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: favoriteList.length,
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
                        child: Image.asset(favoriteList[index]['img']),
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
                                favoriteList[index]['title'],
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w400),
                              ),
                              Text(
                                favoriteList[index]['description'],
                                style: TextStyle(
                                    fontSize: 13, fontWeight: FontWeight.w300),
                              ),
                              Text(
                                '\$${favoriteList[index]['price']}',
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
                                  favoriteList[index]['isFav'] =
                                  !favoriteList[index]['isFav'];
                                });

                              },
                              child: Container(
                                child: SvgPicture.asset(
                                   'assets/icons/fav.svg'
                                      ,
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
                                  favoriteList[index]['isCart'] =
                                  !favoriteList[index]['isCart'];
                                });
                              },
                              child: CircleAvatar(
                                backgroundColor: favoriteList[index]['isCart']
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
