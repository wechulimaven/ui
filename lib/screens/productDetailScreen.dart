import 'package:coldStorage/models/products.dart';
import 'package:coldStorage/pages/moreProducts.dart';
import 'package:coldStorage/pages/search.dart';
import 'package:coldStorage/utilis/config/color.dart';
import 'package:coldStorage/widgets/cartBottomSheet.dart';
import 'package:coldStorage/widgets/productCardOptions.dart';
import 'package:coldStorage/widgets/ratingBottomSheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'checkout.dart';


class ViewProductPage extends StatefulWidget {
  final Product product;

  ViewProductPage({Key key, this.product}) : super(key: key);

  @override
  _ViewProductPageState createState() => _ViewProductPageState(product);
}

class _ViewProductPageState extends State<ViewProductPage> {
  final Product product;

  _ViewProductPageState(this.product);

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  int active;

  ///list of product colors
  List<Widget> colors() {
    List<Widget> list = [];
    for (int i = 0; i < 5; i++) {
      list.add(
        InkWell(
          onTap: () {
            setState(() {
              active = i;
            });
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 8.0),
            child: Transform.scale(
              scale: active == i ? 1.2 : 1,
              child: Card(
                elevation: 3,
                color: Colors.primaries[i],
                child: SizedBox(
                  height: 32,
                  width: 32,
                ),
              ),
            ),
          ),
        ),
      );
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    Widget description = Padding(
      padding: const EdgeInsets.all(24.0),
      child: Text(
        product.description,
        maxLines: 5,
        semanticsLabel: '...',
        overflow: TextOverflow.ellipsis,
        style: TextStyle(color: darkGrey),
      ),
    );

    return Scaffold(
        key: _scaffoldKey,
        backgroundColor: Color.fromRGBO(255, 255, 255, 0.9),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          iconTheme: IconThemeData(color: darkGrey),
          actions: <Widget>[
            IconButton(
              icon: new SvgPicture.asset('assets/icons/search_icon.svg', fit: BoxFit.scaleDown,),
              onPressed: () => Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => SearchPage())),
            )
          ],
          title: Text(
            product.name,
            style: const TextStyle(
                color: darkGrey,
                fontWeight: FontWeight.w500,
                fontFamily: "Montserrat",
                fontSize: 18.0),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: <Widget>[
                ProductOption(
                  _scaffoldKey,
                  product: product,
                ),
                description,
                Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Row(mainAxisSize: MainAxisSize.min, children: <Widget>[
                    // Flexible(
                    //   child: ColorList([
                    //     Colors.red,
                    //     Colors.blue,
                    //     Colors.purple,
                    //     Colors.green,
                    //     Colors.yellow
                    //   ]),
                    // ),
                    RawMaterialButton(
                      onPressed: () {
                        showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              return RatingBottomSheet(product: product,);
                            },
                            //elevation: 0,
                            //backgroundColor: Colors.transparent
                        );
                      },
                      constraints:
                          const BoxConstraints(minWidth: 45, minHeight: 45),
                      child: Icon(Icons.star_rate_sharp,
                          color: Color.fromRGBO(255, 137, 147, 1)),
                      elevation: 0.0,
                      shape: CircleBorder(),
                      fillColor: darkGrey,
                    ),
                  ]),
                ),
                MoreProducts()
              ],
            ),
          ),
        ));
  }
}

class ProductOption extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  final Product product;
  const ProductOption(this.scaffoldKey, {Key key, this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Stack(
        children: <Widget>[
          Positioned(
            left: 16.0,
            child: Image.asset(
              product.image,
              height: 200,
              width: 200,
            ),
          ),
          Positioned(
            right: 0.0,
            child: Container(
              height: 180,
              width: 300,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Text(product.name,
                        textAlign: TextAlign.right,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: darkGrey,
                            shadows: shadow)),
                  ),
                  InkWell(
                    onTap: () async {
                      Navigator.of(context).push(MaterialPageRoute(builder: (_)=>CheckOutPage()));

                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width / 2.5,
                      decoration: BoxDecoration(
                          color: Colors.red,
                          gradient: mainButton,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10.0),
                              bottomLeft: Radius.circular(10.0))),
                      padding: EdgeInsets.symmetric(vertical: 16.0),
                      child: Center(
                        child: Text(
                          'Buy Now',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      scaffoldKey.currentState.showBottomSheet((context) {
                        return ShopBottomSheet();
                      });
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width / 2.5,
                      decoration: BoxDecoration(
                          color: Colors.red,
                          gradient: mainButton,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10.0),
                              bottomLeft: Radius.circular(10.0))),
                      padding: EdgeInsets.symmetric(vertical: 16.0),
                      child: Center(
                        child: Text(
                          'Add to cart',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
