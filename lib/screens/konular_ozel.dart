import 'package:flutter/material.dart';

import '../providers/data_konu.dart';
import 'package:provider/provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class KonularOzel extends StatelessWidget {
  static const konularOzelRoute = '/konular-ozel';

  final kacKaynakController = TextEditingController(text: '0');
 
  void kaynakEklemeyeBasla(
      BuildContext ctx, Function update, int id, bool durum) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: ctx,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          behavior: HitTestBehavior.opaque,
          child: Container(
            padding:
                EdgeInsets.only(bottom: MediaQuery.of(ctx).viewInsets.bottom),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Text('Kaç kaynaktan bu konuyu bitirdiniz ?'),
                      TextField(
                    
                        maxLength: 1,
                        controller: kacKaynakController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(labelText: 'Sayı'),
                      ),
                    ],
                  ),
                  RaisedButton(
                    child: Text('Kaydet'),
                    onPressed: () {
                      if (kacKaynakController.text.isEmpty) {
                        return;
                      } else {
                        if (!RegExp(r'^\d+$')
                            .hasMatch(kacKaynakController.text)) {
                          return;
                        } else {
                          if (int.parse(kacKaynakController.text) <= 0) {
                            return;
                          } else {
                            update(
                                hangiEleman: id,
                                durum: durum,
                                ks: int.parse(kacKaynakController.text));
                          }
                          Navigator.of(ctx).pop();
                        }
                      }
                    },
                    color: Colors.amber,
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final _dataProvider = Provider.of<DataKonu>(context);
    final _listeKey = ModalRoute.of(context).settings.arguments as List;
    final _kullanilacakListe = _dataProvider.listeyiSec(_listeKey[0]);

    return Scaffold(
   
      appBar: AppBar(
        backgroundColor: Color(int.parse('0xFF2C3E50')),
        title: Text(_listeKey[1]),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.12,
            child: Card(
              elevation: 3.0,
              color: _kullanilacakListe[index].durum
                  ? Colors.lightGreen
                  : Colors.white,
              child: ListTile(
                leading: Icon(
                  FontAwesomeIcons.book,
                ),
                title: Text(
                  _kullanilacakListe[index].konu,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text('Şu kadar kaynaktan bitirdin:' +
                    _kullanilacakListe[index].ks.toString()),
                trailing: IconButton(
                  icon: Icon(_kullanilacakListe[index].durum
                      ? FontAwesomeIcons.trashAlt
                      : FontAwesomeIcons.checkCircle),
                  onPressed: () {
                    if (_kullanilacakListe[index].durum) {
                      _dataProvider.listeyiUpdatele(
                          hangiEleman: _kullanilacakListe[index].id,
                          ks: 0,
                          durum: !(_kullanilacakListe[index].durum));
                    } else {
                      kaynakEklemeyeBasla(
                          context,
                          _dataProvider.listeyiUpdatele,
                          _kullanilacakListe[index].id,
                          !(_kullanilacakListe[index].durum));
                    }
                  },
                ),
              ),
            ),
          );
        },
        itemCount: _kullanilacakListe.length,
      ),
    );
  }
}
