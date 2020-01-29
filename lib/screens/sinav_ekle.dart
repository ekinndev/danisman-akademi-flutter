import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../providers/sinavlarim_prov.dart';
import 'package:provider/provider.dart';
import '../models/sinav.dart';
import '../widgets/form_item.dart';
import '../widgets/genel_item.dart';

class SinavEkle extends StatefulWidget {
  static const sinavEkleRoute = '/sinav-ekle';
  @override
  _SinavEkleState createState() => _SinavEkleState();
}

final _formKey = GlobalKey<FormState>();

class _SinavEkleState extends State<SinavEkle> {
  var _scaffoldKey =  GlobalKey<ScaffoldState>();
  var _yeniSinav = Sinav(
    sinavAdi: '',
    diplomaPuani: 0,
    tytTurkceNet: 0,
    tytMatNet: 0,
    tytSosNet: 0,
    tytFenNet: 0,
    tytHamPuan: 0,
    aytSayMatNet: 0,
    aytSayFizikNet: 0,
    aytSayKimyaNet: 0,
    aytSayBioNet: 0,
    aytHamSayPuan: 0,
    aytEaMatNet: 0,
    aytEaEdebNet: 0,
    aytEaCog1Net: 0,
    aytEaTar1Net: 0,
    aytHamEaPuan: 0,
    aytDilNet: 0,
    aytHamDilPuan: 0,
    aytSozCog1Net: 0,
    aytSozCog2Net: 0,
    aytSozDinNet: 0,
    aytSozFelNet: 0,
    aytSozEdebNet: 0,
    aytSozTar1Net: 0,
    aytSozTar2Net: 0,
    aytHamSozPuan: 0,
  );

  double _hamTytHesapla() {
    return (_yeniSinav.tytTurkceNet * 3.3 +
        _yeniSinav.tytMatNet * 3.3 +
        _yeniSinav.tytSosNet * 3.4 +
        _yeniSinav.tytFenNet * 3.4 +
        100);
  }

  double _hamSayHesapla() {
    final tytAlanPuan = (_yeniSinav.tytTurkceNet * 1.32 +
        _yeniSinav.tytMatNet * 1.32 +
        _yeniSinav.tytSosNet * 1.36 +
        _yeniSinav.tytFenNet * 1.36);
    return ((_yeniSinav.aytSayMatNet * 3 +
            _yeniSinav.aytSayFizikNet * 2.85 +
            _yeniSinav.aytSayKimyaNet * 3.07 +
            _yeniSinav.aytSayBioNet * 3.07) +
        tytAlanPuan +
        100);
  }

  double _hamSozHesapla() {
    final tytAlanPuan = (_yeniSinav.tytTurkceNet * 1.32 +
        _yeniSinav.tytMatNet * 1.32 +
        _yeniSinav.tytSosNet * 1.36 +
        _yeniSinav.tytFenNet * 1.36);
    return (_yeniSinav.aytSozEdebNet * 3 +
        _yeniSinav.aytSozTar1Net * 2.8 +
        _yeniSinav.aytSozCog1Net * 3.33 +
        _yeniSinav.aytSozTar2Net * 2.91 +
        _yeniSinav.aytSozCog2Net * 2.91 +
        _yeniSinav.aytSozFelNet * 3 +
        _yeniSinav.aytSozDinNet * 3.33 +
        tytAlanPuan +
        100);
  }

  double _hamEaHesapla() {
    final tytAlanPuan = (_yeniSinav.tytTurkceNet * 1.32 +
        _yeniSinav.tytMatNet * 1.32 +
        _yeniSinav.tytSosNet * 1.36 +
        _yeniSinav.tytFenNet * 1.36);
    return (_yeniSinav.aytEaMatNet * 3 +
        _yeniSinav.aytEaEdebNet * 3 +
        _yeniSinav.aytEaTar1Net * 2.8 +
        _yeniSinav.aytEaCog1Net * 3.33 +
        tytAlanPuan +
        100);
  }

  double _hamDilHesapla() {
    final tytAlanPuan = (_yeniSinav.tytTurkceNet * 1.32 +
        _yeniSinav.tytMatNet * 1.32 +
        _yeniSinav.tytSosNet * 1.36 +
        _yeniSinav.tytFenNet * 1.36);
    return (_yeniSinav.aytDilNet * 3 + tytAlanPuan + 100);
  }

