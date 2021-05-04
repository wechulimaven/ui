import 'package:coldStorage/models/category.dart';
import 'package:coldStorage/utilis/config/color.dart';
import 'package:coldStorage/widgets/gridStaggeredCategory.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PromoListPage extends StatefulWidget {
  @override
  _PromoListPageState createState() => _PromoListPageState();
}

class _PromoListPageState extends State<PromoListPage> {
  List<Category> categories = [
    Category(
      Color(0xffFCE183),
      Color(0xffF68D7F),
      'Buy Airtime',
      'assets/jeans_5.png',
    ),
    Category(
      Color(0xffF749A2),
      Color(0xffFF7375),
      'Clothes',
      'assets/jeans_5.png',
    ),
    Category(
      Color(0xff00E9DA),
      Color(0xff5189EA),
      'Fashion',
      'assets/jeans_5.png',
    ),
    Category(
      Color(0xffAF2D68),
      Color(0xff632376),
      'Home',
      'assets/jeans_5.png',
    ),
    Category(
      Color(0xff36E892),
      Color(0xff33B2B9),
      'Beauty',
      'assets/jeans_5.png',
    ),
    Category(
      Color(0xffF123C4),
      Color(0xff668CEA),
      'Appliances',
      'assets/jeans_5.png',
    ),
  ];

  List<Category> searchResults;
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    searchResults = categories;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
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
                child: Flexible(
                  child: ListView.builder(
                    itemCount: searchResults.length,
                    itemBuilder: (_, index) => Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 16.0,
                      ),
                      child: StaggeredCardCard(
                        begin: searchResults[index].begin,
                        end: searchResults[index].end,
                        categoryName: searchResults[index].category,
                        assetPath: searchResults[index].image,
                      ),
                    ),
                  ),
                )))
      ],
    );
  }
}


