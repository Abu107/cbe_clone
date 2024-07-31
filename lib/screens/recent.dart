import 'package:cbe/home_page.dart';
import 'package:cbe/screens/account.dart';
import 'package:flutter/material.dart';
import 'package:cbe/classes/colors.dart';

class Recent extends StatefulWidget {
  const Recent({super.key});

  @override
  State<Recent> createState() => _RecentState();
}

class _RecentState extends State<Recent> {
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
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.all(10),
              child: Text(
                "Recent Transactions",
                style: TextStyle(fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
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
            )
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
