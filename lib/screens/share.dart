import 'package:cbe/home_page.dart';
import 'package:cbe/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:cbe/classes/colors.dart';
import 'package:get/get.dart';

class Share extends StatelessWidget {
  const Share({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(
          margin: EdgeInsets.only(left: 20),
          child: IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => home_page()),
              );
            },
            icon: Icon(
              Icons.arrow_back,
            ),
          ),
        ),
        actions: [
          Row(
            children: [
              Text(
                'EN',
                style: TextStyle(color: myColors.main_color),
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
      body: PopScope(
        canPop: false,
        onPopInvoked: (didPop) async {
          if (didPop) {
            return;
          }
          if (context.mounted) {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => home_page(),
            ));
          }
        },
        child: Container(
          height: double.infinity,
          color: Color.fromARGB(151, 168, 174, 180),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Color.fromARGB(214, 20, 16, 43),
            ),
            margin: EdgeInsets.only(right: 20, left: 20, top: 10, bottom: 10),
            padding: EdgeInsets.only(left: 20, top: 10, bottom: 10, right: 10),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 10),
                    child: Image.asset(
                      "assets/images/cbelogo1.png",
                      width: 50,
                      height: 50,
                    ),
                  ),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Comercial Bank of Ethiopia",
                        style: TextStyle(color: Colors.amber, fontSize: 18),
                      ),
                      Text(
                        "The Bank You Always Rely on!",
                        style: TextStyle(
                            fontSize: 18,
                            color: Color.fromARGB(255, 199, 164, 62)),
                      )
                    ],
                  )
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "ACCOUNT",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    Row(
                      children: [
                        Text(
                          "1000*****5152",
                          style: TextStyle(color: Colors.white, fontSize: 22),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 10),
                          child: Icon(
                            Icons.remove_red_eye_rounded,
                            color: Colors.white60,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                margin:
                    EdgeInsets.only(right: 10, left: 10, top: 20, bottom: 20),
                child: Image.asset("assets/images/qr_cbe.jpg"),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    color: myColors.main_color,
                    padding: EdgeInsets.only(
                        top: 15, right: 30, bottom: 15, left: 30),
                    margin: EdgeInsets.all(15),
                    child: Text(
                      "AMOUNT & REASON",
                      style: TextStyle(
                          color: Color.fromARGB(255, 225, 221, 221),
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  Container(
                    color: myColors.main_color,
                    padding: EdgeInsets.only(
                        right: 30, left: 30, top: 15, bottom: 15),
                    child: Text(
                      "SHARE",
                      style: TextStyle(
                          color: Color.fromARGB(255, 225, 221, 221),
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              )
            ]),
          ),
        ),
      ),
    );
  }
}
