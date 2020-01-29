import 'dart:convert';


import 'package:akademiapp/helpers/db_helper.dart';

import '../models/sinav.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class SinavProvider with ChangeNotifier {
   List<Sinav> _sinavlar = [];
  List<Object> _dogruYanlis = [];

  void dogruYanlisEkle(var dy) {
    _dogruYanlis.add(dy);
  }

  List<Object> get dogruYanlisCek {
    return _dogruYanlis;
  }

  void dogruYanlisTemizle() {
    _dogruYanlis = [];
  }

  Future<void> sinavEkle(Sinav yeniSinav) async {
    var varMi =
        _sinavlar.indexWhere((test) => test.sinavAdi == yeniSinav.sinavAdi);

    if (varMi >= 0) {
      throw 'Lütfen farklı bir isim kullanın. İsim Mevcut';
    }
    _sinavlar.add(yeniSinav);
    notifyListeners();
    await DbHelper.insert('sinavlar', {
      'sinavAdi': yeniSinav.sinavAdi,
      'diplomaPuani': yeniSinav.diplomaPuani,
      'tytTurkceNet': yeniSinav.tytTurkceNet,
      'tytMatNet': yeniSinav.tytMatNet,
      'tytSosNet': yeniSinav.tytSosNet,
      'tytFenNet': yeniSinav.tytFenNet,
      'tytHamPuan': yeniSinav.tytHamPuan,
      'aytSayMatNet': yeniSinav.aytSayMatNet,
      'aytSayFizikNet': yeniSinav.aytSayFizikNet,
      'aytSayBioNet': yeniSinav.aytSayBioNet,
      'aytSayKimyaNet': yeniSinav.aytSayKimyaNet,
      'aytHamSayPuan': yeniSinav.aytHamSayPuan,
      'aytEaEdebNet': yeniSinav.aytEaEdebNet,
      'aytEaMatNet': yeniSinav.aytEaMatNet,
      'aytEaCog1Net': yeniSinav.aytEaCog1Net,
      'aytEaTar1Net': yeniSinav.aytEaTar1Net,
      'aytHamEaPuan': yeniSinav.aytHamEaPuan,
      'aytDilNet': yeniSinav.aytDilNet,
      'aytHamDilPuan': yeniSinav.aytHamDilPuan,
      'aytSozCog1Net': yeniSinav.aytSozCog1Net,
      'aytSozCog2Net': yeniSinav.aytSozCog2Net,
      'aytSozEdebNet': yeniSinav.aytSozEdebNet,
      'aytSozTar1Net': yeniSinav.aytSozTar1Net,
      'aytSozTar2Net': yeniSinav.aytSozTar2Net,
      'aytSozDinNet': yeniSinav.aytSozDinNet,
      'aytSozFelNet': yeniSinav.aytSozFelNet,
      'aytHamSozPuan': yeniSinav.aytHamSozPuan,
    });
  }

  Future<void> dbDataCek() async {
    final sinavData = await DbHelper.getData('sinavlar');
  
    _sinavlar = sinavData
        .map((item) => Sinav(
              id: item['id'],
              sinavAdi: item['sinavAdi'],
              diplomaPuani: item['diplomaPuani'],
              tytTurkceNet: item['tytTurkceNet'],
              tytMatNet: item['tytMatNet'],
              tytSosNet: item['tytSosNet'],
              tytFenNet: item['tytFenNet'],
              tytHamPuan: item['tytHamPuan'],
              aytSayMatNet: item['aytSayMatNet'],
              aytSayFizikNet: item['aytSayFizikNet'],
              aytSayKimyaNet: item['aytSayKimyaNet'],
              aytSayBioNet: item['aytSayBioNet'],
              aytHamSayPuan: item['aytHamSayPuan'],
              aytEaMatNet: item['aytEaMatNet'],
              aytEaEdebNet: item['aytEaEdebNet'],
              aytEaCog1Net: item['aytEaCog1Net'],
              aytEaTar1Net: item['aytEaTar1Net'],
              aytHamEaPuan: item['aytHamEaPuan'],
              aytDilNet: item['aytDilNet'],
              aytHamDilPuan: item['aytHamDilPuan'],
              aytSozCog1Net: item['aytSozCog1Net'],
              aytSozCog2Net: item['aytSozCog2Net'],
              aytSozDinNet: item['aytSozDinNet'],
              aytSozEdebNet: item['aytSozEdebNet'],
              aytSozFelNet: item['aytSozFelNet'],
              aytSozTar1Net: item['aytSozTar1Net'],
              aytSozTar2Net: item['aytSozTar2Net'],
              aytHamSozPuan: item['aytHamSozPuan'],
            ))
        .toList();
       
   
  }

  Future<void> sinavSil(int id) async {
    _sinavlar.removeWhere((f) => f.id == id);
    notifyListeners();
    await DbHelper.delete('sinavlar', id);
  }

  List<Sinav> get sinavlariCek {
    return _sinavlar;
  }

  Future<Map<String, dynamic>> siralamaCek(
      {@required int htytp,
      int hsozp,
      int hsayp,
      int heap,
      int hdilp,
      @required int ytytp,
      int ysozp,
      int ysayp,
      int yeap,
      int ydilp}) async {
    const url = 'https://ekinabalioglu.com/api/siralama.php';

    final postVeri = {
      'htytp': htytp.toString(),
      'hsayp': hsayp.toString(),
      'hsozp': hsozp.toString(),
      'heap': heap.toString(),
      'hdilp': hdilp.toString(),
      'ytytp': ytytp.toString(),
      'ysayp': ysayp.toString(),
      'ysozp': ysozp.toString(),
      'yeap': yeap.toString(),
      'ydilp': ydilp.toString(),
    };
    try {
      final response = await http.post(url, body: postVeri);
      final cekilenVeri = jsonDecode(response.body);
      return cekilenVeri;
    } catch (e) {
      throw e;
    }

    
  }
}
