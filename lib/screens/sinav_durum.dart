import 'package:akademiapp/widgets/geri_sayim.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/data_konu.dart';
import '../models/konu_adi.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class SinavDurum extends StatelessWidget {
  Widget _yuzdeHesapla(List<KonuAdi> liste) {
    Color renk;
    int bitenSayi = 0;
    liste.forEach((f) {
      if (f.durum) {
        bitenSayi++;
      }
    });
    if (100 * bitenSayi / liste.length <= 30) {
      renk = Colors.red;
    } else if (100 * bitenSayi / liste.length > 30 &&
        100 * bitenSayi / liste.length <= 60) {
      renk = Colors.yellow;
    } else if (100 * bitenSayi / liste.length > 60 &&
        100 * bitenSayi / liste.length <= 100) {
      renk = Colors.green;
    }
    return CircularPercentIndicator(
      radius: 45,
      lineWidth: 5.0,
      percent: bitenSayi / liste.length,
      center: FittedBox(
        fit: BoxFit.cover,
        child: Text(
          '%' + (100 * bitenSayi / liste.length).ceil().toString(),
        ),
      ),
      progressColor: renk,
    );
  }

  @override
  Widget build(BuildContext context) {
    final konuCek = Provider.of<DataKonu>(context, listen: false);

    return FutureBuilder(
      future: konuCek.dbDataCek(),
      builder: (ctx, snapshot) => snapshot.connectionState ==
              ConnectionState.waiting
          ? Center(child: CircularProgressIndicator())
          : ListView(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(bottom: 5),
                  child: Image.asset('assets/images/logoozetyeni.png',fit: BoxFit.cover),
                  height: MediaQuery.of(context).size.height * 0.17,
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 1,
                        spreadRadius: 1,
                        color: Colors.grey.withOpacity(0.8),
                        offset: Offset(
                          2.0, // horizontal, move right 10
                          2.0, // vertical, move down 10
                        ),
                      ),
                    ],
                    color: Color(int.parse('0xFFFFFFFF')),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            'TYT Konularını Bitirme Oranın:',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          _yuzdeHesapla(konuCek.tytKonuCek),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text('Say Konularını Bitirme Oranın:',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          _yuzdeHesapla(konuCek.aytSayKonuCek),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text('Ea Konularını Bitirme Oranın:',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          _yuzdeHesapla(
                            konuCek.aytEaKonuCek,
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text('Söz Konularını Bitirme Oranın:',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          _yuzdeHesapla(konuCek.aytSozKonuCek),
                        ],
                      ),
                    ],
                  ),
                ),
                GeriSayim(),
              ],
            ),
    );
  }
}
