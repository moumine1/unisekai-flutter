import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/locked_feature.dart';
import 'package:flutter_application_1/screens/ar_screen.dart';
import 'package:flutter_application_1/screens/batiment_illustration.dart';
import 'package:flutter_application_1/screens/crea_num_screen.dart';
import 'package:flutter_application_1/screens/dev_screen.dart';
import 'package:flutter_application_1/screens/home_screen.dart';
import 'package:flutter_application_1/screens/lp_jeux_screen.dart';
import 'package:flutter_application_1/screens/mmi_formation_screen.dart';
import 'package:flutter_application_1/screens/scanner_screen.dart';
import 'package:flutter_application_1/screens/strat_ux_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => MainAppState(),
    child: const MainApp(),
  ));
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  MainAppState createState() => MainAppState();

  static MainAppState? of(BuildContext context) =>
      context.findAncestorStateOfType<MainAppState>();
}

class MainAppState extends State<MainApp> with ChangeNotifier {
  Locale _locale = const Locale('fr');
  //Initialisation des variables liées au verouillage de certains écrans de l'appli
  bool _isLockedButton1 = true;
  bool _isLockedButton2 = true;

  bool get isLockedButton1 => _isLockedButton1;
  bool get isLockedButton2 => _isLockedButton2;

  //Fonciton lié au verouillage
  void setIsLockedButton1(bool value) {
    _isLockedButton1 = value;
    notifyListeners();
  }

  void setIsLockedButton2(bool value) {
    _isLockedButton2 = value;
    notifyListeners();
  }

  void setLocale(Locale value) {
    setState(() {
      _locale = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //Gestion des langues
      supportedLocales: const [Locale('fr'), Locale('en')],
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate
      ],
      locale: _locale,
      debugShowCheckedModeBanner: false,
      routes: {
        HomeScreen.routeName: (context) =>
            const HomeScreen(), // Add the missing import statement for HomeScreen at the top of the file
        ScannerScreen.routeName: (context) => const ScannerScreen(),
        MMiFormationScreen.routeName: (context) => const MMiFormationScreen(),
        CreaNumScreen.routeName: (context) => const CreaNumScreen(),
        StratUXScreen.routeName: (context) => const StratUXScreen(),
        DevWebScreen.routeName: (context) => const DevWebScreen(),
        LPJeuxScreen.routeName: (context) => const LPJeuxScreen(),
        BatimentIlluScreen.routeName: (context) => const BatimentIlluScreen(),
        ARScreen.routeName: (context) => const ARScreen(),
      },
      title: 'UNISEKAI',
      home: const HomeScreen(),
    );
  }
}
