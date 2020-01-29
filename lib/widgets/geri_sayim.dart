import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class GeriSayim extends StatelessWidget {
  int kalanGun;

  double kacGunKaldiYuzde({
    @required int yil,
    @required int ay,
    @required int gun,
  }) {
    double kalanyuzde;

    DateTime suan = DateTime.now();
    final gelecekTarih = DateTime(yil, ay, gun);
    kalanGun = gelecekTarih.difference(suan).inDays;

    kalanyuzde = 1 - kalanGun / 365;

    if (kalanyuzde > 1 || kalanyuzde < 0) {
      return 1.0;
    } else {
      return kalanyuzde;
    }
  }

  @override
  Widget build(BuildContext context) {
    final radius = MediaQuery.of(context).size.width * 0.40 <=
            MediaQuery.of(context).size.height * 0.40
        ? MediaQuery.of(context).size.width * 0.40
        : MediaQuery.of(context).size.height * 0.40;
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            blurRadius: 1,
            spreadRadius: 1,
            color: Colors.grey.withOpacity(0.8),
            offset: Offset(
              2.0, // horizontal, move right 10
              2.0, // vertical, move down 10
            ),
          ),
        ],
        color: Color(int.parse('0xFFFFFFFF')),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Column(
            children: <Widget>[
              Text('TYT SINAVI', style: TextStyle(fontWeight: FontWeight.bold)),
              CircularPercentIndicator(
                radius: radius,
                lineWidth: 5.0,
                percent: kacGunKaldiYuzde(ay: 06, gun: 20, yil: 2020),
                center: FittedBox(
                  fit: BoxFit.cover,
                  child: Text("$kalanGun gün kaldı."),
                ),
                progressColor: kalanGun <= 90 ? Colors.red : Colors.green,
              ),
            ],
          ),
          Column(
            children: <Widget>[
              Text('YKS 2. OTURUM ve DİL ',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              CircularPercentIndicator(
                radius: radius,
                lineWidth: 5.0,
                percent: kacGunKaldiYuzde(ay: 06, gun: 21, yil: 2020),
                center: FittedBox(
                  fit: BoxFit.cover,
                  child: Text("$kalanGun gün kaldı."),
                ),
                progressColor: kalanGun <= 90 ? Colors.red : Colors.green,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
