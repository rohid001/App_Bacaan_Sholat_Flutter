import 'package:bacaan_sholat/page/ayat_kursi_page.dart';
import 'package:bacaan_sholat/page/bacaan_sholat_page.dart';
import 'package:bacaan_sholat/page/niat_sholat_page.dart';
import 'niat_sholat_page2.dart';
import 'package:bacaan_sholat/screens/home_todo.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('App Fiqih Sederhana'),
        backgroundColor: Colors.green[700],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 40),
                Container(
                  margin: EdgeInsets.all(10),
                  child: Expanded(
                    child: InkWell(
                      highlightColor: Color.fromARGB(110, 0, 0, 0),
                      splashColor: Colors.transparent,
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => NiatSholat2()));
                      },
                      child: Column(
                        children: [
                          Image(
                            image: AssetImage("assets/images/ic_niat.png"),
                            height: 100,
                            width: 100,
                          ),
                          SizedBox(height: 10),
                          Text(
                            "Niat Sholat",
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 40),
                Container(
                  margin: EdgeInsets.all(10),
                  child: Expanded(
                    child: InkWell(
                      highlightColor: Color.fromARGB(101, 0, 0, 0),
                      splashColor: Colors.transparent,
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => BacaanSholat()));
                      },
                      child: Column(
                        children: [
                          Image(
                            image: AssetImage("assets/images/ic_doa.png"),
                            height: 100,
                            width: 100,
                          ),
                          SizedBox(height: 10),
                          Text(
                            "Bacaan Sholat",
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 40),
                Container(
                  margin: EdgeInsets.all(10),
                  child: Expanded(
                    child: InkWell(
                      highlightColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AyatKursi()));
                      },
                      child: Column(
                        children: [
                          Image(
                            image: AssetImage("assets/images/ic_bacaan.png"),
                            height: 100,
                            width: 100,
                          ),
                          SizedBox(height: 10),
                          Text(
                            "Ayat Kursi",
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 40),
                Container(
                  margin: EdgeInsets.all(10),
                  child: Expanded(
                    child: InkWell(
                      highlightColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomeTodo()));
                      },
                      child: Column(
                        children: [
                          Image(
                            image: AssetImage("assets/images/bg_todo.png"),
                            height: 100,
                            width: 100,
                          ),
                          SizedBox(height: 10),
                          Text(
                            "Todo List",
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
