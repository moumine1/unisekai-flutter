import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/language_alert_dialog.dart';
import 'package:getwidget/getwidget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LPJeuxScreen extends StatefulWidget {
  const LPJeuxScreen({super.key});

  static const routeName = '/mmi/lp-jeux';

  @override
  LPJeuxScreenState createState() => LPJeuxScreenState();
}

class LPJeuxScreenState extends State<LPJeuxScreen> {
  //Chargement des imagesd dans une liste pour préparer le carousel
  final List<AssetImage> imageList = [
    const AssetImage('assets/images/UNISEKAIVISUINSTA_LPJV01.png'),
    const AssetImage('assets/images/UNISEKAIVISUINSTA_LPJV02.png'),
    const AssetImage('assets/images/UNISEKAIVISUINSTA_LPJV03.png'),
    const AssetImage('assets/images/UNISEKAIVISUINSTA_LPJV04.png'),
    const AssetImage('assets/images/UNISEKAIVISUINSTA_LPJV05.png'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff3e4645),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color(0xff3e4645),
        actions: <Widget>[
          GFIconButton(
            icon: const Icon(
              Icons.language,
              color: Colors.white,
            ),
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return const LanguageAlertDialog();
                },
              );
            },
            type: GFButtonType.transparent,
          ),
        ],
      ),
      body: Center(
        //Initialisation du carousel avec scroll infini en utilisant la liste chargé plus haut
        child: GFCarousel(
          enableInfiniteScroll: true,
          activeIndicator: Colors.white,
          autoPlay: true,
          items: imageList.map(
            (image) {
              return Container(
                margin: const EdgeInsets.all(8.0),
                child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                    child: Image(
                      image: image,
                      fit: BoxFit.cover,
                      width: 1000.0,
                      height: 1000.0,
                    )),
              );
            },
          ).toList(),
          onPageChanged: (index) {
            setState(() {
              index;
            });
          },
        ),
      ),
        //Ajout du bouton en bas à droite pour activer le scanner de QR Code
      floatingActionButton: SizedBox(
        width: 70,
        height: 70,
        child: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).pushNamed('/scanner');
          },
          backgroundColor: Colors.white,
          child: const Icon(
            Icons.qr_code,
            size: 40.0,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
    );
  }
}
