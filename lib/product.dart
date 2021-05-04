import 'package:coldStorage/models/products.dart';
import 'package:coldStorage/screens/productDetailScreen.dart';
import 'package:coldStorage/utilis/config/color.dart';
import 'package:flutter/material.dart';

class ProductSheet extends StatefulWidget {
  @override
  _ProductSheetState createState() => _ProductSheetState();
}

class _ProductSheetState extends State<ProductSheet> {
  List<Product> products = [
    Product(
        'assets/headphones.png', 'roackerz 400 On-Ear ', 'description', 45.3),
    Product(
        'assets/headphones_2.png', 'roackerz 100 On-Ear ', 'description', 22.3),
    Product(
        'assets/headphones_3.png', 'roackerz 300 On-Ear ', 'description', 58.3),
    Product(
        'assets/headphones_3.png', 'roackerz 300 On-Ear ', 'description', 58.3),
    Product(
        'assets/headphones_3.png', 'roackerz 300 On-Ear ', 'description', 58.3),
    Product(
        'assets/headphones_3.png', 'roackerz 300 On-Ear ', 'description', 58.3)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          // height: 500,
          decoration: BoxDecoration(
            color: yellow,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(24),
              topLeft: Radius.circular(24),
            ),
          ),
          height: MediaQuery.of(context).size.height,
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: products.length,
                // semanticChildCount:1,
                itemBuilder: (_, index) {
                  return Column(
                    children: <Widget>[
                      Products(
                        products[index],
                        onRemove: () {
                          setState(() {
                            products.remove(products[index]);
                          });
                        },
                      ),
                      // index == 4
                      //     ? SizedBox()
                      //     : Container(
                      //         width: 2,
                      //         height: 50,
                      //         color: Color.fromRGBO(100, 100, 100, 0.1))
                    ],
                  );
                }),
          )),
    );
  }
}

class Products extends StatelessWidget {
  final Product product;
  final Function onRemove;

  const Products(this.product, {Key key, this.onRemove}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 16.0),
        width: MediaQuery.of(context).size.width / 2,
        child: Column(
          children: <Widget>[
            ShopProductDisplay(
              product,
              onPressed: onRemove,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                product.name,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: darkGrey,
                  fontSize: 18.0,
                ),
              ),
            ),
            Text(
              '\$${product.price}',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: darkGrey, fontWeight: FontWeight.bold, fontSize: 18.0),
            ),
          ],
        ));
  }
}

class ShopProductDisplay extends StatelessWidget {
  final Product product;
  final Function onPressed;

  const ShopProductDisplay(this.product, {Key key, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (_) => ViewProductPage(
            product: product,
          ),
        ),
      ),
      child: SizedBox(
        height: 150,
        width: 200,
        child: Stack(children: <Widget>[
          Positioned(
            left: 25,
            child: SizedBox(
              height: 150,
              width: 150,
              child: Transform.scale(
                scale: 1.2,
                child: Image.asset('assets/bottom_yellow.png'),
              ),
            ),
          ),
          Positioned(
            left: 50,
            top: 5,
            child: SizedBox(
                height: 80,
                width: 80,
                child: Image.asset(
                  '${product.image}',
                  fit: BoxFit.contain,
                )),
          ),
          // Positioned(
          //   right: 30,
          //   bottom: 25,
          //   // child: Align(
          //   //   child: IconButton(
          //   //     icon: Image.asset('assets/red_clear.png'),
          //   //     onPressed: onPressed,
          //   //   ),
          //   // ),
          // )
        ]),
      ),
    );
  }
}
