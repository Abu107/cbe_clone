import "dart:math";

import "package:cbe/classes/colors.dart";
import "package:cbe/main.dart";
import "package:cbe/screens/account.dart";
import "package:cbe/screens/home.dart";
import "package:cbe/screens/recent.dart";
import "package:cbe/screens/share.dart";
import "package:flutter/material.dart";
import "package:flutter/rendering.dart";
import "package:font_awesome_flutter/font_awesome_flutter.dart";
import "package:get/get.dart";

class home_page extends StatefulWidget {
  home_page({super.key});
  @override
  State<home_page> createState() => _home_pageState();
}

class _home_pageState extends State<home_page> {
  bool _showFloatinAction = false;
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    HomePa(),
    Share(),
    Account(),
    Recent(),
  ];

  void _onItemTapped(int index) {
    switch (index) {
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Share()),
        );
        break;
    }
    setState(() {
      _selectedIndex = index;
    });
  }

  void _showFLoatingActionToggle() {
    setState(() {
      _showFloatinAction = !_showFloatinAction;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _selectedIndex == 1
          ? null
          : Center(
              child: _widgetOptions.elementAt(_selectedIndex),
            ),
      floatingActionButton: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            //if (_showFloatinAction) FloatnigClass(),
            Container(
              decoration: BoxDecoration(
                  color: myColors.main_color,
                  borderRadius: BorderRadius.circular(30)),
              child: IconButton(
                icon: !_showFloatinAction
                    ? Icon(
                        Icons.qr_code,
                        size: 40,
                      )
                    : Transform.rotate(
                        angle: 45 * pi / 180,
                        child: Icon(
                          Icons.qr_code,
                          size: 40,
                        ),
                      ),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return Theme(
                        data: ThemeData(
                          colorScheme:
                              ColorScheme.fromSeed(seedColor: Colors.white),
                        ),
                        child: Dialog(
                          backgroundColor: Colors.transparent,
                          alignment: Alignment.lerp(Alignment.centerRight,
                              Alignment.bottomCenter, .6),
                          insetPadding: EdgeInsets.zero,
                          shape: BeveledRectangleBorder(),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            //alignment: Alignment.bottomLeft,
                            children: [
                              Positioned(
                                // top: 200,
                                child: Container(
                                  margin: EdgeInsets.only(right: 20),
                                  height:
                                      (MediaQuery.of(context).size.height) / 4,
                                  child: FloatnigClass(),
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  );
                  setState(() {
                    //_showFLoatingActionToggle();
                  });
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Image.asset('assets/icons/home.png', width: 20, height: 20),
              label: 'Home',
              backgroundColor: myColors.main_color,
            ),
            BottomNavigationBarItem(
              icon: Image.asset('assets/icons/charity.png',
                  width: 20, height: 20),
              label: 'Share',
              backgroundColor: myColors.main_color,
            ),
            BottomNavigationBarItem(
              icon: Image.asset('assets/icons/balance.png',
                  width: 20, height: 20),
              label: 'Account',
              backgroundColor: myColors.main_color,
            ),
            BottomNavigationBarItem(
              icon:
                  Image.asset('assets/icons/recent.png', width: 20, height: 20),
              label: 'Recent',
              backgroundColor: myColors.main_color,
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.white,
          onTap: _onItemTapped),
    );
  }

  Widget callFloatingAction() {
    return Column(
      children: [
        floatingAct("Receive Money", Icons.attach_money),
        floatingAct("Scan QR", Icons.qr_code),
        floatingAct("Verify REceipt", Icons.receipt_sharp),
      ],
    );
  }

  Widget floatingAct(String text, IconData iconData) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
            color: Colors.white,
            padding: EdgeInsets.all(5),
            child: Text(
              text,
              style: TextStyle(color: Colors.black),
            )),
        Container(
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.only(left: 15, bottom: 10),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(50))),
          child: Icon(
            iconData,
            size: 35,
          ),
        ),
      ],
    );
  }
}

int currentInd = 0;

class FloatnigClass extends StatelessWidget {
  const FloatnigClass({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Color.fromRGBO(0, 0, 0, .6),
      height: 50,
      child: callFloatingAction(),
    );
  }

  Widget callFloatingAction() {
    return Column(
      children: [
        floatingAct("Receive Money", Icons.attach_money),
        floatingAct("Scan QR", Icons.qr_code),
        floatingAct("Verify REceipt", Icons.receipt_sharp),
      ],
    );
  }

  Widget floatingAct(String text, IconData iconData) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
            color: Colors.white,
            padding: EdgeInsets.all(5),
            child: Text(
              text,
              style: TextStyle(color: Colors.black),
            )),
        Container(
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.only(left: 15, bottom: 10),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(50))),
          child: Icon(
            iconData,
            size: 35,
          ),
        ),
      ],
    );
  }
}
