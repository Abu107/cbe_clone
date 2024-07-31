import 'package:cbe/home_page.dart';
import 'package:flutter/material.dart';
import 'package:cbe/classes/time.dart';
import 'package:cbe/classes/colors.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../classes/applocalization.dart';

class Account extends StatefulWidget {
  const Account({super.key});

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  bool showBalance = false;
  final timerCheck time = new timerCheck();
  String balance = "22100";
  @override
  void initState() {
    super.initState();
    time.date();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
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
      child: Scaffold(
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
        body: Container(
          color: Color.fromARGB(255, 240, 239, 239),
          child: ListView(children: [
            Container(
              padding: EdgeInsets.all(5),
              child: Text(
                "Accounts",
                style: TextStyle(fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
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
                            'CBE NOOR',
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
                  Text(translate('balance'),
                      style: TextStyle(color: Colors.white, fontSize: 15)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      showBalance == true
                          ? Text(balance + ".00 Br.  ",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 25))
                          : Text(
                              balance.replaceAll(RegExp('[0-9]'), "*") +
                                  " Br.  ",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 25)),
                      IconButton(
                          onPressed: () {
                            setState(() {
                              showBalance = !showBalance;
                            });
                          },
                          icon: Icon(
                            Icons.remove_red_eye,
                            color: Colors.white30,
                          )),
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
            Container(margin: EdgeInsets.all(10), child: Text("Recents")),
            transactionList("Deposit", "jun 22, 223", "2000", "Mobile Credit"),
            transactionList("Deposit", "jun 22, 223", "300", "Mobile Credit"),
            transactionList(
                "Withdrawal", "jun 22, 223", "230", "Mobile Credit"),
            transactionList(
                "Withdrawal", "jun 22, 223", "120", "Mobile Credit"),
            transactionList(
                "Withdrawal", "jun 22, 223", "3000", "Mobile Credit"),
            transactionList("Deposit", "jun 22, 223", "1200", "Mobile Credit"),
            transactionList("Deposit", "jun 22, 223", "2000", "Mobile Credit"),
            transactionList("Deposit", "jun 22, 223", "300", "Mobile Credit"),
            transactionList(
                "Withdrawal", "jun 22, 223", "230", "Mobile Credit"),
            transactionList(
                "Withdrawal", "jun 22, 223", "120", "Mobile Credit"),
            transactionList(
                "Withdrawal", "jun 22, 223", "3000", "Mobile Credit"),
            transactionList("Deposit", "jun 22, 223", "1200", "Mobile Credit"),
          ]),
        ),
      ),
    );
  }

  String translate(String word) {
    return AppLocalizations.of(context).translate(word);
  }

  Widget transactionList(String transaction_type, String date, String amount,
      String transaction_from) {
    return GestureDetector(
      child: Container(
        padding: EdgeInsets.all(15),
        margin: EdgeInsets.only(right: 15, left: 15, top: 5, bottom: 5),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: .1,
              blurRadius: .5,
              offset: Offset(0, .3), // changes position of shadow
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                    margin: EdgeInsets.only(right: 10),
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: Color.fromARGB(171, 222, 222, 222),
                        borderRadius: BorderRadius.circular(20)),
                    child: transaction_type == "Deposit"
                        ? Icon(
                            Icons.arrow_downward_rounded,
                            color: Colors.green,
                          )
                        : Icon(
                            Icons.arrow_upward,
                            color: Colors.red,
                          )),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      transaction_type,
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    Text(
                      date,
                      style: TextStyle(color: Colors.black45),
                    )
                  ],
                )
              ],
            ),
            Column(
              children: [
                Text(amount),
                Text(
                  transaction_from,
                  style: TextStyle(fontSize: 12, color: Colors.black45),
                )
              ],
            ),
          ],
        ),
      ),
      onTap: () {
        showDialog(
          context: context,
          builder: (context) {
            return Theme(
              data: ThemeData(
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
              ),
              child: Dialog(
                backgroundColor: Colors.white,
                alignment: Alignment.bottomCenter,
                insetPadding: EdgeInsets.zero,
                shape: BeveledRectangleBorder(),
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Container(
                      height: (MediaQuery.of(context).size.height) / 2.7,
                      // width: double.infinity,
                      child: TransactionDetail(),
                    )
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}

class TransactionDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(3),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          border: Border.all(
              color: const Color.fromARGB(255, 173, 173, 173), width: .5)),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Transaction Detail",
                      style: TextStyle(fontSize: 18),
                    ),
                    Text("jul 23, 2024")
                  ],
                ),
                GestureDetector(
                  child: Icon(FontAwesomeIcons.remove),
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            ),
          ),
          rowTransaction("Type", "Mobile credit"),
          rowTransaction("Txn ID", "FT24204QVXSC"),
          rowTransaction("Done Via", "just pay done via Mobile"),
          rowTransaction("Transfer From", "Abubeker Muhdin Nasir"),
          rowTransaction("Amount", "2000 Br"),
          Container(
            color: myColors.main_color,
            padding: EdgeInsets.all(10),
            child: Row(mainAxisSize: MainAxisSize.min, children: [
              Icon(
                Icons.receipt,
                color: Colors.white,
              ),
              Text(
                "View Receipt",
                style: TextStyle(color: Colors.white),
              )
            ]),
          )
        ],
      ),
    );
  }

  Widget rowTransaction(String type, String descrip) {
    return Container(
      margin: EdgeInsets.only(left: 10, bottom: 5),
      padding: EdgeInsets.all(5),
      child: Row(
        children: [
          Text(
            type + ":\t\t\t",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(
            descrip,
          )
        ],
      ),
    );
  }
}
