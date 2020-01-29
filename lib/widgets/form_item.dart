import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/sinavlarim_prov.dart';

class FormItem extends StatelessWidget {
  final dersIsim;

  FormItem(this.dersIsim);
  @override
  Widget build(BuildContext context) {
    final ekleHandler = Provider.of<SinavProvider>(context, listen: false);
    return Row(
      children: <Widget>[
        Flexible(
          child: TextFormField(
            initialValue: '0',
            decoration: InputDecoration(labelText: '$dersIsim Doğru:'),
            keyboardType: TextInputType.number,
            validator: (deger) {
              if (deger.isEmpty) {
                return 'Boş alan bırakılamaz.';
              } else {
                if (!RegExp(r'^\d+$').hasMatch(deger)) {
                  return 'Lütfen geçerli bir değer girin.';
                } else {
                  if (int.parse(deger) < 0) {
                    return 'Negatif değer girilemez.';
                  }
                }
              }
              return null;
            },
            onSaved: (deger) {
              ekleHandler.dogruYanlisEkle(deger);
            },
          ),
        ),
        SizedBox(
          width: 20,
        ),
        Flexible(
          child: TextFormField(
            validator: (deger) {
              if (deger.isEmpty) {
                return 'Boş alan bırakılamaz.';
              } else {
                if (!RegExp(r'^\d+$').hasMatch(deger)) {
                  return 'Lütfen geçerli bir değer girin.';
                } else {
                  if (int.parse(deger) < 0) {
                    return 'Negatif değer girilemez.';
                  }
                }
              }
              return null;
            },
            initialValue: '0',
            decoration: InputDecoration(labelText: '$dersIsim Yanlış:'),
            keyboardType: TextInputType.number,
            onSaved: (deger) {
              ekleHandler.dogruYanlisEkle(deger);
            },
          ),
        ),
      ],
    );
  }
}
