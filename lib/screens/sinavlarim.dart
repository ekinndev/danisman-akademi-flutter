import 'package:akademiapp/widgets/s_item.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import './sinav_ekle.dart';
import '../widgets/drawer.dart';
import './sinav_detail_screen.dart';
import '../providers/sinavlarim_prov.dart';

class Sinavlarim extends StatefulWidget {
  static const sinavlarimRoute = '/sinavlarim';

  @override
  _SinavlarimState createState() => _SinavlarimState();
}

class _SinavlarimState extends State<Sinavlarim> {
  var expanded = false;

  @override
  Widget build(BuildContext context) {
    final sinavlariProv = Provider.of<SinavProvider>(context, listen: false);
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(
        title: const Text('Sınavlarım'),
        backgroundColor: Color(int.parse('0xFF2C3E50')),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(SinavEkle.sinavEkleRoute);
            },
          )
        ],
      ),
      body: FutureBuilder(
          future: sinavlariProv.dbDataCek(),
          builder: (ctx, snapshot) {
            final sinavlariCek = sinavlariProv.sinavlariCek;

            return snapshot.connectionState == ConnectionState.waiting
                ? Center(child: CircularProgressIndicator())
                : Consumer<SinavProvider>(
                    builder: (ctx, sinavpro, child) => sinavlariCek.length <= 0
                        ? child
                        : ListView.builder(
                            itemBuilder: (ctx, i) {
                              return GestureDetector(
                                onTap: () => Navigator.of(context).pushNamed(
                                  SinavDetailScreen.sinavDetailRoute,
                                  arguments: sinavlariCek[i],
                                ),
                                child: Sitem(
                                  sinavlariCek[i],
                                  sinavlariProv.sinavSil,
                                ),
                              );
                            },
                            itemCount: sinavlariCek.length,
                          ),
                    child: Center(
                      child: Text('Henüz Sınav Eklemedin.'),
                    ),
                  );
          }),
    );
  }
}
