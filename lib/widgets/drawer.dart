import 'package:akademiapp/screens/grafik_screen.dart';
import 'package:akademiapp/screens/konularAna.dart';
import 'package:akademiapp/screens/sinavlarim.dart';


import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class MainDrawer extends StatelessWidget {
  IconButton _sosyalButton(IconData icon, String link, String renkkod) {
    return IconButton(
      color: Color(int.parse(renkkod)),
      icon: Icon(
        icon,
      ),
      onPressed: () async {
        if (await canLaunch(link)) {
          await launch(link);
        }
      },
    );
  }

  void _launchURL(String toMailId, String subject, String body) async {
    var url = 'mailto:$toMailId?subject=$subject&body=$body';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }



 

  @override
  Widget build(BuildContext context) {
  
    return Drawer(
      elevation: 1.5,
      child: ListView(
        padding: EdgeInsets.zero,
        // Important: Remove any padding from the ListView.

        children: <Widget>[
          InkWell(
            onTap: () {
           
              Navigator.of(context).pushReplacementNamed("/");
            },
            child: DrawerHeader(
              child: Image.asset('assets/images/kucultulmuslogo.png',fit: BoxFit.fitWidth,),
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                Color(int.parse('0xFF2C3E50')),
                Color(int.parse('0xFF2C3E50')),
              ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
            ),
          ),
          ListTile(
            leading: Icon(
              FontAwesomeIcons.questionCircle,
              color: Color(int.parse('0xFF1ABC9C')),
            ),
            title: Text('Özet'),
            onTap: () {
          
              Navigator.of(context).pushReplacementNamed("/");
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(
              FontAwesomeIcons.book,
              color: Color(int.parse('0xFF1ABC9C')),
            ),
            title: Text('Konular'),
            onTap: () {
             
              Navigator.of(context)
                  .pushReplacementNamed(KonularAna.konularAnaRoute);
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(
              FontAwesomeIcons.graduationCap,
              color: Color(int.parse('0xFF1ABC9C')),
            ),
            title: Text('Sınavlarım'),
            onTap: () {
            
              Navigator.of(context)
                  .pushReplacementNamed(Sinavlarim.sinavlarimRoute);
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(
              FontAwesomeIcons.chartLine,
              color: Color(int.parse('0xFF1ABC9C')),
            ),
            title: Text('Grafikler'),
            onTap: () {
           
              Navigator.of(context)
                  .pushReplacementNamed(GrafikScreen.grafikScreenRoute);
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(
              FontAwesomeIcons.exclamationCircle,
              color: Color(int.parse('0xFF1ABC9C')),
            ),
            title: Text('Sorun Bildir'),
            onTap: () {
              _launchURL('iletisim@ekinabalioglu.com',
                  'Danışman Akademi Uygulama Sorun', 'Merhaba');
            },
          ),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              _sosyalButton(FontAwesomeIcons.instagram,
                  'https://www.instagram.com/danisman_akademi/', '0xFFD12F9A'),
              _sosyalButton(
                  FontAwesomeIcons.youtube,
                  'https://www.youtube.com/c/Dan%C4%B1%C5%9FmanAkademi',
                  '0xFFFF0000'),
              _sosyalButton(FontAwesomeIcons.twitter,
                  'https://twitter.com/DanismanAkademi', '0xFF00ACED'),
              _sosyalButton(FontAwesomeIcons.facebook,
                  'https://www.facebook.com/muhammeteroglu.20', '0xFF4267B2'),
            ],
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                InkWell(
                  child: Text(
                    "Danışman Akademi",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  onTap: () async {
                    if (await canLaunch("https://danismanakademi.org/")) {
                      await launch("https://danismanakademi.org/");
                    }
                  },
                ),
                InkWell(
                  child: Text(
                    "Ekin Abalıoğlu",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  onTap: () async {
                    if (await canLaunch("https://ekinabalioglu.com/")) {
                      await launch("https://ekinabalioglu.com/");
                    }
                  },
                ),
              ],
            ),
          ),
          Divider(),
        ],
      ),
    );
  }
}
