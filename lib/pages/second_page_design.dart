import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_hero_animations/pages/first_page_design.dart';
import 'package:flutter_hero_animations/product_data_model.dart';

class SecondPageDesign extends StatefulWidget {
  const SecondPageDesign({super.key, required this.product});
  final Product product;

  @override
  State<SecondPageDesign> createState() => _SecondPageDesignState();
}

class _SecondPageDesignState extends State<SecondPageDesign> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple.shade100,
      appBar: AppBar(
        title: Text("Second Page"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Hero(
              // createRectTween is used to change the position and size of the widgets during the transition .
              // createRectTween: _createTween,

              // flightShuttleBuilder is used to set the widget that is used for hero animation or in other word's it is a widget that is used to fly from one location of onr screen to the next one or vice versa .
              // By default the image or the widget on which the hero animation is going to ber performed will be placed there .

              flightShuttleBuilder: (flightContext, animation, flightDirection,
                  fromHeroContext, toHeroContext) {
                Widget fromHero = fromHeroContext.widget;

                return RotationTransition(turns: animation, child: fromHero);
              },
              // Whether to perform the transition or hero animation on back button or by slide the screen (gesture) for go back to previous screen .
              //
              transitionOnUserGestures: true,

              // placeholderBuilder is used to place a widget at the location of the widget or the images on which the hero animation is performing .
              //
              placeholderBuilder: (context, heroSize, child) => Opacity(
                opacity: 0.1,
                child: SizedBox(
                  height: 500,
                  width: 500,
                  child: Image.asset(
                    widget.product.productImageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              // Unique tag for every hero animation (The tag must be unique between hero's and same between the two that are going to be provide the hero animation ) .

              tag: widget.product.productName,
              child: SizedBox(
                height: 500,
                width: 500,
                child: Image.asset(
                  widget.product.productImageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Text(
              widget.product.productName,
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            Text(
              widget.product.productPrice.toString(),
              style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}

// Tween<Rect?> _createTween(Rect? begin, Rect? end) {
//   return CircularRectTween(begin: begin, end: end);
// }

// class CircularRectTween extends Tween<Rect> {
//   @override
//   Rect lerp(double t) {
//     var centerHeight = begin!.top + (begin!.height);
//     var centerWidth = begin!.left + (begin!.width / 2);
//     var radius = lerpDouble(begin!.width, begin!.height, t);

//     return Rect.fromCircle(
//         center: Offset(centerWidth, centerHeight), radius: radius! * 2);
//   }

//   CircularRectTween({super.begin, super.end});
// }
