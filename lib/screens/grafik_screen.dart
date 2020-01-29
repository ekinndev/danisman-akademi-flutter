
import 'package:akademiapp/models/konu_adi.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/drawer.dart';
import '../providers/sinavlarim_prov.dart';
import '../widgets/grafik_item.dart';

class GrafikScreen extends StatelessWidget {
  static const grafikScreenRoute = '/grafikler';

  @override
  Widget build(BuildContext context) {
 
    return Scaffold(
      
      drawer: MainDrawer(),
      appBar: AppBar(
          title: const Text('Grafikler'),
          backgroundColor: Color(int.parse('0xFF2C3E50'))),
      body: FutureBuilder(
          future:
              Provider.of<SinavProvider>(context, listen: false).dbDataCek(),
          builder: (ctx, snapshot) {
            final sinavlariCek =
                Provider.of<SinavProvider>(context, listen: false).sinavlariCek;

            return snapshot.connectionState == ConnectionState.waiting
                ? Center(child: CircularProgressIndicator())
                : Consumer<SinavProvider>(
                    builder: (ctx, sinavpro, child) => sinavlariCek.length <= 0
                        ? child
                        : ListView(
                            children: <Widget>[
                              GrafikItem('TYT SINAV', sinavlariCek, Alan.Tyt),
                              GrafikItem('SAY SINAV', sinavlariCek, Alan.Say),
                              GrafikItem('EA SINAV', sinavlariCek, Alan.Ea),
                              GrafikItem('SOZ SINAV', sinavlariCek, Alan.Soz),
                              GrafikItem('DIL SINAV', sinavlariCek, Alan.Dil),
                            ],
                          ),
                    child: Center(
                      child: Text('Henüz Sınav Eklemedin.'),
                    ),
                  );
          }),
    );
  }
}
