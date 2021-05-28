import 'package:flutter/material.dart';
import 'package:learn1/screensize.dart';
import 'Product.dart';

class ItemCard extends StatelessWidget {
  final Product product;
  final Function press;
  ItemCard({
    this.product,
    this.press,
  });

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double width = SizeConfig.blockSizeWidth;
    return GestureDetector(
      onTap: press,
      child: Stack(
        children: [
          Center(
            child: Container(
              width: width * 60,
              height: width * 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(width * 5),
              ),
              child: AnimatedContainer(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(width * 5),
                  color: product.isselected
                      ? Colors.lightBlue.shade400
                      : Colors.lightBlue.shade200,
                  border: Border.all(
                    width: width * 0.7,
                    color: product.isselected
                        ? Colors.lightBlue.shade700
                        : Colors.lightBlue.withOpacity(0.5),
                  ),
                ),
                duration: Duration(seconds: 1),
                curve: Curves.fastLinearToSlowEaseIn,
                alignment: product.isselected
                    ? Alignment.center
                    : AlignmentDirectional.topCenter,
                child: Image.asset(
                  product.image,
                ),
              ),
            ),
          ),
          AnimatedDefaultTextStyle(
            duration: Duration(milliseconds: 300),
            curve: Curves.bounceInOut,
            style: TextStyle(
              fontFamily: 'Play',
              fontSize: product.isselected ? width * 5 : width * 4,
              color: Colors.black,
              fontWeight: FontWeight.normal,
            ),
            child: Align(
              alignment: product.isselected
                  ? Alignment.topLeft
                  : Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(
                    left: width * 4, top: width * 4, bottom: width * 4),
                child: Text(
                  product.title,
                  textAlign: TextAlign.left,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final Category category;
  final Function press;
  final Function onPressed;
  ProductCard({
    this.category,
    this.press,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double width = SizeConfig.blockSizeWidth;
    return GestureDetector(
      onTap: press,
      child: Card(
        margin: EdgeInsets.all(width * 3),
        elevation: 10,
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: category.isselected
                    ? Icon(
                        Icons.shopping_cart,
                      )
                    : Icon(
                        Icons.shopping_cart_outlined,
                      ),
              ),
            ),
            Column(
              children: [
                Container(
                  width: width * 100,
                  //height: height*100,
                  child: Expanded(
                    child: Image.asset(
                      category.image,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: width * 1, top: width * 1, bottom: width * 1),
                    child: Text(
                      category.title,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Play',
                          fontWeight: FontWeight.bold,
                          fontSize: width * 5),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: width * 1, top: width * 1, bottom: width * 1),
                    child: Text(
                      category.subtitle,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: Colors.black.withOpacity(0.7),
                          fontFamily: 'Play',
                          fontWeight: FontWeight.normal,
                          fontSize: width * 3),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
