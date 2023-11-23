import 'package:flutter/material.dart';
import 'package:flutter_hero_animations/pages/second_page_design.dart';
import 'package:flutter_hero_animations/product_data_model.dart';

class FirstPageDesign extends StatefulWidget {
  const FirstPageDesign({super.key});

  @override
  State<FirstPageDesign> createState() => _FirstPageDesignState();
}

List<Product> products = <Product>[
  Product(
      productName: "Cream",
      productPrice: 200,
      productImageUrl: "assets/images/cream.png"),
  Product(
      productName: "Freezer",
      productPrice: 80000,
      productImageUrl: "assets/images/freezer.png"),
  Product(
      productName: "Iron",
      productPrice: 5000,
      productImageUrl: "assets/images/iron.png"),
  Product(
      productName: "Jacket",
      productPrice: 4000,
      productImageUrl: "assets/images/jacket.png"),
  Product(
      productName: "Parfum",
      productPrice: 800,
      productImageUrl: "assets/images/parfum.png"),
  Product(
      productName: "Slippers",
      productPrice: 500,
      productImageUrl: "assets/images/slippers.png"),
  Product(
      productName: "Refrigerator",
      productPrice: 40000,
      productImageUrl: "assets/images/refrigerator.png"),
  Product(
      productName: "Sneakers",
      productPrice: 700,
      productImageUrl: "assets/images/sneakers.png"),
  Product(
      productName: "Washing Machine",
      productPrice: 50000,
      productImageUrl: "assets/images/washing_machine.png")
];

// late AnimationController animationController;
// late Animation<Offset> animation;

class _FirstPageDesignState extends State<FirstPageDesign>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    // animationController = AnimationController(vsync: this);
    // animation = Tween<Offset>(begin: Offset(-1, -1), end: Offset(0, 0))
    //     .animate(animationController);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.teal.shade100,
        appBar: AppBar(
          title: Text("First Page Design"),
          centerTitle: true,
        ),
        body: ListView.builder(
            itemCount: products.length,
            itemBuilder: (context, index) => Padding(
                  padding: EdgeInsets.all(20),
                  child: Container(
                    height: 200,
                    color: Colors.amber.shade100,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              // animationController.forward();
                            });
                            Navigator.of(context).push(PageRouteBuilder(
                              transitionsBuilder: (context, animation,
                                      secondaryAnimation, child) =>
                                  SlideTransition(
                                      position: animation.drive(Tween<Offset>(
                                          begin: Offset(1, 0),
                                          end: Offset(0, 0))),
                                      child: child),
                              pageBuilder: (context, animation,
                                      secondaryAnimation) =>
                                  SecondPageDesign(product: products[index]),
                              transitionDuration: const Duration(seconds: 3),
                              reverseTransitionDuration:
                                  const Duration(seconds: 3),
                            ));
                          },
                          child: Hero(
                            tag: products[index].productName,
                            child: CircleAvatar(
                              backgroundColor: Colors.transparent,
                              radius: 80,
                              foregroundImage: AssetImage(
                                products[index].productImageUrl,
                              ),
                            ),
                          ),
                        ),
                        Text(
                          products[index].productName.toString(),
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          products[index].productPrice.toString(),
                          style: TextStyle(
                              fontSize: 25, fontStyle: FontStyle.italic),
                        ),
                      ],
                    ),
                  ),
                )));
  }
}
