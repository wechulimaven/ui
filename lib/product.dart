import 'package:coldStorage/models/products.dart';
import 'package:coldStorage/screens/productDetailScreen.dart';
import 'package:coldStorage/utilis/config/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'pages/productPage.dart';

class ProductSheets extends StatefulWidget {
  @override
  _ProductSheetsState createState() => _ProductSheetsState();
}

class _ProductSheetsState extends State<ProductSheets> {
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
    return Scaffold(
      // backgroundColor: yellow,
      body: Container(
          decoration: BoxDecoration(
            gradient: RadialGradient(
                colors: [ yellow, yellow
                  // Color(0xff36E892),
                  // Color(0xff33B2B9)
                  // Colors.grey[500], Colors.grey[700]
                ],
                center: Alignment(0, 0),
                radius: 0.6,
                focal: Alignment(0, 0),
                focalRadius: 0.1),
          ),
          padding: EdgeInsets.symmetric(vertical: 16.0),
          width: MediaQuery.of(context).size.width / 2,
          // height: ,
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
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: darkGrey,
                    fontSize: 18.0,
                  ),
                ),
              ),
              Text(
                '\$${product.price}',
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: darkGrey,
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0),
              ),
            ],
          )),
    );
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
        height: 158,
        width: 200,
        child: Stack(children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
            child: InkWell(
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (_) => ProductPage(product: product))),
              child: Container(
                  decoration: BoxDecoration(
                    gradient: RadialGradient(
                        colors: [
                        yellow, yellow
                          // Color(0xff36E892),
                          // Color(0xff33B2B9)
                          // Colors.grey[500], Colors.grey[700]
                        ],
                        center: Alignment(0, 0),
                        radius: 0.6,
                        focal: Alignment(0, 0),
                        focalRadius: 0.1),
                  ),
                  child: Hero(
                      tag: product.image, child: Image.asset(product.image))),
            ),
          ),

          // Positioned(
          //   left: 25,
          //   child: SizedBox(
          //     height: 150,
          //     width: 150,
          //     child: Transform.scale(
          //       scale: 1.2,
          //       child: Image.asset('assets/bottom_yellow.png'),
          //     ),
          //   ),
          // ),
          // Positioned(
          //   left: 50,
          //   top: 5,
          //   child: SizedBox(
          //       height: 80,
          //       width: 80,
          //       child: Image.asset(
          //         '${product.image}',
          //         fit: BoxFit.contain,
          //       )),
          // ),
        ]),
      ),
    );
  }
}

class ProductSheet extends StatefulWidget {
  @override
  _ProductSheetState createState() => _ProductSheetState();
}

class _ProductSheetState extends State<ProductSheet> {
  List<Product> products = [
    Product('assets/bag_1.png', 'Bag', 'Beautiful bag', 2.33),
    Product('assets/cap_5.png', 'Cap', 'Cap with beautiful design', 10),
    Product('assets/jeans_1.png', 'Jeans', 'Jeans for you', 20),
    Product('assets/womanshoe_3.png', 'Woman Shoes',
        'Shoes with special discount', 30),
    Product('assets/bag_10.png', 'Bag Express', 'Bag for your shops', 40),
    Product('assets/jeans_3.png', 'Jeans', 'Beautiful Jeans', 102.33),
    Product('assets/ring_1.png', 'Silver Ring', 'Description', 52.33),
    Product('assets/shoeman_7.png', 'Shoes', 'Description', 62.33),
    Product('assets/headphone_9.png', 'Headphones', 'Description', 72.33),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 20,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                IntrinsicHeight(
                  child: Container(
                    margin: const EdgeInsets.only(left: 16.0, right: 8.0),
                    width: 4,
                    color: mediumYellow,
                  ),
                ),
                Center(
                    child: Text(
                  'Recommended',
                  style: TextStyle(
                      color: darkGrey,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold),
                )),
              ],
            ),
          ),
          Flexible(
            child: Container(
              padding: EdgeInsets.only(top: 16.0, right: 16.0, left: 16.0),
              child: StaggeredGridView.countBuilder(
                physics: AlwaysScrollableScrollPhysics(),
                // NeverScrollableScrollPhysics(),
                padding: EdgeInsets.zero,
                crossAxisCount: 4,
                itemCount: products.length,
                itemBuilder: (BuildContext context, int index) => Products(
                  products[index],
                  onRemove: () {
                    setState(() {
                      products.remove(products[index]);
                    });
                  },
                ),
                // ClipRRect(
                //   borderRadius: BorderRadius.all(Radius.circular(5.0)),
                //   child: InkWell(
                //     onTap: () => Navigator.of(context).push(MaterialPageRoute(
                //         builder: (_) => ProductPage(product: products[index]))),
                //     child: Container(
                //       decoration: BoxDecoration(
                //         gradient: RadialGradient(
                //             colors: [Colors.grey[500], Colors.grey[700]],
                //             center: Alignment(0, 0),
                //             radius: 0.6,
                //             focal: Alignment(0, 0),
                //             focalRadius: 0.1),
                //       ),
                //       child: ShopProductDisplay(products[index])
                //       // child: Hero(
                //       //   tag: products[index].image,
                //       //   child: ShopProductDisplay(
                //       //     products[index],
                //       //     // onPressed: onRemove,
                //       //   ),
                //       //   // Image.asset(products[index].image),
                //       // ),
                //     ),
                //   ),
                // ),
                staggeredTileBuilder: (int index) =>
                    new StaggeredTile.count(2, index.isEven ? 3 : 4),
                mainAxisSpacing: 4.0,
                crossAxisSpacing: 4.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
