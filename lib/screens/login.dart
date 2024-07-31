import 'package:cbe/classes/colors.dart';
import 'package:cbe/classes/sharedpreferenceHelper.dart';
import 'package:cbe/classes/time.dart';
import 'package:cbe/home_page.dart';
import 'package:cbe/main.dart';
import 'package:cbe/widgets/languageChange.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import '../classes/applocalization.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeLog extends StatefulWidget {
  HomeLog({super.key, required this.onLanguageChanged});
  final Function(Locale) onLanguageChanged;
  @override
  State<HomeLog> createState() =>
      _HomeLogState(onLanguageChanged: onLanguageChanged);
}

String locale_key = "locale_key";
bool isEng = true;

class _HomeLogState extends State<HomeLog> {
  _HomeLogState({required this.onLanguageChanged});
  final Function(Locale) onLanguageChanged;
  final timerCheck time = new timerCheck(); //class
  DateTime now = DateTime.now();
  final _formKey = GlobalKey<FormState>();
  int count = 3;
  final TextEditingController _pincontroller = TextEditingController();
  String dropdownValue = list.first;
  bool isChecked = false;
  bool isPassErr = false;
  bool _showNewWidget = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  @override
  void dispose() {
    _pincontroller.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  Future<void> loadData() async {
    String lang = await SharedPreferencesHelper.getString("locale_key");
    if (lang == "en") {
      isEng = true;
    }
    if (lang == "am") {
      isEng = false;
    }
    onLanguageChanged(Locale(lang));
  }

  void _submitForm() {
    String pin = _pincontroller.text;
    if (_formKey.currentState!.validate()) {
      if (pin.length == 4) {
        count >= 1 ? count-- : count;
        if (pin == "2345") {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => home_page(),
          ));
        }
        setState(() {
          isPassErr = true;
        });
      }
    }
  }

  void saveData(String lang112) {
    SharedPreferencesHelper.setString(locale_key, lang112);
  }

  String translate(String word) {
    return AppLocalizations.of(context).translate(word);
  }

  void _toggleWidget() {
    setState(() {
      _showNewWidget = !_showNewWidget;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Localizations.override(
        context: context,
        child: GestureDetector(
          child: Scaffold(
            appBar: AppBar(
              actions: [
                LanguageChangeBtn(
                  // self built widget on widgets/
                  f: onLanguageChanged,
                ),
              ],
              backgroundColor: myColors.header_bg,
              systemOverlayStyle: SystemUiOverlayStyle(
                statusBarColor: myColors.main_color,
                statusBarBrightness: Brightness.light,
              ),
            ),
            body: Container(
                height: double.infinity,
                child: ListView(
                    physics: NeverScrollableScrollPhysics(),
                    //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(children: [
                        Image.asset(
                          "assets/images/cbenoor.png",
                          width: 180,
                          height: 180,
                        ),
                        Text(
                          translate('welcome'),
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: myColors.main_color),
                        ),
                        Text(
                          translate('cbe_noor'),
                          style: TextStyle(
                              fontSize: 20, color: myColors.main_color),
                        ),
                        Text(
                          translate(time.timeCheck()),
                          style: TextStyle(color: myColors.main_color),
                        ),
                        Form(
                            key: _formKey,
                            child: Column(children: [
                              Padding(
                                  padding: const EdgeInsets.only(
                                      right: 40, left: 40),
                                  child: TextFormField(
                                      controller: _pincontroller,
                                      inputFormatters: [
                                        LengthLimitingTextInputFormatter(4)
                                      ],
                                      autofocus: true,
                                      keyboardType: TextInputType.number,
                                      //  maxLength: 4,
                                      textAlign: TextAlign.center,
                                      decoration: InputDecoration(
                                          enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                                color: myColors.main_color,
                                                width: 0.8),
                                          ),
                                          hintText: translate('pin')),
                                      validator: (value) {
                                        return null;
                                      })),
                              isPassErr == true && count >= 1
                                  ? Text("$count " + translate('login_attempt'))
                                  : Container(),
                              count < 1
                                  ? Text(translate('account_blocked'))
                                  : Container(),
                              GestureDetector(
                                  child: Container(
                                    margin: EdgeInsets.only(top: 20),
                                    padding: EdgeInsets.all(20),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        color: myColors.next_bg,
                                        boxShadow: [
                                          BoxShadow(
                                            color: Color.fromARGB(
                                                    255, 138, 136, 136)
                                                .withOpacity(0.5),
                                            spreadRadius: 5,
                                            blurRadius: 7,
                                            offset: Offset(0,
                                                3), // changes position of shadow
                                          )
                                        ]),
                                    child: Image.asset(
                                      'assets/icons/next.png',
                                      width: 20,
                                      height: 20,
                                    ),
                                  ),
                                  onTap: () {
                                    //  count--;
                                    count >= 1 ? _submitForm() : null;
                                  })
                            ]))
                      ]),
                      if (_showNewWidget) NonFinancialServices(),
                    ])),
            bottomNavigationBar: Container(
              height: 100,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    child: Container(
                        height: 100,
                        padding: EdgeInsets.only(bottom: 15),
                        child: Column(children: [
                          Container(
                            padding: EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: myColors.next_bg,
                              borderRadius: BorderRadius.circular(50),
                              boxShadow: [
                                BoxShadow(
                                    color: Color.fromARGB(255, 138, 136, 136)
                                        .withOpacity(0.5),
                                    spreadRadius: 5,
                                    blurRadius: 7,
                                    offset: Offset(0, 4))
                              ],
                            ),
                            child: Container(
                                decoration: BoxDecoration(),
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Container(
                                          margin: EdgeInsets.only(right: 10),
                                          child: Image.asset(
                                            'assets/icons/security.png',
                                            width: 20,
                                            height: 20,
                                          )),
                                      Text(translate('non_financial'),
                                          style: const TextStyle(
                                              fontSize: 18,
                                              color: Colors.black))
                                    ])),
                          ),
                          Container(
                              margin: const EdgeInsets.only(top: 10),
                              child: Text(
                                translate('copyright'),
                                style: GoogleFonts.lato(),
                              ))
                        ])),
                    onTap: () {
                      setState(() {
                        _toggleWidget();
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
          onTap: () {
            setState(() {
              _showNewWidget = false;
            });
          },
        ));
  }
}

