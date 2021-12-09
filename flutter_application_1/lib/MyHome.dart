import 'package:flutter/material.dart';

class MyHome extends StatefulWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  var kahveList = [
    "Caramel cream",
    "Caramel frappucino",
    "Chai cream",
    "Java chip",
    "White chocoleta"
  ];
  List<double> fiyatList = [13, 17.9, 19, 11.9, 13];
  var gorselList = [
    "caramel_cream_frapuccino.png",
    "caramel_frappucino.png",
    "chai_cream_frapuccino.png",
    "java_chip_frapuccino.png",
    "white_chocoleta_mocha.png"
  ];
  @override
  Widget build(BuildContext context) {
    var genislik = MediaQuery.of(context).size.width / 2.5;

    return Scaffold(
      backgroundColor: Color(0xFF112E29),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // starbucks yazısı
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: starLogo(),
              ),
              // icon - logo
              Padding(
                padding: const EdgeInsets.only(
                    top: 0, left: 128, right: 128, bottom: 5),
                child: Image.asset("lib/gorseller/str.png"),
              ),
              // stack yapısı ürün görselleştirme ile sipariş ekranları:
              SizedBox(
                height: 470,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    kahveSepeti(
                        kahveList[0], fiyatList[0], gorselList[0], context),
                    kahveSepeti(
                        kahveList[1], fiyatList[1], gorselList[1], context),
                    kahveSepeti(
                        kahveList[2], fiyatList[2], gorselList[2], context),
                    kahveSepeti(
                        kahveList[3], fiyatList[3], gorselList[3], context),
                    kahveSepeti(
                        kahveList[4], fiyatList[4], gorselList[4], context),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget starLogo() {
  return Center(
    child: Container(
        decoration: BoxDecoration(
            color: Color(0xFF112E29), borderRadius: BorderRadius.circular(20)),
        child: Column(
          children: [
            Text(
              "Starbucks",
              style: TextStyle(
                  fontSize: 50, fontFamily: 'Cookie', color: Colors.white),
            ),
          ],
        )),
  );
}

Widget kahveSepeti(
    String kahve, double fiyat, String fotograf, BuildContext context) {
  bool deger = false;
  return Padding(
    padding: const EdgeInsets.only(left: 32, right: 32),
    child: Center(
      child: Container(
        height: 470,
        width: 340,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        ),
        child: Column(
          children: [
            // kahve görseli:
            Padding(
              padding: const EdgeInsets.only(
                  top: 10, left: 33, right: 33, bottom: 10),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color(0xFF112E29),
                ),
                width: 250,
                height: 280,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.all(50),
                        child:
                            Image(image: AssetImage("lib/gorseller/$fotograf")),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // kahve ismi :
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30),
              child: Text(
                "$kahve",
                style: TextStyle(
                  fontSize: 23,
                  color: Color(0xFF112E29),
                  fontFamily: 'CinzelBold',
                ),
              ),
            ), // font ekle !!!
            // row - sol yazı sağ iki iconButon ve bir text :
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                      onTap: () {
                        setState(() {
                          deger = false;
                        });
                      },
                      child: Icon(
                        Icons.navigate_before,
                        size: 35,
                      )),
                  Padding(
                    padding: const EdgeInsets.only(right: 27, left: 27),
                    child: deger
                        ? Text(
                            "Tall",
                            style: TextStyle(
                              fontSize: 21,
                              color: Color(0xFF112E29),
                              fontFamily: 'Cinzel',
                            ),
                          )
                        : Text(
                            "Grande",
                            style: TextStyle(
                              fontSize: 21,
                              color: Color(0xFF112E29),
                              fontFamily: 'Cinzel',
                            ),
                          ),
                  ),
                  GestureDetector(
                      onTap: () {
                        setState(() {
                          deger = true;
                        });
                      },
                      child: Icon(
                        Icons.navigate_next,
                        size: 35,
                      )),
                ],
              ),
            ), // font ekle !!!
            // fiyat :
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Text(
                "${fiyat}0 £ ",
                style: TextStyle(
                  fontSize: 20,
                  color: Color(0xFF112E29),
                  fontFamily: 'CinzelBold',
                ),
              ),
            ), // font ekle !!!
            // özelleştirilmiş buton :
            Padding(
              padding: const EdgeInsets.only(
                  top: 10, right: 90, left: 90, bottom: 10),
              child: GestureDetector(
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(
                      "$kahve ürünü sepete başarıyla eklendi...",
                      style: TextStyle(color: Colors.white),
                    ),
                    backgroundColor: Color(0xFF326E36),
                  ));
                },
                child: Container(
                  height: 40,
                  width: 180,
                  child: Center(
                      child: Text(
                    "Order from here",
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF112E29),
                      fontFamily: 'Cinzel',
                    ),
                  )),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(20),
                  ), // çerçeve rengi verir.
                ),
              ),
            ), // font ekle !!!
          ],
        ),
      ),
    ),
  );
}

void setState(Null Function() param0) {}
