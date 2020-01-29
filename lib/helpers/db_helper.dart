import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as path;

class DbHelper {
  static List<Map<String, dynamic>> _varsayilanKonu = [
    {
      'dersKey': 'tytturk',
      'konu': 'Sözcükte Anlam',
      'durum': 'false',
      'alanKey': 'Alan.Tyt'
    },
    {
      'dersKey': 'tytturk',
      'konu': 'Cümlede Anlam',
      'durum': 'false',
      'alanKey': 'Alan.Tyt'
    },
    {
      'dersKey': 'tytturk',
      'konu': 'Paragraf',
      'durum': 'false',
      'alanKey': 'Alan.Tyt'
    },
    {
      'dersKey': 'tytturk',
      'konu': 'Ses Bilgisi',
      'durum': 'false',
      'alanKey': 'Alan.Tyt'
    },
    {
      'dersKey': 'tytturk',
      'konu': 'Yazım Kuralları',
      'durum': 'false',
      'alanKey': 'Alan.Tyt'
    },
    {
      'dersKey': 'tytturk',
      'konu': 'Noktalama İşaretleri',
      'durum': 'false',
      'alanKey': 'Alan.Tyt'
    },
    {
      'dersKey': 'tytturk',
      'konu': 'Sözcükte Yapı',
      'durum': 'false',
      'alanKey': 'Alan.Tyt'
    },
    {
      'dersKey': 'tytturk',
      'konu': 'İsimler',
      'durum': 'false',
      'alanKey': 'Alan.Tyt'
    },
    {
      'dersKey': 'tytturk',
      'konu': 'Sıfatlar',
      'durum': 'false',
      'alanKey': 'Alan.Tyt'
    },
    {
      'dersKey': 'tytturk',
      'konu': 'Zamirler',
      'durum': 'false',
      'alanKey': 'Alan.Tyt'
    },
    {
      'dersKey': 'tytturk',
      'konu': 'Zarflar',
      'durum': 'false',
      'alanKey': 'Alan.Tyt'
    },
    {
      'dersKey': 'tytturk',
      'konu': 'Edat Bağlaç Ünlem',
      'durum': 'false',
      'alanKey': 'Alan.Tyt'
    },
    {
      'dersKey': 'tytturk',
      'konu': 'Fiiller',
      'durum': 'false',
      'alanKey': 'Alan.Tyt'
    },
    {
      'dersKey': 'tytturk',
      'konu': 'Fiilde Çatı',
      'durum': 'false',
      'alanKey': 'Alan.Tyt'
    },
    {
      'dersKey': 'tytturk',
      'konu': 'Fiilimsiler',
      'durum': 'false',
      'alanKey': 'Alan.Tyt'
    },
    {
      'dersKey': 'tytturk',
      'konu': 'Cümlenin Ögeleri',
      'durum': 'false',
      'alanKey': 'Alan.Tyt'
    },
    {
      'dersKey': 'tytturk',
      'konu': 'Cümle Türleri',
      'durum': 'false',
      'alanKey': 'Alan.Tyt'
    },
    {
      'dersKey': 'tytturk',
      'konu': 'Anlatım Bozukluğu',
      'durum': 'false',
      'alanKey': 'Alan.Tyt'
    },
    {
      'dersKey': 'tytmat',
      'konu': 'Temel Kavramlar',
      'durum': 'false',
      'alanKey': 'Alan.Tyt'
    },
    {
      'dersKey': 'tytmat',
      'konu': 'Sayı Basamakları',
      'durum': 'false',
      'alanKey': 'Alan.Tyt'
    },
    {
      'dersKey': 'tytmat',
      'konu': 'Bölme ve Bölünebilme',
      'durum': 'false',
      'alanKey': 'Alan.Tyt'
    },
    {
      'dersKey': 'tytmat',
      'konu': 'OBEB-OKEK',
      'durum': 'false',
      'alanKey': 'Alan.Tyt'
    },
    {
      'dersKey': 'tytmat',
      'konu': 'Rasyonel Sayılar',
      'durum': 'false',
      'alanKey': 'Alan.Tyt'
    },
    {
      'dersKey': 'tytmat',
      'konu': 'Ondalık Sayılar',
      'durum': 'false',
      'alanKey': 'Alan.Tyt'
    },
    {
      'dersKey': 'tytmat',
      'konu': 'Basit Eşitsizlikler',
      'durum': 'false',
      'alanKey': 'Alan.Tyt'
    },
    {
      'dersKey': 'tytmat',
      'konu': 'Mutlak Değer',
      'durum': 'false',
      'alanKey': 'Alan.Tyt'
    },
    {
      'dersKey': 'tytmat',
      'konu': 'Üslü Sayılar',
      'durum': 'false',
      'alanKey': 'Alan.Tyt'
    },
    {
      'dersKey': 'tytmat',
      'konu': 'Köklü Sayılar',
      'durum': 'false',
      'alanKey': 'Alan.Tyt'
    },
    {
      'dersKey': 'tytmat',
      'konu': 'Çarpanlara Ayırma',
      'durum': 'false',
      'alanKey': 'Alan.Tyt'
    },
    {
      'dersKey': 'tytmat',
      'konu': 'Oran Orantı',
      'durum': 'false',
      'alanKey': 'Alan.Tyt'
    },
    {
      'dersKey': 'tytmat',
      'konu': 'Denklem Çözme',
      'durum': 'false',
      'alanKey': 'Alan.Tyt'
    },
    {
      'dersKey': 'tytmat',
      'konu': 'Problemler',
      'durum': 'false',
      'alanKey': 'Alan.Tyt'
    },
    {
      'dersKey': 'tytmat',
      'konu': 'Kümeler',
      'durum': 'false',
      'alanKey': 'Alan.Tyt'
    },
    {
      'dersKey': 'tytmat',
      'konu': 'Fonksiyonlar',
      'durum': 'false',
      'alanKey': 'Alan.Tyt'
    },
    {
      'dersKey': 'tytmat',
      'konu': 'Permütasyon',
      'durum': 'false',
      'alanKey': 'Alan.Tyt'
    },
    {
      'dersKey': 'tytmat',
      'konu': 'Kombinasyon',
      'durum': 'false',
      'alanKey': 'Alan.Tyt'
    },
    {
      'dersKey': 'tytmat',
      'konu': 'Binom',
      'durum': 'false',
      'alanKey': 'Alan.Tyt'
    },
    {
      'dersKey': 'tytmat',
      'konu': 'Olasılık',
      'durum': 'false',
      'alanKey': 'Alan.Tyt'
    },
    {
      'dersKey': 'tytmat',
      'konu': 'İstatistik',
      'durum': 'false',
      'alanKey': 'Alan.Tyt'
    },
    {
      'dersKey': 'tytmat',
      'konu': 'Polinomlar',
      'durum': 'false',
      'alanKey': 'Alan.Tyt'
    },
    {
      'dersKey': 'tytmat',
      'konu': '2. Dereceden Denklemler',
      'durum': 'false',
      'alanKey': 'Alan.Tyt'
    },
    {
      'dersKey': 'tytmat',
      'konu': 'Karmaşık Sayılar',
      'durum': 'false',
      'alanKey': 'Alan.Tyt'
    },
    {
      'dersKey': 'tytmat',
      'konu': 'Parabol',
      'durum': 'false',
      'alanKey': 'Alan.Tyt'
    },
    {
      'dersKey': 'tytgeo',
      'konu': 'Doğruda ve Üçgende Açılar',
      'durum': 'false',
      'alanKey': 'Alan.Tyt'
    },
    {
      'dersKey': 'tytgeo',
      'konu': 'Dik ve Özel Üçgenler',
      'durum': 'false',
      'alanKey': 'Alan.Tyt'
    },
    {
      'dersKey': 'tytgeo',
      'konu': 'Dik Üçgende Trigonometrik Bağıntılar',
      'durum': 'false',
      'alanKey': 'Alan.Tyt'
    },
    {
      'dersKey': 'tytgeo',
      'konu': 'İkizkenar ve Eşkenar Üçgen',
      'durum': 'false',
      'alanKey': 'Alan.Tyt'
    },
    {
      'dersKey': 'tytgeo',
      'konu': 'Üçgende Alanlar',
      'durum': 'false',
      'alanKey': 'Alan.Tyt'
    },
    {
      'dersKey': 'tytgeo',
      'konu': 'Üçgende Açırortay Bağıntıları',
      'durum': 'false',
      'alanKey': 'Alan.Tyt'
    },
    {
      'dersKey': 'tytgeo',
      'konu': 'Üçgende Kenarortay Bağıntıları',
      'durum': 'false',
      'alanKey': 'Alan.Tyt'
    },
    {
      'dersKey': 'tytgeo',
      'konu': 'Üçgende Eşlik Benzerlik',
      'durum': 'false',
      'alanKey': 'Alan.Tyt'
    },
    {
      'dersKey': 'tytgeo',
      'konu': 'Üçgende Açı Kenar Bağıntıları',
      'durum': 'false',
      'alanKey': 'Alan.Tyt'
    },
    {
      'dersKey': 'tytgeo',
      'konu': 'Çokgenler',
      'durum': 'false',
      'alanKey': 'Alan.Tyt'
    },
    {
      'dersKey': 'tytgeo',
      'konu': 'Dörtgenler',
      'durum': 'false',
      'alanKey': 'Alan.Tyt'
    },
    {
      'dersKey': 'tytgeo',
      'konu': 'Yamuk',
      'durum': 'false',
      'alanKey': 'Alan.Tyt'
    },
    {
      'dersKey': 'tytgeo',
      'konu': 'Paralelkenar',
      'durum': 'false',
      'alanKey': 'Alan.Tyt'
    },
    {
      'dersKey': 'tytgeo',
      'konu': 'Eşkenar Dörgen - Deltoid',
      'durum': 'false',
      'alanKey': 'Alan.Tyt'
    },
    {
      'dersKey': 'tytgeo',
      'konu': 'Dikdörtgen',
      'durum': 'false',
      'alanKey': 'Alan.Tyt'
    },
    {
      'dersKey': 'tytgeo',
      'konu': 'Çemberde Açılar',
      'durum': 'false',
      'alanKey': 'Alan.Tyt'
    },
    {
      'dersKey': 'tytgeo',
      'konu': 'Çemberde Uzunluk',
      'durum': 'false',
      'alanKey': 'Alan.Tyt'
    },
    {
      'dersKey': 'tytgeo',
      'konu': 'Daire',
      'durum': 'false',
      'alanKey': 'Alan.Tyt'
    },
    {
      'dersKey': 'tytgeo',
      'konu': 'Prizmalar',
      'durum': 'false',
      'alanKey': 'Alan.Tyt'
    },
    {
      'dersKey': 'tytgeo',
      'konu': 'Küre',
      'durum': 'false',
      'alanKey': 'Alan.Tyt'
    },
    {
      'dersKey': 'tytgeo',
      'konu': 'Noktanın Analitiği',
      'durum': 'false',
      'alanKey': 'Alan.Tyt'
    },
    {
      'dersKey': 'tytgeo',
      'konu': 'Doğrunun Analitiği',
      'durum': 'false',
      'alanKey': 'Alan.Tyt'
    },
    {
      'dersKey': 'tytgeo',
      'konu': 'Tekrar Eden Dönen Yansıyan Şekiller',
      'durum': 'false',
      'alanKey': 'Alan.Tyt'
    },
    {
      'dersKey': 'tyttar',
      'konu': 'Tarih Bilimine Giriş',
      'durum': 'false',
      'alanKey': 'Alan.Tyt'
    },
    {
      'dersKey': 'tyttar',
      'konu': 'Uyg. Doğuşu ve İlk Uygarlıklar',
      'durum': 'false',
      'alanKey': 'Alan.Tyt'
    },
    {
      'dersKey': 'tyttar',
      'konu': 'Eski Türk Tarihi',
      'durum': 'false',
      'alanKey': 'Alan.Tyt'
    },
    {
      'dersKey': 'tyttar',
      'konu': 'İslam Tarihi ve Uygarlığı',
      'durum': 'false',
      'alanKey': 'Alan.Tyt'
    },
    {
      'dersKey': 'tyttar',
      'konu': 'Türk-İslam Devletleri (X-XIII. Yy}',
      'durum': 'false',
      'alanKey': 'Alan.Tyt'
    },
    {
      'dersKey': 'tyttar',
      'konu': 'Türkiye Tarihi (XI-XIII. Yy}',
      'durum': 'false',
      'alanKey': 'Alan.Tyt'
    },
    {
      'dersKey': 'tyttar',
      'konu': 'Beylikten Devlete(1300-1453)',
      'durum': 'false',
      'alanKey': 'Alan.Tyt'
    },
    {
      'dersKey': 'tyttar',
      'konu': 'Dünya GÜcü Osmanlı Devleti(1453-1600)',
      'durum': 'false',
      'alanKey': 'Alan.Tyt'
    },
    {
      'dersKey': 'tyttar',
      'konu': 'Yeniçağ Avrupası(1453-1789)',
      'durum': 'false',
      'alanKey': 'Alan.Tyt'
    },
    {
      'dersKey': 'tyttar',
      'konu': 'Osm. Devl. Kültür ve Uygarlık',
      'durum': 'false',
      'alanKey': 'Alan.Tyt'
    },
    {
      'dersKey': 'tyttar',
      'konu': 'Arayış Yılları(17.yüzyıl)',
      'durum': 'false',
      'alanKey': 'Alan.Tyt'
    },
    {
      'dersKey': 'tyttar',
      'konu': '18. Yüzyılda Değişim ve Diplomasi',
      'durum': 'false',
      'alanKey': 'Alan.Tyt'
    },
    {
      'dersKey': 'tyttar',
      'konu': 'Yakın Çağ Avrupası',
      'durum': 'false',
      'alanKey': 'Alan.Tyt'
    },
    {
      'dersKey': 'tyttar',
      'konu': 'En Uzun Yüzyıl(1800-1922)',
      'durum': 'false',
      'alanKey': 'Alan.Tyt'
    },
    {
      'dersKey': 'tyttar',
      'konu': '20. yüzyıl Başlarında Osmanlı Devleti',
      'durum': 'false',
      'alanKey': 'Alan.Tyt'
    },
    {
      'dersKey': 'tyttar',
      'konu': '1. Dünya Savaşı',
      'durum': 'false',
      'alanKey': 'Alan.Tyt'
    },
    {
      'dersKey': 'tyttar',
      'konu': 'Milli Mücadele\'nin Hazırlık Dönemi',
      'durum': 'false',
      'alanKey': 'Alan.Tyt'
    },
    {
      'dersKey': 'tyttar',
      'konu': 'Kurtuluş Savaşı\'nda Cepheler',
      'durum': 'false',
      'alanKey': 'Alan.Tyt'
    },
    {
      'dersKey': 'tyttar',
      'konu': 'Türk İnkılabı',
      'durum': 'false',
      'alanKey': 'Alan.Tyt'
    },
    {
      'dersKey': 'tyttar',
      'konu': 'Atatürkçülük ve Atatürk İlkeleri',
      'durum': 'false',
      'alanKey': 'Alan.Tyt'
    },
    {
      'dersKey': 'tyttar',
      'konu': 'Türk Dış Politikası',
      'durum': 'false',
      'alanKey': 'Alan.Tyt'
    },
    {
      'dersKey': 'tytfel',
      'konu': 'Felsefe\'nin Konusu',
      'durum': 'false',
      'alanKey': 'Alan.Tyt'
    },
    {
      'dersKey': 'tytfel',
      'konu': 'Bilgi Felsefesi',
      'durum': 'false',
      'alanKey': 'Alan.Tyt'
    },
    {
      'dersKey': 'tytfel',
      'konu': 'Varlık Felsefesi',
      'durum': 'false',
      'alanKey': 'Alan.Tyt'
    },
    {
      'dersKey': 'tytfel',
      'konu': 'Ahlak Felsefesi',
      'durum': 'false',
      'alanKey': 'Alan.Tyt'
    },
    {
      'dersKey': 'tytfel',
      'konu': 'Sanat Felsefesi',
      'durum': 'false',
      'alanKey': 'Alan.Tyt'
    },
    {
      'dersKey': 'tytfel',
      'konu': 'Din Felsefesi',
      'durum': 'false',
      'alanKey': 'Alan.Tyt'
    },
    {
      'dersKey': 'tytfel',
      'konu': 'Siyaset Felsefesi',
      'durum': 'false',
      'alanKey': 'Alan.Tyt'
    },
    {
      'dersKey': 'tytfel',
      'konu': 'Bilim Felsefesi',
      'durum': 'false',
      'alanKey': 'Alan.Tyt'
    },
    {
      'dersKey': 'tytcog',
      'konu': 'Harita Bilgisi',
      'durum': 'false',
      'alanKey': 'Alan.Tyt'
    },
    {
      'dersKey': 'tytcog',
      'konu': 'Doğanın Şekli ve Hareketleri',
      'durum': 'false',
      'alanKey': 'Alan.Tyt'
    },
    {
      'dersKey': 'tytcog',
      'konu': 'İklim Bilgisi',
      'durum': 'false',
      'alanKey': 'Alan.Tyt'
    },
    {
      'dersKey': 'tytcog',
      'konu': 'Türkiyenin İklimi ve Yer Şekilleri',
      'durum': 'false',
      'alanKey': 'Alan.Tyt'
    },
    {
      'dersKey': 'tytcog',
      'konu': 'Yerin Şekillenmesi',
      'durum': 'false',
      'alanKey': 'Alan.Tyt'
    },
    {
      'dersKey': 'tytcog',
      'konu': 'İç ve Dış Kuvvetler',
      'durum': 'false',
      'alanKey': 'Alan.Tyt'
    },
    {
      'dersKey': 'tytcog',
      'konu': 'Toprak Tipleri',
      'durum': 'false',
      'alanKey': 'Alan.Tyt'
    },
    {
      'dersKey': 'tytcog',
      'konu': 'Nüfus',
      'durum': 'false',
      'alanKey': 'Alan.Tyt'
    },
    {
      'dersKey': 'tytcog',
      'konu': 'Ortak Payda:Bölge',
      'durum': 'false',
      'alanKey': 'Alan.Tyt'
    },
    {
      'dersKey': 'tytcog',
      'konu': 'Ulaşım Yolları',
      'durum': 'false',
      'alanKey': 'Alan.Tyt'
    },
    {
      'dersKey': 'tytcog',
      'konu': 'Çevre ve İnsan',
      'durum': 'false',
      'alanKey': 'Alan.Tyt'
    },
    {
      'dersKey': 'tytcog',
      'konu': 'Doğal Afetler',
      'durum': 'false',
      'alanKey': 'Alan.Tyt'
    },
    {
      'dersKey': 'tytfiz',
      'konu': 'Fizik Bilimine Giriş',
      'durum': 'false',
      'alanKey': 'Alan.Tyt'
    },
    {
      'dersKey': 'tytfiz',
      'konu': 'Vektör-Kuvvet ve Kuvvet Dengesi',
      'durum': 'false',
      'alanKey': 'Alan.Tyt'
    },
    {
      'dersKey': 'tytfiz',
      'konu': 'Basit Makineler',
      'durum': 'false',
      'alanKey': 'Alan.Tyt'
    },
    {
      'dersKey': 'tytfiz',
      'konu': 'Madde ve Özellikleri',
      'durum': 'false',
      'alanKey': 'Alan.Tyt'
    },
    {
      'dersKey': 'tytfiz',
      'konu': 'Sıvıların Kaldırma Kuvveti',
      'durum': 'false',
      'alanKey': 'Alan.Tyt'
    },
    {
      'dersKey': 'tytfiz',
      'konu': 'Basınç',
      'durum': 'false',
      'alanKey': 'Alan.Tyt'
    },
    {
      'dersKey': 'tytfiz',
      'konu': 'Isı ve Sıcaklık',
      'durum': 'false',
      'alanKey': 'Alan.Tyt'
    },
    {
      'dersKey': 'tytfiz',
      'konu': 'Genleşme',
      'durum': 'false',
      'alanKey': 'Alan.Tyt'
    },
    {
      'dersKey': 'tytfiz',
      'konu': 'Doğrusal Hareket',
      'durum': 'false',
      'alanKey': 'Alan.Tyt'
    },
    {
      'dersKey': 'tytfiz',
      'konu': 'İş Enerji',
      'durum': 'false',
      'alanKey': 'Alan.Tyt'
    },
    {
      'dersKey': 'tytfiz',
      'konu': 'Işık ve Gölge',
      'durum': 'false',
      'alanKey': 'Alan.Tyt'
    },
    {
      'dersKey': 'tytfiz',
      'konu': 'Düzlem Ayna',
      'durum': 'false',
      'alanKey': 'Alan.Tyt'
    },
    {
      'dersKey': 'tytfiz',
      'konu': 'Küresel Aynalar',
      'durum': 'false',
      'alanKey': 'Alan.Tyt'
    },
    {
      'dersKey': 'tytfiz',
      'konu': 'Kırılma ve Renkler',
      'durum': 'false',
      'alanKey': 'Alan.Tyt'
    },
    {
      'dersKey': 'tytfiz',
      'konu': 'Mercekler ve Aydınlanma',
      'durum': 'false',
      'alanKey': 'Alan.Tyt'
    },
    {
      'dersKey': 'tytfiz',
      'konu': 'Elektrostatik',
      'durum': 'false',
      'alanKey': 'Alan.Tyt'
    },
    {
      'dersKey': 'tytfiz',
      'konu': 'Elektrik Akımı ve Devreler',
      'durum': 'false',
      'alanKey': 'Alan.Tyt'
    },
    {
      'dersKey': 'tytfiz',
      'konu': 'Temel Dalga Bilgileri',
      'durum': 'false',
      'alanKey': 'Alan.Tyt'
    },
    {
      'dersKey': 'tytfiz',
      'konu': 'Yay Dalgaları',
      'durum': 'false',
      'alanKey': 'Alan.Tyt'
    },
    {
      'dersKey': 'tytfiz',
      'konu': 'Su Dalgaları',
      'durum': 'false',
      'alanKey': 'Alan.Tyt'
    },
    {
      'dersKey': 'tytfiz',
      'konu': 'Ses ve Deprem Dalgaları',
      'durum': 'false',
      'alanKey': 'Alan.Tyt'
    },
    {
      'dersKey': 'tytkim',
      'konu': 'Kimya Bilimi',
      'durum': 'false',
      'alanKey': 'Alan.Tyt'
    },
    {
      'dersKey': 'tytkim',
      'konu': 'Atomun Yapısı',
      'durum': 'false',
      'alanKey': 'Alan.Tyt'
    },
    {
      'dersKey': 'tytkim',
      'konu': 'Periyodik Sistem',
      'durum': 'false',
      'alanKey': 'Alan.Tyt'
    },
    {
      'dersKey': 'tytkim',
      'konu': 'Kimyasal Türler Arası Etkileşim',
      'durum': 'false',
      'alanKey': 'Alan.Tyt'
    },
    {
      'dersKey': 'tytkim',
      'konu': 'Asitler Bazlar ve Tuzlar',
      'durum': 'false',
      'alanKey': 'Alan.Tyt'
    },
    {
      'dersKey': 'tytkim',
      'konu': 'Bileşikler',
      'durum': 'false',
      'alanKey': 'Alan.Tyt'
    },
    {
      'dersKey': 'tytkim',
      'konu': 'Kimyasal Tepkimeler',
      'durum': 'false',
      'alanKey': 'Alan.Tyt'
    },
    {
      'dersKey': 'tytkim',
      'konu': 'Kimyanın Temel Yasaları',
      'durum': 'false',
      'alanKey': 'Alan.Tyt'
    },
    {
      'dersKey': 'tytkim',
      'konu': 'Maddenin Halleri',
      'durum': 'false',
      'alanKey': 'Alan.Tyt'
    },
    {
      'dersKey': 'tytkim',
      'konu': 'Karışımlar',
      'durum': 'false',
      'alanKey': 'Alan.Tyt'
    },
    {
      'dersKey': 'tytkim',
      'konu': 'Endüstride ve Canlılarda Enerji',
      'durum': 'false',
      'alanKey': 'Alan.Tyt'
    },
    {
      'dersKey': 'tytkim',
      'konu': 'Kimya Heryerde',
      'durum': 'false',
      'alanKey': 'Alan.Tyt'
    },
    {
      'dersKey': 'tytbio',
      'konu': 'Biyoloji Bilimi,İnorganik Bileşikler',
      'durum': 'false',
      'alanKey': 'Alan.Tyt'
    },
    {
      'dersKey': 'tytbio',
      'konu': 'Organik Bileşikler',
      'durum': 'false',
      'alanKey': 'Alan.Tyt'
    },
    {
      'dersKey': 'tytbio',
      'konu': 'Hücre',
      'durum': 'false',
      'alanKey': 'Alan.Tyt'
    },
    {
      'dersKey': 'tytbio',
      'konu': 'Madde Geçişleri',
      'durum': 'false',
      'alanKey': 'Alan.Tyt'
    },
    {
      'dersKey': 'tytbio',
      'konu': 'DNA-RNA',
      'durum': 'false',
      'alanKey': 'Alan.Tyt'
    },
    {
      'dersKey': 'tytbio',
      'konu': 'Protein Sentezi',
      'durum': 'false',
      'alanKey': 'Alan.Tyt'
    },
    {
      'dersKey': 'tytbio',
      'konu': 'Enzimler',
      'durum': 'false',
      'alanKey': 'Alan.Tyt'
    },
    {
      'dersKey': 'tytbio',
      'konu': 'Canlıların Sınıflandırılması',
      'durum': 'false',
      'alanKey': 'Alan.Tyt'
    },
    {
      'dersKey': 'tytbio',
      'konu': 'Ekoloji',
      'durum': 'false',
      'alanKey': 'Alan.Tyt'
    },
    {
      'dersKey': 'tytbio',
      'konu': 'Hücre Bölünmeleri',
      'durum': 'false',
      'alanKey': 'Alan.Tyt'
    },
    {
      'dersKey': 'tytbio',
      'konu': 'Eşeyli Eşeysiz Üreme',
      'durum': 'false',
      'alanKey': 'Alan.Tyt'
    },
    {
      'dersKey': 'tytbio',
      'konu': 'İnsanda Üreme ve Gelişme',
      'durum': 'false',
      'alanKey': 'Alan.Tyt'
    },
    {
      'dersKey': 'tytbio',
      'konu': 'Mendel Genetiği',
      'durum': 'false',
      'alanKey': 'Alan.Tyt'
    },
    {
      'dersKey': 'tytbio',
      'konu': 'Kan Grupları',
      'durum': 'false',
      'alanKey': 'Alan.Tyt'
    },
    {
      'dersKey': 'tytbio',
      'konu': 'Cinsiyete Bağlı Kalıtım',
      'durum': 'false',
      'alanKey': 'Alan.Tyt'
    },
    {
      'dersKey': 'aytmat',
      'konu': 'Sayılar',
      'durum': 'false',
      'alanKey': 'Alan.SayEa',
    },
    {
      'dersKey': 'aytmat',
      'konu': 'Sayı Basamakları',
      'durum': 'false',
      'alanKey': 'Alan.SayEa',
    },
    {
      'dersKey': 'aytmat',
      'konu': 'Bölünebilme',
      'durum': 'false',
      'alanKey': 'Alan.SayEa',
    },
    {
      'dersKey': 'aytmat',
      'konu': 'OBEB-OKEK',
      'durum': 'false',
      'alanKey': 'Alan.SayEa',
    },
    {
      'dersKey': 'aytmat',
      'konu': 'Rasyonel Sayılar',
      'durum': 'false',
      'alanKey': 'Alan.SayEa',
    },
    {
      'dersKey': 'aytmat',
      'konu': 'Basit Eşitsizlikler',
      'durum': 'false',
      'alanKey': 'Alan.SayEa',
    },
    {
      'dersKey': 'aytmat',
      'konu': 'Mutlak Değer',
      'durum': 'false',
      'alanKey': 'Alan.SayEa',
    },
    {
      'dersKey': 'aytmat',
      'konu': 'Üslü Sayılar',
      'durum': 'false',
      'alanKey': 'Alan.SayEa',
    },
    {
      'dersKey': 'aytmat',
      'konu': 'Köklü Sayılar',
      'durum': 'false',
      'alanKey': 'Alan.SayEa',
    },
    {
      'dersKey': 'aytmat',
      'konu': 'Çarpanlara Ayırma',
      'durum': 'false',
      'alanKey': 'Alan.SayEa',
    },
    {
      'dersKey': 'aytmat',
      'konu': 'Oran Orantı',
      'durum': 'false',
      'alanKey': 'Alan.SayEa',
    },
    {
      'dersKey': 'aytmat',
      'konu': 'Denklem Çözme',
      'durum': 'false',
      'alanKey': 'Alan.SayEa',
    },
    {
      'dersKey': 'aytmat',
      'konu': 'Kümeler',
      'durum': 'false',
      'alanKey': 'Alan.SayEa',
    },
    {
      'dersKey': 'aytmat',
      'konu': 'Fonksiyonlar',
      'durum': 'false',
      'alanKey': 'Alan.SayEa',
    },
    {
      'dersKey': 'aytmat',
      'konu': 'Permütasyon',
      'durum': 'false',
      'alanKey': 'Alan.SayEa',
    },
    {
      'dersKey': 'aytmat',
      'konu': 'Kombinasyon',
      'durum': 'false',
      'alanKey': 'Alan.SayEa',
    },
    {
      'dersKey': 'aytmat',
      'konu': 'Binom',
      'durum': 'false',
      'alanKey': 'Alan.SayEa',
    },
    {
      'dersKey': 'aytmat',
      'konu': 'Olasılık',
      'durum': 'false',
      'alanKey': 'Alan.SayEa',
    },
    {
      'dersKey': 'aytmat',
      'konu': 'İstatistik',
      'durum': 'false',
      'alanKey': 'Alan.SayEa',
    },
    {
      'dersKey': 'aytmat',
      'konu': '2. Dereceden Denklemler',
      'durum': 'false',
      'alanKey': 'Alan.SayEa',
    },
    {
      'dersKey': 'aytmat',
      'konu': 'Karmaşık Sayılar',
      'durum': 'false',
      'alanKey': 'Alan.SayEa',
    },
    {
      'dersKey': 'aytmat',
      'konu': 'Parabol',
      'durum': 'false',
      'alanKey': 'Alan.SayEa',
    },
    {
      'dersKey': 'aytmat',
      'konu': 'Polinomlar',
      'durum': 'false',
      'alanKey': 'Alan.SayEa',
    },
    {
      'dersKey': 'aytmat',
      'konu': 'Mantık',
      'durum': 'false',
      'alanKey': 'Alan.SayEa',
    },
    {
      'dersKey': 'aytmat',
      'konu': 'Modüler Aritmetik',
      'durum': 'false',
      'alanKey': 'Alan.SayEa',
    },
    {
      'dersKey': 'aytmat',
      'konu': 'Eşitsizlikler',
      'durum': 'false',
      'alanKey': 'Alan.SayEa',
    },
    {
      'dersKey': 'aytmat',
      'konu': 'Logaritma',
      'durum': 'false',
      'alanKey': 'Alan.SayEa',
    },
    {
      'dersKey': 'aytmat',
      'konu': 'Diziler',
      'durum': 'false',
      'alanKey': 'Alan.SayEa',
    },
    {
      'dersKey': 'aytmat',
      'konu': 'Seriler',
      'durum': 'false',
      'alanKey': 'Alan.SayEa',
    },
    {
      'dersKey': 'aytmat',
      'konu': 'Limit ve Süreklilik',
      'durum': 'false',
      'alanKey': 'Alan.SayEa',
    },
    {
      'dersKey': 'aytmat',
      'konu': 'Türev',
      'durum': 'false',
      'alanKey': 'Alan.SayEa',
    },
    {
      'dersKey': 'aytmat',
      'konu': 'İntegral',
      'durum': 'false',
      'alanKey': 'Alan.SayEa',
    },
    {
      'dersKey': 'aytgeo',
      'konu': 'Doğruda ve Üçgende Açılar',
      'durum': 'false',
      'alanKey': 'Alan.SayEa',
    },
    {
      'dersKey': 'aytgeo',
      'konu': 'Dik ve Özel Üçgenler',
      'durum': 'false',
      'alanKey': 'Alan.SayEa',
    },
    {
      'dersKey': 'aytgeo',
      'konu': 'Dik Üçgende Trigonometrik Bağıntılar',
      'durum': 'false',
      'alanKey': 'Alan.SayEa',
    },
    {
      'dersKey': 'aytgeo',
      'konu': 'İkizkenar ve Eşkenar Üçgen',
      'durum': 'false',
      'alanKey': 'Alan.SayEa',
    },
    {
      'dersKey': 'aytgeo',
      'konu': 'Üçgende Alanlar',
      'durum': 'false',
      'alanKey': 'Alan.SayEa',
    },
    {
      'dersKey': 'aytgeo',
      'konu': 'Üçgende Açıortay Bağıntıları',
      'durum': 'false',
      'alanKey': 'Alan.SayEa',
    },
    {
      'dersKey': 'aytgeo',
      'konu': 'Üçgende Kenarortay Bağıntıları',
      'durum': 'false',
      'alanKey': 'Alan.SayEa',
    },
    {
      'dersKey': 'aytgeo',
      'konu': 'Üçgende Eşlik ve Benzerlik',
      'durum': 'false',
      'alanKey': 'Alan.SayEa',
    },
    {
      'dersKey': 'aytgeo',
      'konu': 'Üçgende Açı Kenar Bağıntıları',
      'durum': 'false',
      'alanKey': 'Alan.SayEa',
    },
    {
      'dersKey': 'aytgeo',
      'konu': 'Çokgenler',
      'durum': 'false',
      'alanKey': 'Alan.SayEa',
    },
    {
      'dersKey': 'aytgeo',
      'konu': 'Dörtgenler',
      'durum': 'false',
      'alanKey': 'Alan.SayEa',
    },
    {
      'dersKey': 'aytgeo',
      'konu': 'Yamuk',
      'durum': 'false',
      'alanKey': 'Alan.SayEa',
    },
    {
      'dersKey': 'aytgeo',
      'konu': 'Paralelkenar',
      'durum': 'false',
      'alanKey': 'Alan.SayEa',
    },
    {
      'dersKey': 'aytgeo',
      'konu': 'Eşkenar Dörtgen Deltoid',
      'durum': 'false',
      'alanKey': 'Alan.SayEa',
    },
    {
      'dersKey': 'aytgeo',
      'konu': 'Dikdörtgen',
      'durum': 'false',
      'alanKey': 'Alan.SayEa',
    },
    {
      'dersKey': 'aytgeo',
      'konu': 'Çemberde Açılar',
      'durum': 'false',
      'alanKey': 'Alan.SayEa',
    },
    {
      'dersKey': 'aytgeo',
      'konu': 'Çemberde Uzunluk',
      'durum': 'false',
      'alanKey': 'Alan.SayEa',
    },
    {
      'dersKey': 'aytgeo',
      'konu': 'Daire',
      'durum': 'false',
      'alanKey': 'Alan.SayEa',
    },
    {
      'dersKey': 'aytgeo',
      'konu': 'Prizmalar',
      'durum': 'false',
      'alanKey': 'Alan.SayEa',
    },
    {
      'dersKey': 'aytgeo',
      'konu': 'Küre',
      'durum': 'false',
      'alanKey': 'Alan.SayEa',
    },
    {
      'dersKey': 'aytgeo',
      'konu': 'Noktanın Analitiği',
      'durum': 'false',
      'alanKey': 'Alan.SayEa',
    },
    {
      'dersKey': 'aytgeo',
      'konu': 'Doğrunun Analitiği',
      'durum': 'false',
      'alanKey': 'Alan.SayEa',
    },
    {
      'dersKey': 'aytgeo',
      'konu': 'Tekrar Eden Dönen Yansıyan Şekiller',
      'durum': 'false',
      'alanKey': 'Alan.SayEa',
    },
    {
      'dersKey': 'aytgeo',
      'konu': 'Uzay Geometrisi',
      'durum': 'false',
      'alanKey': 'Alan.SayEa',
    },
    {
      'dersKey': 'aytgeo',
      'konu': 'Dönüşümlerde Geometri',
      'durum': 'false',
      'alanKey': 'Alan.SayEa',
    },
    {
      'dersKey': 'aytgeo',
      'konu': 'Trigonometri',
      'durum': 'false',
      'alanKey': 'Alan.SayEa',
    },
    {
      'dersKey': 'aytgeo',
      'konu': 'Çemberin Analitiği',
      'durum': 'false',
      'alanKey': 'Alan.SayEa',
    },
    {
      'dersKey': 'aytgeo',
      'konu': 'Konikler',
      'durum': 'false',
      'alanKey': 'Alan.SayEa',
    },
    {
      'dersKey': 'aytkim',
      'konu': 'Modern Atom Teorisi',
      'durum': 'false',
      'alanKey': 'Alan.Say',
    },
    {
      'dersKey': 'aytkim',
      'konu': 'Kimyasal Hesaplamalar',
      'durum': 'false',
      'alanKey': 'Alan.Say',
    },
    {
      'dersKey': 'aytkim',
      'konu': 'Gazlar',
      'durum': 'false',
      'alanKey': 'Alan.Say',
    },
    {
      'dersKey': 'aytkim',
      'konu': 'Sıvı Çözeltiler',
      'durum': 'false',
      'alanKey': 'Alan.Say',
    },
    {
      'dersKey': 'aytkim',
      'konu': 'Kimya ve Enerji',
      'durum': 'false',
      'alanKey': 'Alan.Say',
    },
    {
      'dersKey': 'aytkim',
      'konu': 'Tepkimelerde Hız',
      'durum': 'false',
      'alanKey': 'Alan.Say',
    },
    {
      'dersKey': 'aytkim',
      'konu': 'Kimyasal Denge',
      'durum': 'false',
      'alanKey': 'Alan.Say',
    },
    {
      'dersKey': 'aytkim',
      'konu': 'Sıvı Çözeltilerde Denge',
      'durum': 'false',
      'alanKey': 'Alan.Say',
    },
    {
      'dersKey': 'aytkim',
      'konu': 'Kimya ve Elektrik',
      'durum': 'false',
      'alanKey': 'Alan.Say',
    },
    {
      'dersKey': 'aytkim',
      'konu': 'Karbon Kimyasına Giriş',
      'durum': 'false',
      'alanKey': 'Alan.Say',
    },
    {
      'dersKey': 'aytkim',
      'konu': 'Organik Kimya',
      'durum': 'false',
      'alanKey': 'Alan.Say',
    },
    {
      'dersKey': 'aytkim',
      'konu': 'Hayatımızdaki Kimya',
      'durum': 'false',
      'alanKey': 'Alan.Say',
    },
    {
      'dersKey': 'aytbio',
      'konu': 'Biyoloji Bilimi, İnorganik Bileşikler',
      'durum': 'false',
      'alanKey': 'Alan.Say',
    },
    {
      'dersKey': 'aytbio',
      'konu': 'Organik Bileşikler',
      'durum': 'false',
      'alanKey': 'Alan.Say',
    },
    {
      'dersKey': 'aytbio',
      'konu': 'Hücre',
      'durum': 'false',
      'alanKey': 'Alan.Say',
    },
    {
      'dersKey': 'aytbio',
      'konu': 'Madde Geçişleri',
      'durum': 'false',
      'alanKey': 'Alan.Say',
    },
    {
      'dersKey': 'aytbio',
      'konu': 'Dna-Rna',
      'durum': 'false',
      'alanKey': 'Alan.Say',
    },
    {
      'dersKey': 'aytbio',
      'konu': 'Protein Sentezi',
      'durum': 'false',
      'alanKey': 'Alan.Say',
    },
    {
      'dersKey': 'aytbio',
      'konu': 'Enzimler',
      'durum': 'false',
      'alanKey': 'Alan.Say',
    },
    {
      'dersKey': 'aytbio',
      'konu': 'Canlıların Sınıflandırılması',
      'durum': 'false',
      'alanKey': 'Alan.Say',
    },
    {
      'dersKey': 'aytbio',
      'konu': 'Ekoloji',
      'durum': 'false',
      'alanKey': 'Alan.Say',
    },
    {
      'dersKey': 'aytbio',
      'konu': 'Hücre Bölünmeleri',
      'durum': 'false',
      'alanKey': 'Alan.Say',
    },
    {
      'dersKey': 'aytbio',
      'konu': 'Eşeysiz-Eşeyli Üreme',
      'durum': 'false',
      'alanKey': 'Alan.Say',
    },
    {
      'dersKey': 'aytbio',
      'konu': 'İnsanda üreme ve Gelişme',
      'durum': 'false',
      'alanKey': 'Alan.Say',
    },
    {
      'dersKey': 'aytbio',
      'konu': 'Mendel Genetiği',
      'durum': 'false',
      'alanKey': 'Alan.Say',
    },
    {
      'dersKey': 'aytbio',
      'konu': 'Kan Grupları',
      'durum': 'false',
      'alanKey': 'Alan.Say',
    },
    {
      'dersKey': 'aytbio',
      'konu': 'Cinsiyete Bağlı Kalıtım',
      'durum': 'false',
      'alanKey': 'Alan.Say',
    },
    {
      'dersKey': 'aytbio',
      'konu': 'Biyoteknoloji',
      'durum': 'false',
      'alanKey': 'Alan.Say',
    },
    {
      'dersKey': 'aytbio',
      'konu': 'Solunum',
      'durum': 'false',
      'alanKey': 'Alan.Say',
    },
    {
      'dersKey': 'aytbio',
      'konu': 'Fotosentez',
      'durum': 'false',
      'alanKey': 'Alan.Say',
    },
    {
      'dersKey': 'aytbio',
      'konu': 'Kemosentez',
      'durum': 'false',
      'alanKey': 'Alan.Say',
    },
    {
      'dersKey': 'aytbio',
      'konu': 'Sistemler',
      'durum': 'false',
      'alanKey': 'Alan.Say',
    },
    {
      'dersKey': 'aytbio',
      'konu': 'Duyu Organları',
      'durum': 'false',
      'alanKey': 'Alan.Say',
    },
    {
      'dersKey': 'aytbio',
      'konu': 'Bitki Biyolojisi',
      'durum': 'false',
      'alanKey': 'Alan.Say',
    },
    {
      'dersKey': 'aytfiz',
      'konu': 'Vektörler',
      'durum': 'false',
      'alanKey': 'Alan.Say',
    },
    {
      'dersKey': 'aytfiz',
      'konu': 'Tork',
      'durum': 'false',
      'alanKey': 'Alan.Say',
    },
    {
      'dersKey': 'aytfiz',
      'konu': 'Ağırlık Merkezi',
      'durum': 'false',
      'alanKey': 'Alan.Say',
    },
    {
      'dersKey': 'aytfiz',
      'konu': 'Basit Makineler',
      'durum': 'false',
      'alanKey': 'Alan.Say',
    },
    {
      'dersKey': 'aytfiz',
      'konu': 'Madde ve Özellikleri',
      'durum': 'false',
      'alanKey': 'Alan.Say',
    },
    {
      'dersKey': 'aytfiz',
      'konu': 'Sıvıların Kaldırma Kuvveti',
      'durum': 'false',
      'alanKey': 'Alan.Say',
    },
    {
      'dersKey': 'aytfiz',
      'konu': 'Basınç',
      'durum': 'false',
      'alanKey': 'Alan.Say',
    },
    {
      'dersKey': 'aytfiz',
      'konu': 'Isı ve Sıcaklık',
      'durum': 'false',
      'alanKey': 'Alan.Say',
    },
    {
      'dersKey': 'aytfiz',
      'konu': 'Genleşme',
      'durum': 'false',
      'alanKey': 'Alan.Say',
    },
    {
      'dersKey': 'aytfiz',
      'konu': 'Doğrusal Hareket',
      'durum': 'false',
      'alanKey': 'Alan.Say',
    },
    {
      'dersKey': 'aytfiz',
      'konu': 'Bağıl Hareket',
      'durum': 'false',
      'alanKey': 'Alan.Say',
    },
    {
      'dersKey': 'aytfiz',
      'konu': 'Dinamik',
      'durum': 'false',
      'alanKey': 'Alan.Say',
    },
    {
      'dersKey': 'aytfiz',
      'konu': 'Atışlar',
      'durum': 'false',
      'alanKey': 'Alan.Say',
    },
    {
      'dersKey': 'aytfiz',
      'konu': 'İş Enerji',
      'durum': 'false',
      'alanKey': 'Alan.Say',
    },
    {
      'dersKey': 'aytfiz',
      'konu': 'Dönme Hareketi',
      'durum': 'false',
      'alanKey': 'Alan.Say',
    },
    {
      'dersKey': 'aytfiz',
      'konu': 'Basit Harmonik Hareket',
      'durum': 'false',
      'alanKey': 'Alan.Say',
    },
    {
      'dersKey': 'aytfiz',
      'konu': 'Itma Momentum',
      'durum': 'false',
      'alanKey': 'Alan.Say',
    },
    {
      'dersKey': 'aytfiz',
      'konu': 'Kütle Çekimi Kepler Büyük Patlama',
      'durum': 'false',
      'alanKey': 'Alan.Say',
    },
    {
      'dersKey': 'aytfiz',
      'konu': 'Işık ve Gölge',
      'durum': 'false',
      'alanKey': 'Alan.Say',
    },
    {
      'dersKey': 'aytfiz',
      'konu': 'Düzlem Ayna',
      'durum': 'false',
      'alanKey': 'Alan.Say',
    },
    {
      'dersKey': 'aytfiz',
      'konu': 'Küresel Aynalar',
      'durum': 'false',
      'alanKey': 'Alan.Say',
    },
    {
      'dersKey': 'aytfiz',
      'konu': 'Kırılma ve Renkler',
      'durum': 'false',
      'alanKey': 'Alan.Say',
    },
    {
      'dersKey': 'aytfiz',
      'konu': 'Mercekler ve Aydınlanma',
      'durum': 'false',
      'alanKey': 'Alan.Say',
    },
    {
      'dersKey': 'aytfiz',
      'konu': 'Elektrostatik',
      'durum': 'false',
      'alanKey': 'Alan.Say',
    },
    {
      'dersKey': 'aytfiz',
      'konu': 'Elektrik Alan Elektriksel Potansitel ve İş',
      'durum': 'false',
      'alanKey': 'Alan.Say',
    },
    {
      'dersKey': 'aytfiz',
      'konu': 'Yüklü Parçacıkların Hareketi',
      'durum': 'false',
      'alanKey': 'Alan.Say',
    },
    {
      'dersKey': 'aytfiz',
      'konu': 'Elektrik Akımı ve Devreler',
      'durum': 'false',
      'alanKey': 'Alan.Say',
    },
    {
      'dersKey': 'aytfiz',
      'konu': 'Temel Dalga Bilgileri',
      'durum': 'false',
      'alanKey': 'Alan.Say',
    },
    {
      'dersKey': 'aytfiz',
      'konu': 'Yay Dalgaları',
      'durum': 'false',
      'alanKey': 'Alan.Say',
    },
    {
      'dersKey': 'aytfiz',
      'konu': 'Su Dalgaları',
      'durum': 'false',
      'alanKey': 'Alan.Say',
    },
    {
      'dersKey': 'aytfiz',
      'konu': 'Ses ve Deprem Dalgaları',
      'durum': 'false',
      'alanKey': 'Alan.Say',
    },
    {
      'dersKey': 'aytfiz',
      'konu': 'Manyetizma',
      'durum': 'false',
      'alanKey': 'Alan.Say',
    },
    {
      'dersKey': 'aytfiz',
      'konu': 'Elektromanyetik İndüksüyon',
      'durum': 'false',
      'alanKey': 'Alan.Say',
    },
    {
      'dersKey': 'aytfiz',
      'konu': 'Sığaçlar',
      'durum': 'false',
      'alanKey': 'Alan.Say',
    },
    {
      'dersKey': 'aytfiz',
      'konu': 'Alternatif Akım ve Transformatör',
      'durum': 'false',
      'alanKey': 'Alan.Say',
    },
    {
      'dersKey': 'aytfiz',
      'konu': 'Dalga Mekaniği',
      'durum': 'false',
      'alanKey': 'Alan.Say',
    },
    {
      'dersKey': 'aytfiz',
      'konu': 'Elektromanyetik Dalgalar',
      'durum': 'false',
      'alanKey': 'Alan.Say',
    },
    {
      'dersKey': 'aytfiz',
      'konu': 'Fotoelektrik ve Compton Olayı',
      'durum': 'false',
      'alanKey': 'Alan.Say',
    },
    {
      'dersKey': 'aytfiz',
      'konu': 'Özel Görelilik',
      'durum': 'false',
      'alanKey': 'Alan.Say',
    },
    {
      'dersKey': 'aytfiz',
      'konu': 'Atom Modelleri',
      'durum': 'false',
      'alanKey': 'Alan.Say',
    },
    {
      'dersKey': 'aytfiz',
      'konu': 'Atom Altı Parçacıklar',
      'durum': 'false',
      'alanKey': 'Alan.Say',
    },
    {
      'dersKey': 'aytfiz',
      'konu': 'Radyoaktivite',
      'durum': 'false',
      'alanKey': 'Alan.Say',
    },
    {
      'dersKey': 'aytfiz',
      'konu': 'Modern Fizik Uygulamaları',
      'durum': 'false',
      'alanKey': 'Alan.Say',
    },
    {
      'dersKey': 'aytedeb',
      'konu': 'Güzel Sanatlar ve Edebiyat',
      'durum': 'false',
      'alanKey': 'Alan.EaSoz'
    },
    {
      'dersKey': 'aytedeb',
      'konu': 'Metinlerin Sınıflandırılması',
      'durum': 'false',
      'alanKey': 'Alan.EaSoz'
    },
    {
      'dersKey': 'aytedeb',
      'konu': 'Coşku ve Heyecan Dile Getiren Metinler',
      'durum': 'false',
      'alanKey': 'Alan.EaSoz'
    },
    {
      'dersKey': 'aytedeb',
      'konu': 'Şiir Bilgisi',
      'durum': 'false',
      'alanKey': 'Alan.EaSoz'
    },
    {
      'dersKey': 'aytedeb',
      'konu': 'Sözlü Anlatım Türleri',
      'durum': 'false',
      'alanKey': 'Alan.EaSoz'
    },
    {
      'dersKey': 'aytedeb',
      'konu': 'Edebi Sanatlar',
      'durum': 'false',
      'alanKey': 'Alan.EaSoz'
    },
    {
      'dersKey': 'aytedeb',
      'konu': 'Nazım Biçimleri ve Türleri',
      'durum': 'false',
      'alanKey': 'Alan.EaSoz'
    },
    {
      'dersKey': 'aytedeb',
      'konu': 'İslamiyet Kabulü Öncesi Türk Edebiyatı',
      'durum': 'false',
      'alanKey': 'Alan.EaSoz'
    },
    {
      'dersKey': 'aytedeb',
      'konu': 'İslami Dönem İlk Dil ve Edebiyat Ürünleri',
      'durum': 'false',
      'alanKey': 'Alan.EaSoz'
    },
    {
      'dersKey': 'aytedeb',
      'konu': 'Oğuz Türkçesinin İlk Ürünleri',
      'durum': 'false',
      'alanKey': 'Alan.EaSoz'
    },
    {
      'dersKey': 'aytedeb',
      'konu': 'Halk Edebiyati',
      'durum': 'false',
      'alanKey': 'Alan.EaSoz'
    },
    {
      'dersKey': 'aytedeb',
      'konu': 'Divan Edebiyatı',
      'durum': 'false',
      'alanKey': 'Alan.EaSoz'
    },
    {
      'dersKey': 'aytedeb',
      'konu': 'Tanzimat Edebiyatı',
      'durum': 'false',
      'alanKey': 'Alan.EaSoz'
    },
    {
      'dersKey': 'aytedeb',
      'konu': 'Servet-i Fünun Edebiyatı',
      'durum': 'false',
      'alanKey': 'Alan.EaSoz'
    },
    {
      'dersKey': 'aytedeb',
      'konu': 'Fecri-ti Edebiyatı',
      'durum': 'false',
      'alanKey': 'Alan.EaSoz'
    },
    {
      'dersKey': 'aytedeb',
      'konu': 'Milli Edebiyat',
      'durum': 'false',
      'alanKey': 'Alan.EaSoz'
    },
    {
      'dersKey': 'aytedeb',
      'konu': 'Cumhuriyet Döneminde Türk Edebiyatı',
      'durum': 'false',
      'alanKey': 'Alan.EaSoz'
    },
    {
      'dersKey': 'aytedeb',
      'konu': 'Türkiye Dışındaki Türk Edebiyatı',
      'durum': 'false',
      'alanKey': 'Alan.EaSoz'
    },
    {
      'dersKey': 'aytedeb',
      'konu': 'Edebi Akımlar',
      'durum': 'false',
      'alanKey': 'Alan.EaSoz'
    },
    {
      'dersKey': 'aytedeb',
      'konu': 'Dünya Edebiyatı',
      'durum': 'false',
      'alanKey': 'Alan.EaSoz'
    },
    {
      'dersKey': 'aytedeb',
      'konu': 'Türk Edebiyatı Eser Özetleri',
      'durum': 'false',
      'alanKey': 'Alan.EaSoz'
    },
    {
      'dersKey': 'aytedeb',
      'konu': 'Türk ve Dünya Edebiyatında İlkler',
      'durum': 'false',
      'alanKey': 'Alan.EaSoz'
    },
    {
      'dersKey': 'aytcog1',
      'konu': 'Doğal Sistemler',
      'durum': 'false',
      'alanKey': 'Alan.EaSoz'
    },
    {
      'dersKey': 'aytcog1',
      'konu': 'Beşeri Sistemler',
      'durum': 'false',
      'alanKey': 'Alan.EaSoz'
    },
    {
      'dersKey': 'aytcog1',
      'konu': 'Mekansal Sentez Türkiye',
      'durum': 'false',
      'alanKey': 'Alan.EaSoz'
    },
    {
      'dersKey': 'aytcog1',
      'konu': 'Küresel Ortam: Bölgeler ve Ülkeler',
      'durum': 'false',
      'alanKey': 'Alan.EaSoz'
    },
    {
      'dersKey': 'aytcog1',
      'konu': 'Çevre ve Toplum',
      'durum': 'false',
      'alanKey': 'Alan.EaSoz'
    },
    {
      'dersKey': 'aytcog1',
      'konu': 'Ekonomik Faaliyetler',
      'durum': 'false',
      'alanKey': 'Alan.EaSoz'
    },
    {
      'dersKey': 'ayttarih1',
      'konu': 'Tarih Bilimine Giriş',
      'durum': 'false',
      'alanKey': 'Alan.EaSoz'
    },
    {
      'dersKey': 'ayttarih1',
      'konu': 'Uyg. Doğuşu ve İlk Uygarlıklar',
      'durum': 'false',
      'alanKey': 'Alan.EaSoz'
    },
    {
      'dersKey': 'ayttarih1',
      'konu': 'Eski Türk Tarihi',
      'durum': 'false',
      'alanKey': 'Alan.EaSoz'
    },
    {
      'dersKey': 'ayttarih1',
      'konu': 'İslam Tarihi ve Uygarlığı',
      'durum': 'false',
      'alanKey': 'Alan.EaSoz'
    },
    {
      'dersKey': 'ayttarih1',
      'konu': 'Türk-İslam Devletleri',
      'durum': 'false',
      'alanKey': 'Alan.EaSoz'
    },
    {
      'dersKey': 'ayttarih1',
      'konu': 'Türkiye Tarihi',
      'durum': 'false',
      'alanKey': 'Alan.EaSoz'
    },
    {
      'dersKey': 'ayttarih1',
      'konu': 'Orta Çağ\'da Avrupa',
      'durum': 'false',
      'alanKey': 'Alan.EaSoz'
    },
    {
      'dersKey': 'ayttarih1',
      'konu': 'Beylikten Devlete(1300-1453}',
      'durum': 'false',
      'alanKey': 'Alan.EaSoz'
    },
    {
      'dersKey': 'ayttarih1',
      'konu': 'Dünya Gücü Osmanlı Devleti(1453-1600}',
      'durum': 'false',
      'alanKey': 'Alan.EaSoz'
    },
    {
      'dersKey': 'ayttarih1',
      'konu': 'Arayış Yılları(17. Yüzyıl)',
      'durum': 'false',
      'alanKey': 'Alan.EaSoz'
    },
    {
      'dersKey': 'ayttarih1',
      'konu': 'Yeni Çağ\'da Avrupa',
      'durum': 'false',
      'alanKey': 'Alan.EaSoz'
    },
    {
      'dersKey': 'ayttarih1',
      'konu': 'Osmanlı Kültür ve Medeniyeti',
      'durum': 'false',
      'alanKey': 'Alan.EaSoz'
    },
    {
      'dersKey': 'ayttarih1',
      'konu': 'Avrupa ve Osmanlı Devleti(18. Yüzyıl)',
      'durum': 'false',
      'alanKey': 'Alan.EaSoz'
    },
    {
      'dersKey': 'ayttarih1',
      'konu': 'En Uzun Yüzyıl(1800-1922)',
      'durum': 'false',
      'alanKey': 'Alan.EaSoz'
    },
    {
      'dersKey': 'ayttarih1',
      'konu': '1881\'den 199\'a Mustafa Kemal',
      'durum': 'false',
      'alanKey': 'Alan.EaSoz'
    },
    {
      'dersKey': 'ayttarih1',
      'konu': 'Kurtuluş Savaşı Hazırlık Dönemi',
      'durum': 'false',
      'alanKey': 'Alan.EaSoz'
    },
    {
      'dersKey': 'ayttarih1',
      'konu': 'Kurtuluş Savaşı\'nda Cepheler',
      'durum': 'false',
      'alanKey': 'Alan.EaSoz'
    },
    {
      'dersKey': 'ayttarih1',
      'konu': 'Türk İnkılabı',
      'durum': 'false',
      'alanKey': 'Alan.EaSoz'
    },
    {
      'dersKey': 'ayttarih1',
      'konu': 'Atatürkçülük ve Atatürk İlkeleri',
      'durum': 'false',
      'alanKey': 'Alan.EaSoz'
    },
    {
      'dersKey': 'ayttarih1',
      'konu': 'Atatürk Dönemi Türk Dış Politikası',
      'durum': 'false',
      'alanKey': 'Alan.EaSoz'
    },
    {
      'dersKey': 'aytcog2',
      'konu': 'Doğal Sistemler',
      'durum': 'false',
      'alanKey': 'Alan.Soz'
    },
    {
      'dersKey': 'aytcog2',
      'konu': 'Beşeri Sistemler',
      'durum': 'false',
      'alanKey': 'Alan.Soz'
    },
    {
      'dersKey': 'aytcog2',
      'konu': 'Mekansal Sentez Türkiye',
      'durum': 'false',
      'alanKey': 'Alan.Soz'
    },
    {
      'dersKey': 'aytcog2',
      'konu': 'Küresel Ortam: Bölgeler ve Ülkeler',
      'durum': 'false',
      'alanKey': 'Alan.Soz'
    },
    {
      'dersKey': 'aytcog2',
      'konu': 'Çevre ve Toplum',
      'durum': 'false',
      'alanKey': 'Alan.Soz'
    },
    {
      'dersKey': 'aytcog2',
      'konu': 'Ekonomik Faaliyetler',
      'durum': 'false',
      'alanKey': 'Alan.Soz'
    },
    {
      'dersKey': 'ayttarih2',
      'konu': 'Tarih Bilimi',
      'durum': 'false',
      'alanKey': 'Alan.Soz'
    },
    {
      'dersKey': 'ayttarih2',
      'konu': 'Uygarlığın Doğuşu ve İlk Uygarlıklar',
      'durum': 'false',
      'alanKey': 'Alan.Soz'
    },
    {
      'dersKey': 'ayttarih2',
      'konu': 'İlk Türk Devletleri',
      'durum': 'false',
      'alanKey': 'Alan.Soz'
    },
    {
      'dersKey': 'ayttarih2',
      'konu': 'İslam Tarihi ve Uygarlığı',
      'durum': 'false',
      'alanKey': 'Alan.Soz'
    },
    {
      'dersKey': 'ayttarih2',
      'konu': 'Türk-İslam Devletleri',
      'durum': 'false',
      'alanKey': 'Alan.Soz'
    },
    {
      'dersKey': 'ayttarih2',
      'konu': 'Türkiye Tarihi',
      'durum': 'false',
      'alanKey': 'Alan.Soz'
    },
    {
      'dersKey': 'ayttarih2',
      'konu': 'Beylikten Devlete (1300-1453)',
      'durum': 'false',
      'alanKey': 'Alan.Soz'
    },
    {
      'dersKey': 'ayttarih2',
      'konu': 'Dünya Gücü: Osmanlı Devleti (1453-1600)',
      'durum': 'false',
      'alanKey': 'Alan.Soz'
    },
    {
      'dersKey': 'ayttarih2',
      'konu': 'Arayış Yılları (17. Yüzyıl)',
      'durum': 'false',
      'alanKey': 'Alan.Soz'
    },
    {
      'dersKey': 'ayttarih2',
      'konu': 'Avrupa ve Osmanlı Devleti (18. Yüzyıl)',
      'durum': 'false',
      'alanKey': 'Alan.Soz'
    },
    {
      'dersKey': 'ayttarih2',
      'konu': 'En Uzun Yüzyıl (1800-1922)',
      'durum': 'false',
      'alanKey': 'Alan.Soz'
    },
    {
      'dersKey': 'ayttarih2',
      'konu': '1881’den 1919’a Mustafa Kemal',
      'durum': 'false',
      'alanKey': 'Alan.Soz'
    },
    {
      'dersKey': 'ayttarih2',
      'konu': 'Milli Mücadele\'nin Hazırlık Dönemi',
      'durum': 'false',
      'alanKey': 'Alan.Soz'
    },
    {
      'dersKey': 'ayttarih2',
      'konu': 'Kurtuluş Savaşı\'nda Cepheler',
      'durum': 'false',
      'alanKey': 'Alan.Soz'
    },
    {
      'dersKey': 'ayttarih2',
      'konu': 'Türk İnkılabı',
      'durum': 'false',
      'alanKey': 'Alan.Soz'
    },
    {
      'dersKey': 'ayttarih2',
      'konu': 'Atatürkçülük ve Atatürk İlkeleri',
      'durum': 'false',
      'alanKey': 'Alan.Soz'
    },
    {
      'dersKey': 'ayttarih2',
      'konu': 'Türk Dış Politikası',
      'durum': 'false',
      'alanKey': 'Alan.Soz'
    },
    {
      'dersKey': 'ayttarih2',
      'konu': 'Atatürk\'ün Ölümü',
      'durum': 'false',
      'alanKey': 'Alan.Soz'
    },
    {
      'dersKey': 'ayttarih2',
      'konu': 'Yüzyılın Başlarında Dünya',
      'durum': 'false',
      'alanKey': 'Alan.Soz'
    },
    {
      'dersKey': 'ayttarih2',
      'konu': 'İkinci Dünya Savaşı',
      'durum': 'false',
      'alanKey': 'Alan.Soz'
    },
    {
      'dersKey': 'ayttarih2',
      'konu': 'Soğuk Savaş Dönemi',
      'durum': 'false',
      'alanKey': 'Alan.Soz'
    },
    {
      'dersKey': 'ayttarih2',
      'konu': 'Yumuşama Dönemi ve Sonrası',
      'durum': 'false',
      'alanKey': 'Alan.Soz'
    },
    {
      'dersKey': 'ayttarih2',
      'konu': 'Küreselleşen Dünya',
      'durum': 'false',
      'alanKey': 'Alan.Soz'
    },
    {
      'dersKey': 'ayttarih2',
      'konu': 'Türklerde Devlet Teşkilatı',
      'durum': 'false',
      'alanKey': 'Alan.Soz'
    },
    {
      'dersKey': 'ayttarih2',
      'konu': 'Türklerde Toplum Yapısı',
      'durum': 'false',
      'alanKey': 'Alan.Soz'
    },
    {
      'dersKey': 'ayttarih2',
      'konu': 'Türklerde Hukuk',
      'durum': 'false',
      'alanKey': 'Alan.Soz'
    },
    {
      'dersKey': 'ayttarih2',
      'konu': 'Türklerde Ekonomi',
      'durum': 'false',
      'alanKey': 'Alan.Soz'
    },
    {
      'dersKey': 'ayttarih2',
      'konu': 'Türklerde Eğitim',
      'durum': 'false',
      'alanKey': 'Alan.Soz'
    },
    {
      'dersKey': 'ayttarih2',
      'konu': 'Türklerde Sanat',
      'durum': 'false',
      'alanKey': 'Alan.Soz'
    },
    {
      'dersKey': 'aytfelgrub',
      'konu': 'Felsefenin Alanı',
      'durum': 'false',
      'alanKey': 'Alan.Soz'
    },
    {
      'dersKey': 'aytfelgrub',
      'konu': 'Bilgi Felsefesi',
      'durum': 'false',
      'alanKey': 'Alan.Soz'
    },
    {
      'dersKey': 'aytfelgrub',
      'konu': 'Bilim Felsefesi',
      'durum': 'false',
      'alanKey': 'Alan.Soz'
    },
    {
      'dersKey': 'aytfelgrub',
      'konu': 'Varlık Felsefesi',
      'durum': 'false',
      'alanKey': 'Alan.Soz'
    },
    {
      'dersKey': 'aytfelgrub',
      'konu': 'Ahlak Felsefesi',
      'durum': 'false',
      'alanKey': 'Alan.Soz'
    },
    {
      'dersKey': 'aytfelgrub',
      'konu': 'Siyaset Felsefesi',
      'durum': 'false',
      'alanKey': 'Alan.Soz'
    },
    {
      'dersKey': 'aytfelgrub',
      'konu': 'Sanat Felsefesi',
      'durum': 'false',
      'alanKey': 'Alan.Soz'
    },
    {
      'dersKey': 'aytfelgrub',
      'konu': 'Din Felsefesi',
      'durum': 'false',
      'alanKey': 'Alan.Soz'
    },
    {
      'dersKey': 'aytfelgrub',
      'konu': 'Mantığa Giriş',
      'durum': 'false',
      'alanKey': 'Alan.Soz'
    },
    {
      'dersKey': 'aytfelgrub',
      'konu': 'Klasik Mantık',
      'durum': 'false',
      'alanKey': 'Alan.Soz'
    },
    {
      'dersKey': 'aytfelgrub',
      'konu': 'Mantık ve Dil',
      'durum': 'false',
      'alanKey': 'Alan.Soz'
    },
    {
      'dersKey': 'aytfelgrub',
      'konu': 'Sembolik Mantık',
      'durum': 'false',
      'alanKey': 'Alan.Soz'
    },
    {
      'dersKey': 'aytfelgrub',
      'konu': 'Psikoloji Bilimini Tanıyalım',
      'durum': 'false',
      'alanKey': 'Alan.Soz'
    },
    {
      'dersKey': 'aytfelgrub',
      'konu': 'Psikolojinin Temel Süreçleri',
      'durum': 'false',
      'alanKey': 'Alan.Soz'
    },
    {
      'dersKey': 'aytfelgrub',
      'konu': 'Öğrenme Bellek Düşünme',
      'durum': 'false',
      'alanKey': 'Alan.Soz'
    },
    {
      'dersKey': 'aytfelgrub',
      'konu': 'Ruh Sağlığının Temelleri',
      'durum': 'false',
      'alanKey': 'Alan.Soz'
    },
    {
      'dersKey': 'aytfelgrub',
      'konu': 'Sosyolojiye Giriş',
      'durum': 'false',
      'alanKey': 'Alan.Soz'
    },
    {
      'dersKey': 'aytfelgrub',
      'konu': 'Birey ve Toplum',
      'durum': 'false',
      'alanKey': 'Alan.Soz'
    },
    {
      'dersKey': 'aytfelgrub',
      'konu': 'Toplumsal Yapı',
      'durum': 'false',
      'alanKey': 'Alan.Soz'
    },
    {
      'dersKey': 'aytfelgrub',
      'konu': 'Toplumsal Değişme ve Gelişme',
      'durum': 'false',
      'alanKey': 'Alan.Soz'
    },
    {
      'dersKey': 'aytfelgrub',
      'konu': 'Toplum ve Kültür',
      'durum': 'false',
      'alanKey': 'Alan.Soz'
    },
    {
      'dersKey': 'aytfelgrub',
      'konu': 'Toplumsal Kurumlar',
      'durum': 'false',
      'alanKey': 'Alan.Soz'
    },
    {
      'dersKey': 'aytfelgrub',
      'konu': 'Kur’an-ı Kerim’in Anlaşılması ve Kavranması',
      'durum': 'false',
      'alanKey': 'Alan.Soz'
    },
    {
      'dersKey': 'aytfelgrub',
      'konu': 'İnsan ve Din',
      'durum': 'false',
      'alanKey': 'Alan.Soz'
    },
    {
      'dersKey': 'aytfelgrub',
      'konu': 'İslam ve İbadetler',
      'durum': 'false',
      'alanKey': 'Alan.Soz'
    },
    {
      'dersKey': 'aytfelgrub',
      'konu': 'İslam Düşüncesinde Yorumlar, Mezhepler',
      'durum': 'false',
      'alanKey': 'Alan.Soz'
    },
    {
      'dersKey': 'aytfelgrub',
      'konu': 'Muhammed’in Hayatı, Örnekliği ve Onu Anlama.',
      'durum': 'false',
      'alanKey': 'Alan.Soz'
    },
    {
      'dersKey': 'aytfelgrub',
      'konu': 'İslam ve Bilim, Estetik, Barış',
      'durum': 'false',
      'alanKey': 'Alan.Soz'
    },
    {
      'dersKey': 'aytfelgrub',
      'konu': 'Yaşayan Dinler ve Benzer Özellikleri',
      'durum': 'false',
      'alanKey': 'Alan.Soz',
    },
  ];
  static Future<void> multiDb(Database db, int version) async {
    await db.execute(
      'CREATE TABLE konular (id INTEGER PRIMARY KEY AUTOINCREMENT,konu text, durum text,ks int,dersKey text, alanKey text)',
    );
    _varsayilanKonu.forEach((f) async {
      await db.insert(
          'konular',
          {
            'konu': f['konu'],
            'durum': f['durum'],
            'dersKey': f['dersKey'],
            'alanKey': f['alanKey'],
            'ks': 0,
          },
          conflictAlgorithm: ConflictAlgorithm.replace);
    });

    await db.execute(
      'CREATE TABLE sinavlar (id INTEGER PRIMARY KEY AUTOINCREMENT,sinavAdi text,diplomaPuani integer,tytTurkceNet real,tytMatNet real,tytFenNet real,tytSosNet real,tytHamPuan real,aytSayMatNet real,aytSayKimyaNet real,aytSayFizikNet real,aytSayBioNet real,aytHamSayPuan real,aytSozEdebNet real,aytSozCog1Net real,aytSozCog2Net real,aytSozDinNet real,aytSozFelNet real,aytSozTar1Net real,aytSozTar2Net real,aytHamSozPuan real,aytDilNet real,aytHamDilPuan real,aytEaCog1Net real,aytEaEdebNet real,aytEaMatNet real,aytEaTar1Net real,aytHamEaPuan real)',
    );
  }

  static Future<Database> database() async {
    final dbPath = await getDatabasesPath();
    return openDatabase(
      path.join(dbPath, 'danisman1.db'),
      onCreate: multiDb,
      version: 1,
    );
  }

  static Future<void> update(
      String table, Map<String, Object> data, int id) async {
    final db = await DbHelper.database();
     db.update(table, data,
        conflictAlgorithm: ConflictAlgorithm.replace,
        where: 'id = ?',
        whereArgs: [id]);
  }

  static Future<void> insert(String table, Map<String, Object> data) async {
    final db = await DbHelper.database();
    db.insert(
      table,
      data,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  static Future<void> delete(String table, int id) async {
    final db = await DbHelper.database();
     db.delete(table, where: 'id = ?', whereArgs: [id]);
  }

  static Future<List<Map<String, dynamic>>> getData(String table) async {
    final db = await DbHelper.database();
    return db.query(table);
  }
}
