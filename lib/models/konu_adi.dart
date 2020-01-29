import 'package:flutter/widgets.dart';

enum Alan { Say, Dil, Soz, SayEa, EaSoz, Tyt, Ea }

class KonuAdi {
  final id;
  final konu;
  bool durum;

  final dersKey;
  final Alan alanKey;
  final ks;

  KonuAdi({
    this.id,
    @required this.konu,
    this.durum = false,
    this.ks,
    @required this.dersKey,
    @required this.alanKey,
  });
}
