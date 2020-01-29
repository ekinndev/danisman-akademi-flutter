import 'package:akademiapp/models/konu_adi.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import '../models/sinav.dart';

class GrafikItem extends StatelessWidget {
  final title;
  final List<Sinav> sinavlar;
  final Alan alansec;

  GrafikItem(this.title, this.sinavlar, this.alansec);

  List<FlSpot> _noktalariCek() {
    double i = 0;
    List<FlSpot> liste = [];
    if (alansec == Alan.Tyt) {
      sinavlar.forEach((f) {
        liste += [FlSpot(i, (f.tytHamPuan + f.diplomaPuani * 0.6) / 100)];
        i++;
      });
    } else if (alansec == Alan.Say) {
      sinavlar.forEach((f) {
        liste += [FlSpot(i, (f.aytHamSayPuan + f.diplomaPuani * 0.6) / 100)];
        i++;
      });
    } else if (alansec == Alan.Ea) {
      sinavlar.forEach((f) {
        liste += [FlSpot(i, (f.aytHamEaPuan + f.diplomaPuani * 0.6) / 100)];
        i++;
      });
    } else if (alansec == Alan.Soz) {
      sinavlar.forEach((f) {
        liste += [FlSpot(i, (f.aytHamSozPuan + f.diplomaPuani * 0.6) / 100)];
        i++;
      });
    } else if (alansec == Alan.Dil) {
      sinavlar.forEach((f) {
        liste += [FlSpot(i, (f.aytHamDilPuan + f.diplomaPuani * 0.6) / 100)];
        i++;
      });
    }

    return liste;
  }

  @override
  Widget build(BuildContext context) {
    List<Color> gradientColors = [
      Color(0xff23b6e6),
      Color(0xff02d39a),
    ];
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Text(
            title + ' GRAFIK',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
        AspectRatio(
          aspectRatio: 2.70,
          child: Container(
            child: Padding(
              padding: const EdgeInsets.only(
                  right: 28.0, left: 12.0, top: 24, bottom: 0),
              child: LineChart(
                LineChartData(
                  titlesData: FlTitlesData(
                    show: true,
                    bottomTitles: SideTitles(
                      showTitles: false,
                      reservedSize: 0,
                      textStyle: TextStyle(
                          color: const Color(0xff67727d),
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                      getTitles: (value) {
                        return '';
                      },
                      margin: 8,
                    ),
                    leftTitles: SideTitles(
                      showTitles: true,
                      textStyle: TextStyle(
                        color: const Color(0xff67727d),
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                      getTitles: (value) {
                        switch (value.toInt()) {
                          case 1:
                            return '100';
                          case 2:
                            return '200';
                          case 3:
                            return '300';
                          case 4:
                            return '400';
                          case 5:
                            return '500';
                        }
                        return '';
                      },
                      reservedSize: 28,
                      margin: 12,
                    ),
                  ),
                  borderData: FlBorderData(
                      show: true,
                      border: Border.all(color: Color(0xff37434d), width: 1)),
                  minX: 0,
                  maxX: sinavlar.length.toDouble() - 1,
                  minY: 0,
                  maxY: 6,
                  lineBarsData: [
                    LineChartBarData(
                      spots: _noktalariCek(),
                      isCurved: true,
                      colors: gradientColors,
                      barWidth: 3,
                      isStrokeCapRound: true,
                      dotData: FlDotData(
                        show: false,
                      ),
                      belowBarData: BarAreaData(
                        show: true,
                        colors: gradientColors
                            .map((color) => color.withOpacity(0.3))
                            .toList(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Divider(),
      ],
    );
  }
}
