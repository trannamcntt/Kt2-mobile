import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kt2/View/EditMoney.dart';
import 'main.dart';
import 'CustomMoney.dart';
import 'NewTransaction.dart';

class Person extends StatefulWidget {
  final String name;
  final String img;
  final String symbol;

  Person({required this.name, required this.img, required this.symbol});


  @override
  State<StatefulWidget> createState() => PersonState(name: name, img: img, symbol: symbol);
}

class PersonState extends State<Person> {
  final String name;
  final String img;
  final String symbol;
  String symbolData = '';
  String imgData = '';
  String nameData = '';

  PersonState({required this.name, required this.img, required this.symbol});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tài khoản"),
      ),
      body: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          children: [
            Center(
              child: Padding(
                padding: EdgeInsets.only(top: 36),
                child: Text('Xin chào Boss!', style: TextStyle(fontSize: 24),),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 36.0),
              child: Card(
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      symbolData = symbol;
                      imgData = img;
                      nameData = name;
                    });
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => CustomMoney(symbol: symbolData, img: imgData, name: nameData)
                    ));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(Icons.attach_money, color: Colors.white54,),
                        Text("Đơn vị tiền tệ", style: TextStyle(color: Colors.white),),
                        Icon(Icons.chevron_right, color: Colors.white54)
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.black87,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.home),
              color: Colors.white,
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.account_balance_wallet),
              color: Colors.white,
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  symbolData = symbol;
                });
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => NewTransaction(symbol: symbolData))
                );
              },
              icon: Icon(Icons.add),
              color: Colors.white,
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.paid),
              color: Colors.white,
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  symbolData = symbol;
                  imgData = img;
                  nameData = name;
                });
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Person(symbol: symbolData, img: imgData, name: nameData)
                ));
              },
              icon: Icon(Icons.person),
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}