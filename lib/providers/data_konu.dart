import 'package:akademiapp/helpers/db_helper.dart';
import 'package:akademiapp/models/ders_adi.dart';
import 'package:flutter/material.dart';
import '../models/konu_adi.dart';

class DataKonu with ChangeNotifier {
  List<KonuAdi> _tumKonular = [];

  final List<DersAdi> _konular = [
    DersAdi(
      dersAdi: 'TYT Türkçe Konuları',
      id: 'tytturk',
      renk: Colors.teal,
    ),
    DersAdi(
      dersAdi: 'TYT Matematik Konuları',
      id: 'tytmat',
      renk: Colors.teal,
    ),
    DersAdi(
      dersAdi: 'TYT Geometri Konuları',
      id: 'tytgeo',
      renk: Colors.teal,
    ),
    DersAdi(
      dersAdi: 'TYT Fizik Konuları',
      id: 'tytfiz',
      renk: Colors.teal,
    ),
    DersAdi(
      dersAdi: 'TYT Kimya Konuları',
      id: 'tytkim',
      renk: Colors.teal,
    ),
    DersAdi(
      dersAdi: 'TYT Biyoloji Konuları',
      id: 'tytbio',
      renk: Colors.teal,
    ),
    DersAdi(
      dersAdi: 'TYT Tarih Konuları',
      id: 'tyttar',
      renk: Colors.teal,
    ),
    DersAdi(
      dersAdi: 'TYT Coğrafya Konuları',
      id: 'tytcog',
      renk: Colors.teal,
    ),
    DersAdi(
      dersAdi: 'TYT Felsefe Konuları',
      id: 'tytfel',
      renk: Colors.teal,
    ),
    DersAdi(
      dersAdi: 'AYT Matematik Konuları',
      id: 'aytmat',
      renk: Colors.indigo,
    ),
    DersAdi(
      dersAdi: 'AYT Geometri Konuları',
      id: 'aytgeo',
      renk: Colors.indigo,
    ),
    DersAdi(
      dersAdi: 'AYT Fizik Konuları',
      id: 'aytfiz',
      renk: Colors.indigo,
    ),
    DersAdi(
      dersAdi: 'AYT Kimya Konuları',
      id: 'aytkim',
      renk: Colors.indigo,
    ),
    //
    DersAdi(
      dersAdi: 'AYT Biyoloji Konuları',
      id: 'aytbio',
      renk: Colors.indigo,
    ),
    DersAdi(
      dersAdi: 'AYT Edebiyat Konuları',
      id: 'aytedeb',
      renk: Colors.orange,
    ),
    DersAdi(
      dersAdi: 'AYT Coğrafya-1 Konuları',
      id: 'aytcog1',
      renk: Colors.orange,
    ),
    DersAdi(
      dersAdi: 'AYT Tarih-1 Konuları',
      id: 'ayttarih1',
      renk: Colors.orange,
    ),
    DersAdi(
      dersAdi: 'AYT Tarih-2 Konuları',
      id: 'ayttarih2',
      renk: Colors.blueGrey,
    ),
    DersAdi(
      dersAdi: 'AYT Coğrafya-2  Konuları',
      id: 'aytcog2',
      renk: Colors.blueGrey,
    ),
    DersAdi(
      dersAdi: 'AYT Felsefe Grubu ve Din Konuları',
      id: 'aytfelgrub',
      renk: Colors.blueGrey,
    ),
  ];

  Alan _alaniDonustur(String alan) {
    if (alan == 'Alan.Say') {
      return Alan.Say;
    } else if (alan == 'Alan.EaSoz') {
      return Alan.EaSoz;
    } else if (alan == 'Alan.SayEa') {
      return Alan.SayEa;
    } else if (alan == 'Alan.Soz') {
      return Alan.Soz;
    } else if (alan == 'Alan.Tyt') {
      return Alan.Tyt;
    } else if (alan == 'Alan.Dil') {
      return Alan.Dil;
    }
  }

  Future<void> dbDataCek() async {
    final konuData = await DbHelper.getData('konular');
    _tumKonular = konuData
        .map((f) => KonuAdi(
            id: f['id'],
            konu: f['konu'],
            dersKey: f['dersKey'],
            ks: f['ks'] == null ? 0 : f['ks'],
            durum: f['durum'] == 'false' ? false : true,
            alanKey: _alaniDonustur(f['alanKey'])))
        .toList();

    notifyListeners();
  }

