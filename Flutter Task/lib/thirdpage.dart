import 'package:animated_icon_button/animated_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:learn1/components/item_card.dart';
import 'package:learn1/screensize.dart';
import 'components/Product.dart';

class Thridpage extends StatefulWidget {
  @override
  _ThridpageState createState() => _ThridpageState();
}

class _ThridpageState extends State<Thridpage> {
  int _selectedIndex = 0;
  bool isselected = false;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double width = SizeConfig.blockSizeWidth;
    double height = SizeConfig.blockSizeHeight;
    List<Widget> _widgetOptions = <Widget>[
      Container(
        width: width * 100,
        height: height * 100,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: height * 4,
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Text(
                'Create your store',
                style: TextStyle(
                    fontFamily: 'Play',
                    color: Color(0xff41444b).withOpacity(0.8),
                    fontWeight: FontWeight.bold,
                    fontSize: width * 5),
              ),
            ),
            SizedBox(
              height: height * 2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                    margin: EdgeInsets.only(left: width * 1),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(width * 4.0),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 2.0,
                          spreadRadius: 0.0,
                          offset: Offset(
                              2.0, 2.0), // shadow direction: bottom right
                        )
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(width * 2.0),
                          child: Icon(
                            Icons.search,
                            size: width * 5,
                          ),
                        ),
                        Container(
                          width: width * 30,
                          child: TextField(
                            onChanged: (String value) {},
                            obscureText: false,
                            cursorColor: Color(0xff41444b),
                            style: TextStyle(
                                fontFamily: 'Play',
                                fontWeight: FontWeight.normal,
                                color: Color(0xff41444b),
                                fontSize: width * 4),
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.fromLTRB(width * 2.0,
                                  width * 2.0, width * 1.0, width * 2.0),
                              hintText: "Search Store",
                              hintStyle: TextStyle(
                                  fontFamily: 'Play',
                                  color: Color(0xff41444b).withOpacity(0.8),
                                  fontWeight: FontWeight.normal,
                                  fontSize: width * 4),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(width * 2.0),
                          child: Icon(
                            Icons.mic,
                            size: width * 5,
                          ),
                        ),
                      ],
                    ) // child widget, replace with your own
                    ),
                Container(
                    margin: EdgeInsets.only(left: width * 1),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(width * 4.0),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 2.0,
                          spreadRadius: 0.0,
                          offset: Offset(
                              2.0, 2.0), // shadow direction: bottom right
                        )
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(width * 2.0),
                          child: Icon(
                            Icons.photo_camera,
                            size: width * 5,
                          ),
                        ),
                        Container(
                          width: width * 30,
                          child: TextField(
                            onChanged: (String value) {},
                            enabled: false,
                            obscureText: false,
                            cursorColor: Color(0xff41444b),
                            style: TextStyle(
                                fontFamily: 'Play',
                                fontWeight: FontWeight.normal,
                                color: Color(0xff41444b),
                                fontSize: width * 4),
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.fromLTRB(width * 2.0,
                                  width * 2.0, width * 1.0, width * 2.0),
                              hintText: "Vitual Search",
                              hintStyle: TextStyle(
                                  fontFamily: 'Play',
                                  color: Color(0xff41444b).withOpacity(0.8),
                                  fontWeight: FontWeight.normal,
                                  fontSize: width * 4),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(width * 2.0),
                          child: Icon(
                            Icons.mic,
                            size: width * 5,
                          ),
                        ),
                      ],
                    ) // child widget, replace with your own
                    ),
              ],
            ),
            SizedBox(
              height: height * 3,
            ),
            Expanded(
              child: GridView.builder(
                  padding: EdgeInsets.only(
                      left: width * 2, right: width * 2, bottom: 0),
                  itemCount: products.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: width * 2,
                    crossAxisSpacing: width * 2,
                    //childAspectRatio: 0.75,
                  ),
                  itemBuilder: (context, index) => ItemCard(
                        product: products[index],
                        press: () {
                          setState(() {
                            products[index].isselected =
                                !products[index].isselected;
                          });
                        },
                      )),
            ),
          ],
        ),
      ),
      Text(
        'Oders',
      ),
      Container(
        width: width * 100,
        height: height * 100,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: height * 4,
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Text(
                'Explore store and products here',
                style: TextStyle(
                    fontFamily: 'Play',
                    color: Color(0xff41444b).withOpacity(0.8),
                    fontWeight: FontWeight.bold,
                    fontSize: width * 5),
              ),
            ),
            SizedBox(
              height: height * 2,
            ),
            Padding(
              padding: EdgeInsets.only(left: width * 8.0, right: width * 8),
              child: Container(
                  margin: EdgeInsets.only(left: width * 1),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(width * 4.0),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 2.0,
                        spreadRadius: 0.0,
                        offset:
                            Offset(2.0, 2.0), // shadow direction: bottom right
                      )
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(width * 2.0),
                        child: Icon(
                          Icons.search,
                          size: width * 6,
                        ),
                      ),
                      Container(
                        width: width * 30,
                        child: TextField(
                          onChanged: (String value) {},
                          obscureText: false,
                          cursorColor: Color(0xff41444b),
                          style: TextStyle(
                              fontFamily: 'Play',
                              fontWeight: FontWeight.normal,
                              color: Color(0xff41444b),
                              fontSize: width * 6),
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.fromLTRB(width * 2.0,
                                width * 2.0, width * 1.0, width * 2.0),
                            hintText: "Search Store",
                            hintStyle: TextStyle(
                                fontFamily: 'Play',
                                color: Color(0xff41444b).withOpacity(0.8),
                                fontWeight: FontWeight.normal,
                                fontSize: width * 5),
                          ),
                        ),
                      ),
                      AnimatedIconButton(
                        size: width * 6,
                        onPressed: () {},
                        duration: const Duration(milliseconds: 200),
                        icons: const <AnimatedIconItem>[
                          AnimatedIconItem(
                            icon: Icon(
                              Icons.photo_camera,
                              color: Colors.black,
                            ),
                            backgroundColor: Colors.white,
                          ),
                          AnimatedIconItem(
                            icon: Icon(
                              Icons.photo_camera_outlined,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      AnimatedIconButton(
                        size: width * 6,
                        onPressed: () {},
                        duration: const Duration(milliseconds: 200),
                        icons: const <AnimatedIconItem>[
                          AnimatedIconItem(
                            icon: Icon(
                              Icons.mic,
                              color: Colors.black,
                            ),
                            backgroundColor: Colors.white,
                          ),
                          AnimatedIconItem(
                            icon: Icon(
                              Icons.mic_none_outlined,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ],
                  )),
            ),
            SizedBox(
              height: height * 3,
            ),
            Expanded(
              child: ListView.builder(
                  padding: EdgeInsets.only(
                      left: width * 2, right: width * 2, bottom: 0),
                  itemCount: category.length,
                  itemBuilder: (context, index) => ProductCard(
                        category: category[index],
                        press: () {
                          setState(() {
                            category[index].isselected =
                                !category[index].isselected;
                          });
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              behavior: SnackBarBehavior.floating,
                              elevation: 0.4,
                              duration: Duration(milliseconds: 500),
                              backgroundColor: Colors.lightBlue,
                              //padding: EdgeInsets.all(width*4),
                              content: Padding(
                                padding: EdgeInsets.all(width * 2.0),
                                child: Text(category[index].description,
                                    textAlign: TextAlign.justify,
                                    style: TextStyle(
                                        fontFamily: 'Play',
                                        fontSize: width * 4,
                                        color: Colors.black)),
                              )));
                        },
                      )),
            ),
          ],
        ),
      ),
      Text(
        'Share',
      ),
      Text(
        'Profile',
      ),
    ];
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        elevation: 12,
        backgroundColor: Colors.blue,
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: TextStyle(
            fontFamily: 'Play',
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: width * 4),
        unselectedLabelStyle: TextStyle(
            fontFamily: 'Play',
            color: Colors.black,
            fontWeight: FontWeight.normal,
            fontSize: width * 3),
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_outlined,
            ),
            label: 'Home',
            activeIcon: Icon(
              Icons.home,
              size: width * 7,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.receipt_long_rounded),
            label: 'Orders',
            activeIcon: Icon(
              Icons.receipt_long,
              size: width * 7,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle_outline),
            label: 'Categories',
            activeIcon: Icon(
              Icons.add_circle,
              size: width * 7,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.share_outlined),
            label: 'Share',
            activeIcon: Icon(
              Icons.share_rounded,
              size: width * 7,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Profile',
            activeIcon: Icon(
              Icons.person,
              size: width * 7,
            ),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        onTap: _onItemTapped,
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
    );
  }
}
