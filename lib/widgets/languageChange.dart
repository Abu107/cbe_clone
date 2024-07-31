import "package:flutter/material.dart";
import "../screens/login.dart";

class LanguageChangeBtn extends StatefulWidget {
  const LanguageChangeBtn({super.key, required this.f});
  final Function f;
  @override
  State<LanguageChangeBtn> createState() => _LanguageChangeBtnState(f);
}

class _LanguageChangeBtnState extends State<LanguageChangeBtn> {
  _LanguageChangeBtnState(this.fo);
  final Function fo;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 20),
      child: TextButton(
        onPressed: () {
          setState(() {
            /*   if (lan != null) {
                      _locale1 = Locale(lan);
                      if (_locale1 != null) {
                        onLanguageChanged(_locale1);
                      }
                    }  */
            isEng = !isEng;
            Locale _locale1 = isEng ? Locale("en") : Locale("am");
            if (_locale1 != null) {
              fo(_locale1);
            }
          });
        },
        child: isEng ? Text("En") : Text("Am"),
      ),
    );
  }
}
