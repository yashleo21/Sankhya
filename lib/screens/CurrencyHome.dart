import 'package:desi_helper/data/CurrencySection.dart';
import 'package:desi_helper/widgets/CurrencyItem.dart';
import 'package:flutter/material.dart';

import '../data/Currency.dart';

class CurrencyHomeScreen extends StatelessWidget {
  CurrencyHomeScreen({required this.currencyData, super.key});

  final Map<String, dynamic> currencyData;

  @override
  Widget build(BuildContext context) {
    final items = currencyData.entries
        .map((e) => CurrencySection(
            header: e.key, items: (e.value as List)
        .map((curr) => Currency(name: curr['name'] as String,
        value: curr['value'] as int)).toList()))
        .toList();

    return SliverList(delegate: SliverChildBuilderDelegate(
            (ctx, index) {
              return CurrencyItemWidget(currencySection: items[index]);
            },
        childCount: items.length
    ));
  }
}

/*ListView.builder(
itemCount: items.length,
itemBuilder: (ctx, index) {
final item = items[index];
return CurrencyItemWidget(
currencySection: item,
);
})*/