  List<KonuAdi> listeyiSec(String hangiListe) {
    if (hangiListe == 'tytturk') {
      return _tumKonular.where((t1) => t1.dersKey == hangiListe).toList();
    } else if (hangiListe == 'tytmat') {
      return _tumKonular.where((t1) => t1.dersKey == hangiListe).toList();
    } else if (hangiListe == 'tytgeo') {
      return _tumKonular.where((t1) => t1.dersKey == hangiListe).toList();
    } else if (hangiListe == 'tytfiz') {
      return _tumKonular.where((t1) => t1.dersKey == hangiListe).toList();
    } else if (hangiListe == 'tytkim') {
      return _tumKonular.where((t1) => t1.dersKey == hangiListe).toList();
    } else if (hangiListe == 'tytbio') {
      return _tumKonular.where((t1) => t1.dersKey == hangiListe).toList();
    } else if (hangiListe == 'tyttar') {
      return _tumKonular.where((t1) => t1.dersKey == hangiListe).toList();
    } else if (hangiListe == 'tytcog') {
      return _tumKonular.where((t1) => t1.dersKey == hangiListe).toList();
    } else if (hangiListe == 'tytfel') {
      return _tumKonular.where((t1) => t1.dersKey == hangiListe).toList();
    } else if (hangiListe == 'aytfiz') {
      return _tumKonular.where((t1) => t1.dersKey == hangiListe).toList();
    } else if (hangiListe == 'aytkim') {
      return _tumKonular.where((t1) => t1.dersKey == hangiListe).toList();
    } else if (hangiListe == 'aytbio') {
      return _tumKonular.where((t1) => t1.dersKey == hangiListe).toList();
    } else if (hangiListe == 'aytmat') {
      return _tumKonular.where((t1) => t1.dersKey == hangiListe).toList();
    } else if (hangiListe == 'aytgeo') {
      return _tumKonular.where((t1) => t1.dersKey == hangiListe).toList();
    } else if (hangiListe == 'aytedeb') {
      return _tumKonular.where((t1) => t1.dersKey == hangiListe).toList();
    } else if (hangiListe == 'ayttarih1') {
      return _tumKonular.where((t1) => t1.dersKey == hangiListe).toList();
    } else if (hangiListe == 'aytcog1') {
      return _tumKonular.where((t1) => t1.dersKey == hangiListe).toList();
    } else if (hangiListe == 'ayttarih2') {
      return _tumKonular.where((t1) => t1.dersKey == hangiListe).toList();
    } else if (hangiListe == 'aytcog2') {
      return _tumKonular.where((t1) => t1.dersKey == hangiListe).toList();
    } else if (hangiListe == 'aytfelgrub') {
      return _tumKonular.where((t1) => t1.dersKey == hangiListe).toList();
    }
  }

  Future<void> listeyiUpdatele({bool durum, int hangiEleman, int ks}) async {
    final indexDurum = _tumKonular.indexWhere((test) => test.id == hangiEleman);
    _tumKonular[indexDurum].durum = !_tumKonular[indexDurum].durum;
    String veri = '';
    if (_tumKonular[indexDurum].durum) {
      veri = 'true';
      await DbHelper.update('konular', {'durum': veri, 'ks': ks}, hangiEleman);
    } else {
      veri = 'false';
      
      await DbHelper.update('konular', {'durum': veri, 'ks': 0}, hangiEleman);
      notifyListeners();
    }
  }

  List<DersAdi> get konuBasliklariCek {
    return _konular;
  }

  List<KonuAdi> get tytKonuCek {
    return _tumKonular.where((f) => f.alanKey == Alan.Tyt).toList();
  }

  List<KonuAdi> get aytSayKonuCek {
    return _tumKonular.where((f) => f.alanKey == Alan.Say).toList() +
        _tumKonular.where((f) => f.alanKey == Alan.SayEa).toList();
  }

  List<KonuAdi> get aytSozKonuCek {
    return _tumKonular.where((f) => f.alanKey == Alan.Soz).toList() +
        _tumKonular.where((f) => f.alanKey == Alan.EaSoz).toList();
  }

  List<KonuAdi> get aytEaKonuCek {
    return _tumKonular.where((f) => f.alanKey == Alan.SayEa).toList() +
        _tumKonular.where((f) => f.alanKey == Alan.EaSoz).toList();
  }
}
