import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:layout/pages/home/detail.dart';

class HomePage extends StatefulWidget {
  // const HomePage({ Key? key }) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final urlImageCarousel = [
    'https://cdn.pixabay.com/photo/2016/11/19/14/00/code-1839406_960_720.jpg',
    'https://cdn.pixabay.com/photo/2021/08/17/10/23/flowers-6552611_960_720.jpg',
    'https://cdn.pixabay.com/photo/2021/08/17/14/48/sea-6553205_960_720.jpg',
    'https://cdn.pixabay.com/photo/2020/12/16/14/56/farm-5836815_960_720.jpg',
    'https://cdn.pixabay.com/photo/2021/08/10/18/32/cat-6536684_960_720.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: const EdgeInsets.all(20),
            child: FutureBuilder(
              builder: (context, snapshot) {
                var data = json.decode(snapshot.data.toString());
                return ListView.builder(
                  itemBuilder: (BuildContext context, int index) {
                    return MyBox(
                      data[index]['title'], 
                      data[index]['subtitle'],
                      data[index]['img_url'],
                      data[index]['detail']
                    );
                  },
                  itemCount: data.length,
                );
              },
              future:
                  DefaultAssetBundle.of(context).loadString('assets/data.json'),
            )));
  }

  @override
  Widget MyBox(String title, String subtitle, String img_url, String detail) {
    var v1, v2, v3, v4;
    v1 = title;
    v2 = subtitle;
    v3 = img_url;
    v4 = detail;
    return Container(
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
          //color: Colors.blue[100],
          image: DecorationImage(
              image: NetworkImage(img_url),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.5), BlendMode.darken)),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.3),
                offset: Offset(
                  5, // Move to right 5  horizontally
                  5, // Move to bottom 5 Vertically
                ),
                blurRadius: 5,
                spreadRadius: 0)
          ]),
      height: 200,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
                fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
          ),
          Text(
            subtitle,
            style: TextStyle(fontSize: 12, color: Colors.white),
          ),
          SizedBox(
            height: 10,
          ),
          TextButton(
              onPressed: () {
                // print("next page >>>");
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => DetailPage(v1,v2,v3,v4)));
              },
              child: Text("Read Me"))
        ],
      ),
    );
  }

  @override
  Widget CarouselSliderBanner() {
    return Container(
      child: CarouselSlider.builder(
        itemCount: urlImageCarousel.length,
        itemBuilder: (context, index, realIndex) {
          final urlBannerCarousel = urlImageCarousel[index];

            return buildImageBanner(urlBannerCarousel, index);
      },
      options: CarouselOptions(
        height: 150,
        aspectRatio: 2.0,
        viewportFraction: 1,
        initialPage: 2,
        enableInfiniteScroll: true,
        reverse: false,
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 3),
        autoPlayAnimationDuration: Duration(milliseconds: 800),
        autoPlayCurve: Curves.fastOutSlowIn,
        enlargeCenterPage: true,
        scrollDirection: Axis.horizontal,
      ),
    ));
  }

  @override
  Widget buildImageBanner(String urlBannerCarousel, int index) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5.0),
      decoration: BoxDecoration(
          image: DecorationImage(
        image: NetworkImage(urlBannerCarousel),
        fit: BoxFit.cover,
      )),
    );
  }
}
