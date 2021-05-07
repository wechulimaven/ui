import 'package:coldStorage/models/products.dart';
import 'package:coldStorage/pages/search.dart';
import 'package:coldStorage/screens/productDetailScreen.dart';
import 'package:coldStorage/utilis/config/color.dart';
import 'package:coldStorage/widgets/productDiplay.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../product.dart';

class ProductPage extends StatefulWidget {
  final Product product;

  ProductPage({Key key, this.product}) : super(key: key);

  @override
  _ProductPageState createState() => _ProductPageState(product);
}

class _ProductPageState extends State<ProductPage> {
  final Product product;

  _ProductPageState(this.product);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double bottomPadding = MediaQuery.of(context).padding.bottom;

    return Scaffold(
      backgroundColor: Colors.grey[500],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        iconTheme: IconThemeData(color: darkGrey),
        actions: <Widget>[
          IconButton(
            icon: new SvgPicture.asset(
              'assets/icons/search_icon.svg',
              fit: BoxFit.scaleDown,
            ),
            onPressed: () => Navigator.of(context)
                .push(MaterialPageRoute(builder: (_) => SearchPage())),
          )
        ],
        title: Text(
          product.name,
          style: const TextStyle(
              color: darkGrey, fontWeight: FontWeight.w500, fontSize: 18.0),
        ),
      ),
      body: Stack(
        children: <Widget>[
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 80.0,
                ),
                ProductDisplay(
                  product: product,
                ),
                SizedBox(
                  height: 16.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 16.0),
                  child: Text(
                    product.name,
                    style: const TextStyle(
                        color: darkGrey,
                        fontWeight: FontWeight.w600,
                        fontSize: 20.0),
                  ),
                ),
                SizedBox(
                  height: 24.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Row(
                    children: <Widget>[
                      Container(
                        width: 110,
                        height: 40,
                        decoration: BoxDecoration(
                          color: mediumYellow,
                          borderRadius: BorderRadius.circular(4.0),
                          border:
                              Border.all(color: Color(0xFFFFFFFF), width: 0.5),
                        ),
                        child: Center(
                          child: Text("Safety Guides",
                              style: const TextStyle(
                                  color: darkGrey,
                                  fontWeight: FontWeight.w300,
                                  fontStyle: FontStyle.normal,
                                  fontSize: 13.0)),
                        ),
                      ),
                      Spacer(),
                      InkWell(
                        onTap: () => Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => ProductSheet()
                            // ViewProductPage(
                            //   product: product,
                            // ),
                          ),
                        ),
                        child: Container(
                          width: 140,
                          height: 40,
                          decoration: BoxDecoration(
                            color: mediumYellow,
                            borderRadius: BorderRadius.circular(4.0),
                            border: Border.all(
                                color: Color(0xFFFFFFFF), width: 0.5),
                          ),
                          child: Center(
                            child: Text("View Product Details",
                                style: const TextStyle(
                                    color: darkGrey,
                                    fontWeight: FontWeight.w400,
                                    fontStyle: FontStyle.normal,
                                    fontSize: 15.0)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 16.0,
                ),
                Padding(
                    padding:
                        EdgeInsets.only(left: 20.0, right: 40.0, bottom: 130),
                    child: new Text(product.description,
                        style: const TextStyle(
                            color: Colors.black87,
                            fontWeight: FontWeight.w800,
                            fontFamily: "NunitoSans",
                            fontStyle: FontStyle.normal,
                            fontSize: 16.0)))
              ],
            ),
          ),
          // Align(
          //   alignment: Alignment.bottomCenter,
          //   child: Container(
          //     padding: EdgeInsets.only(
          //         top: 8.0, bottom: bottomPadding != 20 ? 20 : bottomPadding),
          //     decoration: BoxDecoration(
          //         gradient: LinearGradient(
          //             colors: [
          //           Color.fromRGBO(255, 255, 255, 0),
          //           Color.fromRGBO(253, 192, 84, 0.5),
          //           Color.fromRGBO(253, 192, 84, 1),
          //         ],
          //             begin: FractionalOffset.topCenter,
          //             end: FractionalOffset.bottomCenter)),
          //     width: width,
          //     height: 120,
          //     child: Center(child: viewProductButton),
          //   ),
          // ),
        ],
      ),
    );
  }
}
