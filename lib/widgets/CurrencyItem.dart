import 'package:desi_helper/data/CurrencySection.dart';
import 'package:flutter/material.dart';
import 'package:sticky_headers/sticky_headers.dart';

class CurrencyItemWidget extends StatelessWidget {
  const CurrencyItemWidget({required this.currencySection, super.key});

  final CurrencySection currencySection;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Center(
            child: Text(
              currencySection.header,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Colors.white, fontSize: 50),
            ),
          ),
        ),
        ...currencySection.items.map(
          (e) => Card(
            elevation: 4,
            color: Color.fromARGB(255, 32, 33, 36),
            shape: RoundedRectangleBorder(
                side: BorderSide(
                  color: const Color.fromARGB(255, 60, 64, 67),
                ),
                borderRadius: BorderRadius.circular(20.0)),
            child: Container(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            e.name,
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          Text(
                            e.english_name,
                            style: Theme.of(context).textTheme.titleLarge,
                          )
                        ],
                      ),
                    ),
                  ),
                  Divider(
                    color: Color.fromARGB(255, 60, 64, 67),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Sounds like"),
                              Text(
                                e.sound,
                                style:
                                    Theme.of(context).textTheme.headlineSmall,
                              )
                            ],
                          ),
                        ),
                        Container(
                          constraints: BoxConstraints(minWidth: 70.0),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.red),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Text(
                              e.value.toString(),
                              style: Theme.of(context).textTheme.headlineSmall,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
/*
ListTile(
title: Text(
e.name,
style: Theme.of(context)
    .textTheme
    .titleLarge!
    .copyWith(fontSize: 24),
),
trailing: Text(
e.value.toString(),
style: Theme.of(context).textTheme.displayMedium,
),
)*/
