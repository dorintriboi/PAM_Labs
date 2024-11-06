//import 'package:flutter/material.dart';
//import 'package:world_time_changer/pages/chose_location.dart';
//import 'package:world_time_changer/pages/home.dart';
//import 'package:world_time_changer/pages/Loading.dart';

//void main() => runApp(MaterialApp(
//     initialRoute: '/',
//     routes: {
//      '/': (context) => const Loading(),
//     '/home': (context) => const Home(),
//    '/location': (context) => const ChooseLocation(),
//   },
// ));

import 'package:flutter/material.dart';

void main() {
  runApp(CurrencyConverterApp());
}

class CurrencyConverterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Currency Converter',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Currency Converter'),
        ),
        body: CurrencyConverter(),
      ),
    );
  }
}

class CurrencyConverter extends StatefulWidget {
  @override
  _CurrencyConverterState createState() => _CurrencyConverterState();
}

class _CurrencyConverterState extends State<CurrencyConverter> {
  String _selectedCurrencyFrom = 'MDL';
  String _selectedCurrencyTo = 'USD';
  double _exchangeRate = 17.65;
  double _amount = 1000.00;
  double _convertedAmount = 736.70;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          // Title
          Text(
            'Currency Converter',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),

          // Amount input
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      // Flag and currency selector
                      Icon(Icons.flag), // Replace with Image for flag
                      SizedBox(width: 8),
                      DropdownButton<String>(
                        value: _selectedCurrencyFrom,
                        items: <String>['MDL', 'USD'].map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            _selectedCurrencyFrom = newValue!;
                          });
                        },
                      ),
                      Spacer(),
                      // Input field for amount
                      Container(
                        width: 100,
                        child: TextFormField(
                          initialValue: _amount.toString(),
                          keyboardType: TextInputType.number,
                          onChanged: (value) {
                            setState(() {
                              _amount = double.tryParse(value) ?? 0;
                            });
                          },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Amount',
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  // Convert button
                  IconButton(
                    icon: Icon(Icons.swap_vert),
                    onPressed: () {
                      setState(() {
                        // Logic to convert currency
                        _convertedAmount = _amount / _exchangeRate;
                      });
                    },
                  ),
                  Row(
                    children: [
                      // Flag and currency selector for converted amount
                      Icon(Icons.flag), // Replace with Image for flag
                      SizedBox(width: 8),
                      DropdownButton<String>(
                        value: _selectedCurrencyTo,
                        items: <String>['MDL', 'USD'].map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            _selectedCurrencyTo = newValue!;
                          });
                        },
                      ),
                      Spacer(),
                      // Display the converted amount
                      Container(
                        width: 100,
                        child: TextFormField(
                          initialValue: _convertedAmount.toStringAsFixed(2),
                          readOnly: true,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Converted Amount',
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 20),
          // Exchange rate display
          Text(
            '1 USD = $_exchangeRate MDL',
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
