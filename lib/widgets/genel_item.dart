import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/sinavlarim_prov.dart';

class GenelItem extends StatelessWidget {
  final _genelItemAd;
  final bool durum;
  GenelItem(this._genelItemAd, this.durum);
  @override
  Widget build(BuildContext context) {
    final dyProv = Provider.of<SinavProvider>(context);
    return TextFormField(
      initialValue: durum ? 'Adsız' : '85',
      decoration: InputDecoration(labelText: '$_genelItemAd'),
      keyboardType: durum ? TextInputType.text : TextInputType.number,
      validator: (deger) {
        if (deger.isEmpty) {
          return 'Boş alan bırakılamaz.';
        } else {
          if (!durum) {
            if (!RegExp(r'^\d+$').hasMatch(deger)) {
              return 'Lütfen geçerli bir değer girin.';
            } else {
              if (int.parse(deger) < 0 ||
                  int.parse(deger) < 50 ||
                  int.parse(deger) > 100) {
                return 'Geçerli bir diploma puanı girin.';
              }
            }
          }
        }
        return null;
      },
      onSaved: (deger) {
        if (!deger.isEmpty) {
          durum
              ? dyProv.dogruYanlisEkle(deger)
              : dyProv.dogruYanlisEkle(int.parse(deger));
        } else {
          durum ? dyProv.dogruYanlisEkle('Adsız') : dyProv.dogruYanlisEkle(80);
        }
      },
    );
  }
}
