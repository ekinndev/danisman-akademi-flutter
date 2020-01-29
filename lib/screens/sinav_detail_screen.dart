import 'package:akademiapp/models/sinav.dart';
import 'package:flutter/material.dart';

class SinavDetailScreen extends StatelessWidget {
  static const sinavDetailRoute = '/sinav-detail';

  @override
  Widget build(BuildContext context) {
    final gelenSinav = ModalRoute.of(context).settings.arguments as Sinav;
  
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Color(int.parse('0xFF2C3E50')),
        title: Text(gelenSinav.sinavAdi),
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
            SizedBox(
              height: 10,
            ),
            Text(gelenSinav.sinavAdi,
                style: Theme.of(context).textTheme.headline,
                textAlign: TextAlign.center),
            SizedBox(
              height: 10,
            ),
            Divider(),
            Text('TYT Bölümü',
                style: Theme.of(context).textTheme.title,
                textAlign: TextAlign.center),
            SizedBox(
              height: 10,
            ),
            Text(
              'Puan:' +
                  (gelenSinav.tytHamPuan + gelenSinav.diplomaPuani * 0.6)
                      .toStringAsFixed(2),
              style: TextStyle(fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'TYT Türkçe Net:${gelenSinav.tytTurkceNet}',
              textAlign: TextAlign.center,
            ),
            Text(
              'TYT Matematik Net:${gelenSinav.tytMatNet}',
              textAlign: TextAlign.center,
            ),
            Text(
              'TYT Sosyal Net:${gelenSinav.tytSosNet}',
              textAlign: TextAlign.center,
            ),
            Text(
              'TYT Fen Net:${gelenSinav.tytFenNet}',
              textAlign: TextAlign.center,
            ),
            Divider(),
            Text('AYT SAY Bölümü',
                style: Theme.of(context).textTheme.title,
                textAlign: TextAlign.center),
            SizedBox(
              height: 10,
            ),
            Text(
              'Puan:' +
                  (gelenSinav.aytHamSayPuan + gelenSinav.diplomaPuani * 0.6)
                      .toStringAsFixed(2),
              style: TextStyle(fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'AYT Matematik Net:${gelenSinav.aytSayMatNet}',
              textAlign: TextAlign.center,
            ),
            Text(
              'AYT Fizik Net:${gelenSinav.aytSayFizikNet}',
              textAlign: TextAlign.center,
            ),
            Text(
              'AYT Kimya Net:${gelenSinav.aytSayKimyaNet}',
              textAlign: TextAlign.center,
            ),
            Text(
              'AYT Biyoloji Net:${gelenSinav.aytSayBioNet}',
              textAlign: TextAlign.center,
            ),
            Divider(),
            Text('AYT Dil Bölümü',
                style: Theme.of(context).textTheme.title,
                textAlign: TextAlign.center),
            SizedBox(
              height: 10,
            ),
            Text(
              'Puan:' +
                  (gelenSinav.aytHamDilPuan + gelenSinav.diplomaPuani * 0.6)
                      .toStringAsFixed(2),
              style: TextStyle(fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'AYT Dil Net:${gelenSinav.aytDilNet}',
              textAlign: TextAlign.center,
            ),
            Divider(),
            Text('AYT Ea Bölümü',
                style: Theme.of(context).textTheme.title,
                textAlign: TextAlign.center),
            SizedBox(
              height: 10,
            ),
            Text(
                'Puan:' +
                    (gelenSinav.aytHamEaPuan + gelenSinav.diplomaPuani * 0.6)
                        .toStringAsFixed(2),
                style: TextStyle(fontWeight: FontWeight.bold),
                textAlign: TextAlign.center),
            SizedBox(
              height: 10,
            ),
            Text(
              'AYT Edebiyat Net:${gelenSinav.aytEaEdebNet}',
              textAlign: TextAlign.center,
            ),
            Text(
              'AYT Matematik Net:${gelenSinav.aytEaMatNet}',
              textAlign: TextAlign.center,
            ),
            Text(
              'AYT Tarih-1 Net:${gelenSinav.aytEaTar1Net}',
              textAlign: TextAlign.center,
            ),
            Text(
              'AYT Coğrafya-1 Net:${gelenSinav.aytEaCog1Net}',
              textAlign: TextAlign.center,
            ),
            Divider(),
            Text('AYT Söz Bölümü',
                style: Theme.of(context).textTheme.title,
                textAlign: TextAlign.center),
            SizedBox(
              height: 10,
            ),
            Text(
                'Puan:' +
                    (gelenSinav.aytHamSozPuan + gelenSinav.diplomaPuani * 0.6)
                        .toStringAsFixed(2),
                style: TextStyle(fontWeight: FontWeight.bold),
                textAlign: TextAlign.center),
            SizedBox(
              height: 10,
            ),
            Text(
              'AYT Edebiyat Net:${gelenSinav.aytSozEdebNet}',
              textAlign: TextAlign.center,
            ),
            Text(
              'AYT Tarih-1 Net:${gelenSinav.aytSozTar1Net}',
              textAlign: TextAlign.center,
            ),
            Text(
              'AYT Tarih-2 Net:${gelenSinav.aytSozTar2Net}',
              textAlign: TextAlign.center,
            ),
            Text(
              'AYT Coğrafya-1 Net:${gelenSinav.aytSozCog1Net}',
              textAlign: TextAlign.center,
            ),
            Text(
              'AYT Coğrafya-2 Net:${gelenSinav.aytSozCog2Net}',
              textAlign: TextAlign.center,
            ),
            Text(
              'AYT Felsefe Net:${gelenSinav.aytSozFelNet}',
              textAlign: TextAlign.center,
            ),
            Text(
              'AYT Din Net:${gelenSinav.aytSozDinNet}',
              textAlign: TextAlign.center,
            ),
            Divider(),
          ],
        ),
      ),
    );
  }
}