  void sinaviKaydet(BuildContext ctx) {
    final ekleProv = Provider.of<SinavProvider>(context, listen: false);
    _formKey.currentState.save();
    final dyDurum = ekleProv.dogruYanlisCek;

    _yeniSinav = Sinav(
      sinavAdi: dyDurum[0],
      diplomaPuani: dyDurum[1],
      tytTurkceNet: int.parse(dyDurum[2]) - int.parse(dyDurum[3]) * 0.25,
      tytMatNet: int.parse(dyDurum[4]) - int.parse(dyDurum[5]) * 0.25,
      tytSosNet: int.parse(dyDurum[6]) - int.parse(dyDurum[7]) * 0.25,
      tytFenNet: int.parse(dyDurum[8]) - int.parse(dyDurum[9]) * 0.25,
      aytSayMatNet: int.parse(dyDurum[10]) - int.parse(dyDurum[11]) * 0.25,
      aytSayFizikNet: int.parse(dyDurum[12]) - int.parse(dyDurum[13]) * 0.25,
      aytSayKimyaNet: int.parse(dyDurum[14]) - int.parse(dyDurum[15]) * 0.25,
      aytSayBioNet: int.parse(dyDurum[16]) - int.parse(dyDurum[17]) * 0.25,
      aytEaEdebNet: int.parse(dyDurum[18]) - int.parse(dyDurum[19]) * 0.25,
      aytEaMatNet: int.parse(dyDurum[20]) - int.parse(dyDurum[21]) * 0.25,
      aytEaTar1Net: int.parse(dyDurum[22]) - int.parse(dyDurum[23]) * 0.25,
      aytEaCog1Net: int.parse(dyDurum[24]) - int.parse(dyDurum[25]) * 0.25,
      aytSozEdebNet: int.parse(dyDurum[26]) - int.parse(dyDurum[27]) * 0.25,
      aytSozTar1Net: int.parse(dyDurum[28]) - int.parse(dyDurum[29]) * 0.25,
      aytSozTar2Net: int.parse(dyDurum[30]) - int.parse(dyDurum[31]) * 0.25,
      aytSozCog1Net: int.parse(dyDurum[32]) - int.parse(dyDurum[33]) * 0.25,
      aytSozCog2Net: int.parse(dyDurum[34]) - int.parse(dyDurum[35]) * 0.25,
      aytSozDinNet: int.parse(dyDurum[36]) - int.parse(dyDurum[37]) * 0.25,
      aytSozFelNet: int.parse(dyDurum[38]) - int.parse(dyDurum[39]) * 0.25,
      aytDilNet: int.parse(dyDurum[40]) - int.parse(dyDurum[41]) * 0.25,
    );
    final double hamdil = _hamDilHesapla();
    final double hamea = _hamEaHesapla();
    final double hamtyt = _hamTytHesapla();
    final double hamsay = _hamSayHesapla();
    final double hamsoz = _hamSozHesapla();
    _yeniSinav = Sinav(
      sinavAdi: _yeniSinav.sinavAdi,
      diplomaPuani: _yeniSinav.diplomaPuani,
      tytTurkceNet: _yeniSinav.tytTurkceNet,
      tytMatNet: _yeniSinav.tytMatNet,
      tytSosNet: _yeniSinav.tytSosNet,
      tytFenNet: _yeniSinav.tytFenNet,
      aytSayMatNet: _yeniSinav.aytSayMatNet,
      aytSayFizikNet: _yeniSinav.aytSayFizikNet,
      aytSayKimyaNet: _yeniSinav.aytSayKimyaNet,
      aytSayBioNet: _yeniSinav.aytSayBioNet,
      aytEaEdebNet: _yeniSinav.aytEaEdebNet,
      aytEaMatNet: _yeniSinav.aytEaMatNet,
      aytEaTar1Net: _yeniSinav.aytEaTar1Net,
      aytEaCog1Net: _yeniSinav.aytEaCog1Net,
      aytSozEdebNet: _yeniSinav.aytSozEdebNet,
      aytSozTar1Net: _yeniSinav.aytSozTar1Net,
      aytSozTar2Net: _yeniSinav.aytSozTar2Net,
      aytSozCog1Net: _yeniSinav.aytSozCog1Net,
      aytSozCog2Net: _yeniSinav.aytSozCog2Net,
      aytSozDinNet: _yeniSinav.aytSozDinNet,
      aytSozFelNet: _yeniSinav.aytSozFelNet,
      aytDilNet: _yeniSinav.aytDilNet,
      aytHamDilPuan: hamdil,
      aytHamSozPuan: hamsoz,
      aytHamSayPuan: hamsay,
      aytHamEaPuan: hamea,
      tytHamPuan: hamtyt,
    );

    ekleProv.dogruYanlisTemizle();

    ekleProv.sinavEkle(_yeniSinav).then((_) {
      Navigator.pop(context);
    }).catchError((hata) {
      _scaffoldKey.currentState.showSnackBar(SnackBar(
        duration: Duration(seconds: 1),
        content: Text(hata),
      ));
    });
  }
 

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Color(int.parse('0xFF2C3E50')),
        title: Text('Yeni Sınav Ekle'),
      ),
      body: Form(
        key: _formKey,
        autovalidate: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      GenelItem('Sınav Adı:', true),
                      GenelItem('Diploma Notu:', false),
                      Divider(),
                      Text(
                        'TYT Bölümü',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Divider(),
                      FormItem('Türkçe'),
                      FormItem('Matematik'),
                      FormItem('Sosyal'),
                      FormItem('Fen'),
                      Divider(),
                      Text(
                        'AYT Say Bölümü',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Divider(),
                      FormItem('Matematik'),
                      FormItem('Fizik'),
                      FormItem('Kimya'),
                      FormItem('Biyoloji'),
                      Divider(),
                      Text(
                        'AYT Ea Bölümü',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Divider(),
                      FormItem('Edebiyat'),
                      FormItem('Matematik'),
                      FormItem('Tarih-1'),
                      FormItem('Coğrafya-1'),
                      Divider(),
                      Text('AYT Söz Bölümü'),
                      Divider(),
                      FormItem('Edebiyat'),
                      FormItem('Tarih-1'),
                      FormItem('Tarih-2'),
                      FormItem('Coğrafya-1'),
                      FormItem('Coğrafya-2'),
                      FormItem('Din'),
                      FormItem('Felsefe'),
                      Divider(),
                      Text('AYT Dil Bölümü'),
                      Divider(),
                      FormItem('Dil'),
                    ],
                  ),
                ),
              ),
            ),
            RaisedButton.icon(
              icon: Icon(FontAwesomeIcons.save),
              label: Text('Sınavı Ekle'),
              onPressed: () {
                sinaviKaydet(context);
              },
              elevation: 0,
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              color: Colors.amber,
            )
          ],
        ),
      ),
    );
  }
}
