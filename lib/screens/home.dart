import 'package:cbe/classes/applocalization.dart';
import 'package:cbe/classes/sharedpreferenceHelper.dart';
import 'package:cbe/classes/time.dart';
import 'package:cbe/home_page.dart';
import 'package:cbe/main.dart';
import 'package:cbe/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:cbe/classes/colors.dart';
import 'package:cbe/widgets/languageChange.dart';

class HomePa extends StatefulWidget {
  const HomePa({super.key});
  @override
  State<HomePa> createState() => _HomePaState();
}

class _HomePaState extends State<HomePa> {
  bool isEng = true;
  String balance = "22100";
  String nameKey = "_key_name";
  final timerCheck time = new timerCheck();
  //String data="";
  bool showBalance = false;
  @override
  void initState() {
    super.initState();
    time.date();
  }

  Future<bool> _showExitConfirmationDialog(BuildContext context) async {
    return await showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  backgroundColor: Colors.white,
                  content: Text(
                    "Are you sure to logut?",
                    style: TextStyle(color: Colors.black, fontSize: 18),
                  ),
                  actions: [
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => MyApp(),
                          ));
                        },
                        child: Text("Yes")),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => home_page(),
                          ));
                        },
                        child: Text("No"))
                  ],
                )) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) async {
        if (didPop) {
          return;
        }
        final bool shouldPop =
            await _showExitConfirmationDialog(context) ?? false;
        if (context.mounted && shouldPop) {
          Navigator.pop(context);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          actions: [
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(right: 20),
                  child: TextButton(
                    onPressed: () {
                      setState(() {
                        isEng = !isEng;
                      });
                    },
                    child: isEng ? Text("En") : Text("Am"),
                  ),
                ),
                Container(
                    margin: EdgeInsets.only(right: 20, left: 20),
                    child: Icon(
                      Icons.refresh,
                      color: myColors.main_color,
                    ))
              ],
            )
          ],
        ),
        drawer: drawerWidget(context),
        body: ListView(children: [
          Container(
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.black87,
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Image.asset(
                      "assets/images/cbenoor.png",
                      width: 60,
                      height: 60,
                    ),
                    Column(
                      children: [
                        Text(
                          "CBE NOOR",
                          style: TextStyle(color: Colors.amber),
                        ),
                        Text(
                          "ሲቢኢ ኑር",
                          style: TextStyle(color: Colors.amber),
                        ),
                      ],
                    )
                  ],
                ),
                Text(AppLocalizations.of(context).translate('balance'),
                    style: TextStyle(color: Colors.white, fontSize: 15)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    showBalance == true
                        ? Text(balance + ".00" + translate('birr'),
                            style: TextStyle(color: Colors.white, fontSize: 25))
                        : Text(
                            balance.replaceAll(
                                  RegExp('[0-9]'),
                                  "*",
                                ) +
                                AppLocalizations.of(context).translate('birr'),
                            style:
                                TextStyle(color: Colors.white, fontSize: 25)),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          showBalance = !(showBalance!);
                        });
                      },
                      icon: Icon(Icons.remove_red_eye,
                          size: 25, color: Colors.white30),
                    )
                  ],
                ),
                Text(
                  "Wadiah -1000259335152",
                  style: TextStyle(color: Color.fromARGB(255, 247, 184, 11)),
                ),
                Text(translate(time.a.toLowerCase()) + " " + time.date(),
                    style: TextStyle(color: Colors.white, fontSize: 15))
              ],
            ),
          ),
          Column(
            children: [
              Text(translate("services")),
              Wrap(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  serviceItems("transfer.png", translate("transfer")),
                  serviceItems("banking.png", translate("banking")),
                  serviceItems("events.png", translate("events")),
                  serviceItems("utility.png", translate("utility")),
                  serviceItems("topup.png", translate("topup")),
                  serviceItems("help.png", translate("help")),
                  serviceItems(
                      "utility.png", translate("governmental_services")),
                  serviceItems("government.png", translate("transfer")),
                  serviceItems("travel.png", translate("travel")),
                  serviceItems("travel.png", translate("pay_for")),
                  serviceItems("entertain.png", translate("entertainment"))
                ],
              ),
            ],
          )
        ]),
      ),
    );
  }

  String translate(String word) {
    return AppLocalizations.of(context).translate(word);
  }

  Widget serviceItems(String image_, String title_) {
    return Container(
      width: 180,
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        // color: Color.fromARGB(96, 212, 212, 212),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(96, 212, 212, 212).withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 0,
            offset: Offset(1, 1), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 15),
            child: Image.asset(
              "assets/icons/" + image_,
              width: 40,
              height: 40,
            ),
          ),
          Text(
            title_,
            style: TextStyle(
                fontSize: 15,
                color: Color.fromARGB(255, 9, 20, 60),
                fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }

  Widget drawerWidget(var context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.all(0),
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: Color.fromARGB(170, 79, 0, 249)),
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/cbenoor.png',
                    width: 60,
                    height: 60,
                  ),
                ],
              ),
              const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Comercial Bank of Ethiopia",
                    style: TextStyle(color: Colors.amber),
                  ),
                  Text(
                    "The Bank You Always Rely on!",
                    style: TextStyle(color: Color.fromARGB(255, 199, 164, 62)),
                  )
                ],
              )
            ]),
          ),
          ListTile(
              leading: Icon(
                Icons.mosque,
                color: myColors.main_color,
              ),
              title: Text('CBE NOOR'),
              onTap: () {
                Navigator.pop(context);
              },
              trailing: Icon(
                Icons.toggle_on,
                color: Color.fromARGB(255, 191, 160, 66),
              )),
          ListTile(
            leading: Icon(
              Icons.lock_outline,
              color: myColors.main_color,
            ),
            title: Text('Change PIN'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(
              Icons.logout,
              color: myColors.main_color,
            ),
            title: Text('Logout'),
            onTap: () {
              showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                        backgroundColor: Colors.white,
                        content: Text(
                          "Are you sure to logut?",
                          style: TextStyle(color: Colors.black, fontSize: 18),
                        ),
                        actions: [
                          TextButton(
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => MyApp(),
                                ));
                              },
                              child: Text("Yes")),
                          TextButton(
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => home_page(),
                                ));
                              },
                              child: Text("No"))
                        ],
                      ));
            },
          ),
          ListTile(
            leading: Icon(
              Icons.info_rounded,
              color: myColors.main_color,
            ),
            title: Text('FAQ'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(
              Icons.info_outline,
              color: myColors.main_color,
            ),
            title: Text('About'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(
              Icons.star,
              color: myColors.main_color,
            ),
            title: Text('Rate this app'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(
              Icons.computer_rounded,
              color: myColors.main_color,
            ),
            title: Text('Unsubscribe'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
