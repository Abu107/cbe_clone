import 'package:cbe/classes/colors.dart';
import 'package:cbe/classes/sharedpreferenceHelper.dart';
import 'package:cbe/home_page.dart';
import 'package:cbe/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
//import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cbe/l10n/l10n.dart';
import 'classes/applocalization.dart';

void main() {
  runApp(MyApp());
}

const List<String> list = <String>['am', 'en', 'es'];

class MyApp extends StatefulWidget {
  MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late String lang;
  Locale _locale = Locale("en");
  @override
  void initState() {
    super.initState();
    loadData();
    /*   if (lang != null) {
      print("lload" + lang);
    } else {
      lang = "am";
    } */
  }

  void _changeLanguage(Locale locale) {
    setState(() {
      _locale = locale;
      saveData(_locale.languageCode);
    });
  }

  void saveData(String lang112) {
    SharedPreferencesHelper.setString(locale_key, lang112);
  }

  void loadData() async {
    lang = await SharedPreferencesHelper.getString("locale_key");
    print("llloo  " + lang.toString());
    _locale = Locale(lang.toString());
    print("lllol" + _locale.toString());
    //return lang;
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: HomeLog(onLanguageChanged: _changeLanguage),
      locale: _locale,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        AppLocalizations.delegate,
      ],
      supportedLocales: [Locale("en"), Locale("am")],
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        textTheme: GoogleFonts.latoTextTheme(textTheme).copyWith(
          bodyMedium: GoogleFonts.palanquin(
              textStyle: textTheme.bodyMedium, color: myColors.main_color),
        ),
      ),
    );
  }
}
