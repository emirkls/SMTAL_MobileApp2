import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:project/models/ogrenci.dart';

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  static TextEditingController ograd = TextEditingController();

  static TextEditingController not1 = TextEditingController();

  static TextEditingController not2 = TextEditingController();

  static TextEditingController dftrnot = TextEditingController();

  static TextEditingController bcrnot = TextEditingController();

  static double toplam = 0;

  static List<ogrcls> ogrenciler = [];

  static void _silOgrenci(int index) {
    _MyAppState.ogrenciler.removeAt(index);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text(
            "  SATOM  ",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
          ),
          /*actions: <Widget>[
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.school),
              iconSize: 25,
            )
          ],*/
        ),
        body: Column(
          children: [
            Container(
              height: 500,
              color: Colors.white24, //white24
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(""),
                  const Text(" ÖĞRENCİNİN ADI SOYADI"),
                  Padding(
                    padding: const EdgeInsets.only(left: 70, right: 70),
                    child: TextField(
                      controller: ograd,
                    ),
                  ),
                  const Text(""),
                  const Text(" 1. STAJ NOTU"),
                  Padding(
                    padding: const EdgeInsets.only(left: 70, right: 70),
                    child: TextField(
                      keyboardType: TextInputType.number,
                      controller: not1,
                    ),
                  ),
                  const Text(""),
                  const Text(" 2. STAJ NOTU"),
                  Padding(
                    padding: const EdgeInsets.only(left: 70, right: 70),
                    child: TextField(
                      keyboardType: TextInputType.number,
                      controller: not2,
                    ),
                  ),
                  const Text(""),
                  const Text("  STAJ DEFTERİ NOTU"),
                  Padding(
                    padding: const EdgeInsets.only(left: 70, right: 70),
                    child: TextField(
                      keyboardType: TextInputType.number,
                      controller: dftrnot,
                    ),
                  ),
                  const Text(""),
                  const Text("   BECERİ NOTU  "),
                  Padding(
                    padding: const EdgeInsets.only(left: 70, right: 70),
                    child: TextField(
                      keyboardType: TextInputType.number,
                      controller: bcrnot,
                    ),
                  ),
                  const Text(""),
                  Text(
                    "  DİPLOMA NOTU : $toplam",
                    style: const TextStyle(
                      color: Colors.red,
                      fontSize: 20,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        ograd.clear();
                        not1.clear();
                        not2.clear();
                        dftrnot.clear();
                        bcrnot.clear();
                        toplam = 0;
                      });
                    },
                    child: const Text("SIFIRLA"),
                  ),
                ],
              ),
            ),
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Builder(builder: (context) {
          return Padding(
            padding: const EdgeInsets.all(159.0),
            child: SizedBox(
              child: Row(
                children: [
                  FloatingActionButton(
                    onPressed: () {
                      debugPrint('liste açıldı');
                      runApp(kayit());
                      /*if (_kayitState == _MyAppState.ogrenciler.first.isim) {
                        runApp(kayit());
                      } else {
                        runApp(MyApp());
                      }*/
                    },
                    //child: Text("LİSTE"),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: const Icon(Icons.account_circle_sharp),
                  ),
                  FloatingActionButton(
                    onPressed: () {
                      //debugPrint('KAYDEDİLDİ');

                      setState(() {
                        double a = (double.parse(not1.text) +
                                double.parse(not2.text)) /
                            2;

                        if (double.parse(not1.text) > 100 ||
                            0 > double.parse(not1.text)) {
                          debugPrint("1. STAJ NOTUNA GEÇERLİ SAYI GİRİNİZ");
                        }

                        if (double.parse(not2.text) > 100 ||
                            0 > double.parse(not2.text)) {
                          debugPrint("2. STAJ NOTUNA GEÇERLİ SAYI GİRİNİZ");
                        }

                        double b = (double.parse(dftrnot.text) * 0.20);

                        if (double.parse(dftrnot.text) > 100 ||
                            0 > double.parse(dftrnot.text)) {
                          debugPrint("DEFTER NOTUNA GEÇERLİ SAYI GİRİNİZ");
                        }

                        double c = (double.parse(bcrnot.text) * 0.80);

                        if (double.parse(bcrnot.text) > 100 ||
                            0 > double.parse(bcrnot.text)) {
                          debugPrint("BECERİ NOTUNA GEÇERLİ SAYI GİRİNİZ");
                        }

                        double d = b + c;
                        toplam = (a + d) / 2;
                        ogrcls ogrencicls = ogrcls(
                            isim: ograd.text,
                            stjnt1: double.parse(not1.text),
                            stjnt2: double.parse(not2.text),
                            dftnt: double.parse(dftrnot.text),
                            bcnt: double.parse(bcrnot.text),
                            not: toplam);
                        ogrenciler.add(ogrencicls);
                        debugPrint(ogrenciler.length.toString());
                      });
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: const Icon(Icons.save_alt),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}

class kayit extends StatefulWidget {
  @override
  State<kayit> createState() => _kayitState();
}

class _kayitState extends State<kayit> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "  LİSTE  ",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
          ),
          actions: <Widget>[
            Row(
              children: <Widget>[
                IconButton(
                  // LİSTEYİ SİL
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.white,
                    size: 32,
                  ),
                  onPressed: () {
                    setState(() {
                      debugPrint('Silindi, eleman sayısı');
                      _MyAppState.ogrenciler.clear();
                      debugPrint(_MyAppState.ogrenciler.length.toString());
                    });
                  },
                ),
                Title(color: Colors.blue, child: const Text("       ")),
                IconButton(
                  //NOT EKRANINA DÖNER
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                    size: 32,
                  ),
                  onPressed: () {
                    runApp(MyApp());
                  },
                ),
              ],
            ),
          ],
        ),
        body: Container(
          child: ListView.builder(
            itemCount: _MyAppState.ogrenciler.length,
            itemBuilder: (BuildContext context, int index) {
              _MyAppState.ogrenciler[index];
              return Card(
                margin:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                child: ListTile(
                  title: Text(
                      '  ${_MyAppState.ogrenciler[index].isim}          ${_MyAppState.ogrenciler[index].not}'),
                  leading: CircleAvatar(
                    child: Text(
                      (_MyAppState.ogrenciler[index].isim) +
                          (_MyAppState.ogrenciler[index].not.toString()),
                    ),
                  ),
                  trailing: const Icon(Icons.delete),
                  onLongPress: () {
                    setState(() {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              insetPadding:
                                  EdgeInsets.only(top: 250, bottom: 200),
                              content: Stack(
                                fit: StackFit.loose,
                                children: <Widget>[
                                  Column(
                                    children: [
                                      Text("       "),
                                      Text("       "),
                                      Text("       "),
                                      Text(
                                        "${_MyAppState.ogrenciler[index].isim}             ",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w800),
                                      ),
                                      Text("       "),
                                      Text("       "),
                                      Text(
                                          "1. STAJ NOTU   :     ${_MyAppState.ogrenciler[index].stjnt1}"),
                                      Text("       "),
                                      Text(
                                          "2. STAJ NOTU   :    ${_MyAppState.ogrenciler[index].stjnt2}"),
                                      Text("       "),
                                      Text(
                                          "DEFTER  NOTU  :     ${_MyAppState.ogrenciler[index].dftnt}"),
                                      Text("       "),
                                      Text(
                                          "BECERİ  NOTU   :    ${_MyAppState.ogrenciler[index].bcnt}"),
                                      Text(""),
                                      Text(""),
                                      Text(
                                        "ORTALAMA        :     ${_MyAppState.ogrenciler[index].not}",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w700),
                                      ),
                                    ],
                                  ),
                                  Positioned(
                                    right: 10.0,
                                    top: 10.0,
                                    child: InkResponse(
                                      onTap: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: const CircleAvatar(
                                        child: Icon(Icons.close),
                                        backgroundColor: Colors.red,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            );
                          });
                    });
                  },
                  onTap: () {
                    setState(() {
                      _MyAppState.ogrenciler.removeAt(index);
                    });
                  },
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
