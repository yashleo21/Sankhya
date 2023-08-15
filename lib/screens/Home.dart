import 'dart:convert';

import 'package:desi_helper/screens/CurrencyHome.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {
  Map<String, dynamic> data = {};
  TextEditingController editingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    editingController.addListener(_printLatestValue);
    readFromJson();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sankhya"),
      ),
      body: CurrencyHomeScreen(
        currencyData: data,
      ),
    );
  }

  Future<void> readFromJson() async {
    print("TEST?");
    final String response =
        await rootBundle.loadString('assets/data/numbers.json');
    final data = await json.decode(response);
    setState(() {
      this.data = data;
      print(data);
    });
  }

  void _printLatestValue() {
    final text = editingController.text;
    print("Text: $text");
  }

  @override
  void dispose() {
    editingController.dispose();
    super.dispose();
  }
}

/*
NestedScrollView(
headerSliverBuilder: (ctx, innerBoxIsScrolled) {
return <Widget>[
SliverAppBar(
floating: true,
pinned: true,
snap: false,
centerTitle: false,
title: const Text("Desi Helper"),
actions: [
IconButton(onPressed: () {}, icon: const Icon(Icons.shopping_cart))
],
),

];
},
body: CurrencyHomeScreen(currencyData: data),
)*/


//Search App bar

/*
Container(
          width: double.infinity,
          height: 40,
          color: Colors.white,
          child: Center(
            child: TextField(
              controller: editingController,
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(color: Colors.black),
              decoration: InputDecoration(
                  hintText: 'Search for something',
                  prefixIcon: Icon(Icons.search)),
            ),
          ),
        )
)*/
