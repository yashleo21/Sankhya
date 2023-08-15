import 'package:desi_helper/data/CurrencySection.dart';
import 'package:desi_helper/widgets/CurrencyItem.dart';
import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../data/Currency.dart';

class CurrencyHomeScreen extends StatelessWidget {
  CurrencyHomeScreen({required this.currencyData, super.key});

  final Map<String, dynamic> currencyData;
  final ItemScrollController itemScrollController = ItemScrollController();
  final ScrollOffsetController scrollOffsetController =
      ScrollOffsetController();
  final ItemPositionsListener itemPositionsListener =
      ItemPositionsListener.create();
  final ScrollOffsetListener scrollOffsetListener =
      ScrollOffsetListener.create();

  @override
  Widget build(BuildContext context) {
    final items = currencyData.entries
        .map((e) => CurrencySection(
            header: e.key,
            items: (e.value as List)
                .map((curr) => Currency(
                    name: curr['name'] as String,
                value: curr['value'] as int,
                sound: curr['sound'] as String,
                english_name: curr['english_name'] as String
            )
            )
                .toList()))
        .toList();

    return ScrollablePositionedList.builder(
      itemCount: items.length,
      itemBuilder: (ctx, index) =>
          CurrencyItemWidget(currencySection: items[index]),
      itemScrollController: itemScrollController,
      scrollOffsetController: scrollOffsetController,
      itemPositionsListener: itemPositionsListener,
      scrollOffsetListener: scrollOffsetListener,
    );
    // return SliverList(
    //     delegate: SliverChildBuilderDelegate((ctx, index) {
    //   return CurrencyItemWidget(currencySection: items[index]);
    // }, childCount: items.length));
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