class NonFinancialServices extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(right: 20, left: 20, bottom: 20),
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: Color.fromARGB(255, 255, 255, 255),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: myColors.main_color, width: 2)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  createServiceIcon(Icons.currency_exchange, "Exchange Rate"),
                  createServiceIcon(Icons.location_on, "CBE Location"),
                  createServiceIcon(FontAwesomeIcons.commenting, "FeedBack"),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  createServiceIcon(FontAwesomeIcons.headset, "Call Center"),
                  createServiceIcon(FontAwesomeIcons.phoneFlip, "USSD"),
                  createServiceIcon(Icons.link, "CBE Links"),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  createServiceImage("Verify Reciept"),
                  createServiceImage("Servey"),
                  createServiceImage("Term And Condition"),
                ],
              ),
            ),
          ],
        ));
  }

  /*  _callNumber() async {
    /* 
    const number = '0859211999';
    //set the number here
    bool? res = await FlutterPhoneDirectCaller.callNumber(number); */
    var url = Uri.parse("tel:9776765434");
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  } */

  Widget createServiceIcon(IconData icon, String text) {
    return Container(
      margin: EdgeInsets.only(right: 10),
      child: Column(
        children: [
          GestureDetector(
            child: Icon(
              icon,
              color: myColors.main_color,
              size: 50,
            ),
            onTap: () {
              //_callNumber();
            },
          ),
          Text(text),
        ],
      ),
    );
  }

  Widget createServiceImage(String text) {
    return Container(
      margin: EdgeInsets.only(right: 10),
      child: Column(
        children: [
          Image.asset(
            "assets/images/cbelogo1.png",
            width: 50,
            height: 50,
          ),
          Text(text),
        ],
      ),
    );
  }
}
