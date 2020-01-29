import '../widgets/drawer.dart';
import 'package:akademiapp/providers/data_konu.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './konular_ozel.dart';

class KonularAna extends StatelessWidget {
  static const konularAnaRoute = '/AnaKonular';

  @override
  Widget build(BuildContext context) {
    var dersProv = Provider.of<DataKonu>(context, listen: false);
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(
        backgroundColor: Color(int.parse('0xFF2C3E50')),
        title: Text('Ders Seçin'),
      ),
      body: FutureBuilder(
          future: dersProv.dbDataCek(),
          builder: (ctx, snapshot) {
            final dersBaslik = dersProv.konuBasliklariCek;

            return snapshot.connectionState == ConnectionState.waiting
                ? Center(child: CircularProgressIndicator()):ListView.builder(
              itemBuilder: (ctx, index) {
                return RaisedButton(
                  color: dersBaslik[index].renk,
                  textColor: Colors.white,
                  child: Text(dersBaslik[index].dersAdi),
                  onPressed: () {
                    Navigator.of(context)
                        .pushNamed(KonularOzel.konularOzelRoute, arguments: [
                      dersBaslik[index].id,
                      dersBaslik[index].dersAdi
                    ]);
                  },
                );
              },
              itemCount: dersBaslik.length,
            );
          }),
    );
  }
}
