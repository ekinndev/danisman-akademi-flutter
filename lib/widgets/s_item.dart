import 'package:akademiapp/models/sinav.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import '../providers/sinavlarim_prov.dart';

class Sitem extends StatefulWidget {
  final Sinav sinav;
  final Function silHandler;

  Sitem(this.sinav, this.silHandler);

  @override
  _SitemState createState() => _SitemState();
}



class _SitemState extends State<Sitem> {
  List puanlar = [];
  double tytYerPuanCard;
  double aytYerPuanCard;

  @override
  void initState() {
    _puanVeVerileriCek();
    super.initState();
  }

  var expanded = false;

  Future<void> _puanVeVerileriCek() async {
    List<double> puanKarsilastir = [
      widget.sinav.aytHamEaPuan,
      widget.sinav.aytHamDilPuan,
      widget.sinav.aytHamSayPuan,
      widget.sinav.aytHamSozPuan,
    ];

    tytYerPuanCard = widget.sinav.tytHamPuan + widget.sinav.diplomaPuani * 0.6;
    print(tytYerPuanCard);
    puanKarsilastir.sort();
    aytYerPuanCard = puanKarsilastir[3] + widget.sinav.diplomaPuani * 0.6;
    try {
      final siralamalar =
          await (Provider.of<SinavProvider>(context, listen: false).siralamaCek(
        htytp: (widget.sinav.tytHamPuan).toInt(),
        ytytp:
            (widget.sinav.tytHamPuan + widget.sinav.diplomaPuani * 0.6).toInt(),
        ysayp: (widget.sinav.aytHamSayPuan + widget.sinav.diplomaPuani * 0.6)
            .toInt(),
        hsayp: (widget.sinav.aytHamSayPuan).toInt(),
        ysozp: (widget.sinav.aytHamSozPuan + widget.sinav.diplomaPuani * 0.6)
            .toInt(),
        hsozp: (widget.sinav.aytHamSozPuan).toInt(),
        ydilp: (widget.sinav.aytHamDilPuan + widget.sinav.diplomaPuani * 0.6)
            .toInt(),
        hdilp: (widget.sinav.aytHamDilPuan).toInt(),
        yeap: (widget.sinav.aytHamDilPuan + widget.sinav.diplomaPuani * 0.6)
            .toInt(),
        heap: (widget.sinav.aytHamEaPuan).toInt(),
      ))
              .catchError((e) {
        Scaffold.of(context).showSnackBar(SnackBar(
          content: Text(
            'Sunucua Bağlanırken Hata Oluştu Sıralamalar Görüntülenemeyecek !',
            textAlign: TextAlign.center,
          ),
        ));
      }) as Map<String, dynamic>;
      puanlar.add(siralamalar['hTytSiralama']);
      puanlar.add(siralamalar['yTytSiralama']);
      puanlar.add(siralamalar['hSaySiralama']);
      puanlar.add(siralamalar['ySaySiralama']);
      puanlar.add(siralamalar['hEaSiralama']);
      puanlar.add(siralamalar['yEaSiralama']);
      puanlar.add(siralamalar['hSozSiralama']);
      puanlar.add(siralamalar['ySozSiralama']);
      puanlar.add(siralamalar['hDilSiralama']);
      puanlar.add(siralamalar['yDilSiralama']);
    } catch (e) {
      puanlar.add(0);
      puanlar.add(0);
      puanlar.add(0);
      puanlar.add(0);
      puanlar.add(0);
      puanlar.add(0);
      puanlar.add(0);
      puanlar.add(0);
      puanlar.add(0);
      puanlar.add(0);
    }
  }

  Widget _puanGrupla(int i) {
    if (i == 0) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text('Ham TYT Sıralama:'),
          Text(puanlar[i].toString()),
        ],
      );
    } else if (i == 1) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text('Yer TYT Sıralama:'),
          Text(puanlar[i].toString()),
        ],
      );
    } else if (i == 2) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text('Ham Say Sıralama:'),
          Text(puanlar[i].toString()),
        ],
      );
    } else if (i == 3) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text('Yer Say Sıralama:'),
          Text(puanlar[i].toString()),
        ],
      );
    } else if (i == 4) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text('Ham Ea Sıralama:'),
          Text(puanlar[i].toString()),
        ],
      );
    } else if (i == 5) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text('Yer Ea Sıralama:'),
          Text(puanlar[i].toString()),
        ],
      );
    } else if (i == 6) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text('Ham Söz Sıralama:'),
          Text(puanlar[i].toString()),
        ],
      );
    } else if (i == 7) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text('Yer Söz Sıralama:'),
          Text(puanlar[i].toString()),
        ],
      );
    } else if (i == 8) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text('Ham Dil Sıralama:'),
          Text(puanlar[i].toString()),
        ],
      );
    } else if (i == 9) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text('Yer Dil Sıralama:'),
          Text(puanlar[i].toString()),
        ],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      direction: DismissDirection.endToStart,
      onDismissed: (direction) {
        widget.silHandler(widget.sinav.id);
      },
      background: Container(
        margin: EdgeInsets.symmetric(vertical: 5),
        padding: EdgeInsets.only(right: 20),
        child: Icon(
          Icons.delete,
          color: Colors.white,
          size: 30,
        ),
        alignment: Alignment.centerRight,
        color: Theme.of(context).errorColor,
      ),
      key: ValueKey(widget.sinav.sinavAdi),
      child: Column(
        children: <Widget>[
          Card(
            margin: EdgeInsets.symmetric(vertical: 5),
            child: ListTile(
              leading: Icon(FontAwesomeIcons.checkCircle),
              title: Text(widget.sinav.sinavAdi),
              subtitle: Text('TYT:' +
                  tytYerPuanCard.toStringAsFixed(2) +
                  ' AYT:' +
                  aytYerPuanCard.toStringAsFixed(2)),
              trailing: IconButton(
                icon: Icon(
                  expanded ? Icons.expand_less : Icons.expand_more,
                ),
                onPressed: () {
                  setState(() {
                    expanded = !expanded;
                  });
                },
              ),
            ),
          ),
          if (expanded)
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
              height: 180,
              child: ListView.builder(
                itemBuilder: (c, i) {
                  return _puanGrupla(i);
                },
                itemCount: puanlar.length,
              ),
            ),
        ],
      ),
    );
  }
}
