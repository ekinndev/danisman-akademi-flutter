import 'package:akademiapp/providers/sinavlarim_prov.dart';
import 'package:akademiapp/screens/grafik_screen.dart';
import 'package:akademiapp/screens/sinav_detail_screen.dart';

import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'providers/data_konu.dart';
import './screens/konularAna.dart';
import 'package:flutter/material.dart';
import './screens/website_screen.dart';
import './widgets/drawer.dart';
import './screens/konular_ozel.dart';
import './screens/sinav_durum.dart';
import './screens/sinav_ekle.dart';
import './screens/sinavlarim.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  final appbar = AppBar(
    backgroundColor: Color(int.parse('0xFF2C3E50')),
    title: Text('Danışman Akademi'),
    bottom: TabBar(
      tabs: <Widget>[
        Tab(icon: Icon(FontAwesomeIcons.home)),
        Tab(icon: Icon(Icons.web)),
      ],
    ),
  );
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: SinavProvider(),
        ),
        ChangeNotifierProvider.value(
          value: DataKonu(),
        )
      ],
      child: MaterialApp(
        routes: {
          KonularAna.konularAnaRoute: (context) => KonularAna(),
          GrafikScreen.grafikScreenRoute: (context) => GrafikScreen(),
          KonularOzel.konularOzelRoute: (context) => KonularOzel(),
          SinavEkle.sinavEkleRoute: (context) => SinavEkle(),
          Sinavlarim.sinavlarimRoute: (context) => Sinavlarim(),
          SinavDetailScreen.sinavDetailRoute: (context) => SinavDetailScreen(),
        },
        debugShowCheckedModeBanner: false,
        title: 'Danışman Akademi',
        theme: ThemeData(
          fontFamily: 'CaviarDreams',
          primarySwatch: Colors.blue,
          accentColor: Colors.amber,
          textTheme: TextTheme(
            headline: TextStyle(
                fontSize: 48.0,
                fontWeight: FontWeight.bold,
                color: Colors.black),
            title: TextStyle(fontSize: 24.0, color: Colors.black),
            body1: TextStyle(
                fontSize: 14.0, fontFamily: 'Hind', color: Colors.black),
          ),
        ),
        home: DefaultTabController(
          length: 2,
          child: Scaffold(
            drawer: MainDrawer(),
            body: TabBarView(
              children: <Widget>[
                SinavDurum(),
                WebSiteScreen(),
              ],
            ),
            appBar: appbar,
          ),
        ),

        /*Scaffold(
          persistentFooterButtons: <Widget>[],
          backgroundColor: Color(int.parse('0xFFF4F4F4')),
          drawer: MainDrawer(),
          appBar: appbar,
          body: SinavDurum(),
        ),*/
      ),
    );
  }
}
