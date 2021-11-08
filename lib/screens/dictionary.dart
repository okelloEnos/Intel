import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intel_test/provider/navigation_provider.dart';

class Dictionary extends StatelessWidget {
  Map<String, String> dictionary = {
    '34': 'thirty-four',
    '90': 'ninety',
    '91': 'ninety-one',
    '21': 'twenty-one',
    '61': 'sixty-one',
    '9': 'nine',
    '2': 'two',
    '6': 'six',
    '3': 'three',
    '8': 'eight',
    '80': 'eighty',
    '81': 'eighty-one',
    'Ninety-Nine': '99',
    'nine-hundred': '900'
  };
  Map<int, String> numberBased = Map<int, String>();
  Map<String, String> stringBased = Map<String, String>();
  Map<int, String> numberBasedFinal = Map<int, String>();
  Map<String, String> stringBasedFinal = Map<String, String>();
  var numSorted;
  var stringSorted;

  stringToInt(String numStringKey, String numStringValue) {
    try {
      int value = int.parse(numStringKey);
      numberBased.putIfAbsent(value, () => numStringValue);
    } on FormatException catch (e) {
      stringBased['$numStringKey'] = '$numStringValue';
    }
  }

  void sortingArray() {
    dictionary.forEach((key, value) {
      stringToInt(key, value);
      print('$key');
    });

    numSorted = numberBased.keys.toList()..sort();
    stringSorted = stringBased.keys.toList()..sort();

    for (var i in stringSorted) {
      stringBased.forEach((key, value) {
        if (i == key) {
          stringBasedFinal.putIfAbsent(i, () => value);
        }
      });
    }

    for (var i in numSorted) {
      numberBased.forEach((key, value) {
        if (i == key) {
          numberBasedFinal.putIfAbsent(i, () => value);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    sortingArray();

    return Scaffold(
      backgroundColor: Colors.orange[100],
      appBar: AppBar(
        title: Row(
          children: [
            Consumer(builder: (context, watch, child) {
              final previousTab = watch(previousNavigationStateProvider).state;
              return IconButton(
                  icon: Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () {
                    watch(bottomNavigationStateProvider).state = previousTab;
                  });
            }),
            SizedBox(
              width: 10,
            ),
            Text(
              'Dictionary',
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
      body: Center(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          elevation: 5,
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Keys',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.orange),
                    ),
                    Text(
                      'Values',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.orange),
                    )
                  ],
                ),
              ),
              for (var key in numSorted) ...[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '$key',
                        style: TextStyle(color: Colors.orange),
                      ),
                      Text('${numberBasedFinal[key]}',
                          style: TextStyle(color: Colors.orange)),
                    ],
                  ),
                )
              ],
              for (var key in stringSorted) ...[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('$key'),
                      Text('${stringBasedFinal[key]}'),
                    ],
                  ),
                )
              ]
            ],
          ),
        ),
      )),
    );
  }
}
