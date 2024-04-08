import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

const Color dark = Colors.black;

List<Color> colors = [
  Colors.red,
  Colors.blue,
  Colors.purple,
  Colors.amber,
  Colors.cyan
];
const heading1 =
    TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold);
const Color bottomnavcolor = Color.fromARGB(255, 29, 29, 29);

const Map<bool, TextStyle> selandunseltextstyle = {
  false:
      TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w700),
  true: TextStyle(color: dark, fontSize: 15, fontWeight: FontWeight.w700)
};
const Map<bool, BoxDecoration> containerdec={
  false:BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10))),
  true:BoxDecoration(color:Colors.white ,borderRadius: BorderRadius.all(Radius.circular(10)))
};
CarouselOptions carouselOptions = CarouselOptions(
  height: 250,
  aspectRatio: 16 / 11,
  viewportFraction: 0.5,
  initialPage: 0,
  enableInfiniteScroll: true,
  reverse: false,
  autoPlay: true,
  autoPlayInterval: const Duration(seconds: 4),
  autoPlayAnimationDuration: const Duration(milliseconds: 1000),
  autoPlayCurve: Curves.fastOutSlowIn,
  enlargeCenterPage: true,
  enlargeFactor: 0.3,
  // onPageChanged: callbackFunction,
  scrollDirection: Axis.horizontal,
);

BoxDecoration decoration(String path)=>BoxDecoration(borderRadius: BorderRadius.circular(10),
image: DecorationImage(image: NetworkImage(path,),fit: BoxFit.cover));