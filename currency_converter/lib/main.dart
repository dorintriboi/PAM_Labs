import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(home: Home()));

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  double exchangeValue = 17.50;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.grey[100],
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.fromLTRB(0, 50, 0, 0),
                child: Center(
                  child: Column(
                    children: [
                      Text(
                        "Currency Converter",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                            color: Colors.purple[900]),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CardCurrency(currency: exchangeValue)
                    ],
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Indicative Exchange Rate",
                      style: TextStyle(
                        color: Colors.grey[500],
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        const Text(
                          "1 USD = ",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        const SizedBox(width: 10),
                        SizedBox(
                          width: 100,
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(7.0),
                                borderSide: BorderSide.none, // Fără bordură
                              ),
                              filled: true,
                              fillColor: Colors.white,
                            ),
                            onChanged: (value) => setState(() {
                              exchangeValue = double.tryParse(value) ?? 0.0;
                            }),
                          ),
                        ),
                        const SizedBox(width: 10),
                        const Text(
                          "MDL",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CardCurrency extends StatefulWidget {
  final double currency;

  const CardCurrency({super.key, required this.currency});

  @override
  State<CardCurrency> createState() => _CardCurrencyState();
}

class _CardCurrencyState extends State<CardCurrency> {
  bool isUsdToMdl = true;
  double inputValue = 1.0;

  void toggleCurrency() {
    setState(() {
      isUsdToMdl = !isUsdToMdl;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(15.0),
      color: Colors.white,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadiusDirectional.all(Radius.circular(10.0))),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            ConverterComponent(
              iconName: 'Amount',
              iconPath: isUsdToMdl ? "images/image1.png" : "images/image2.webp",
              currency: isUsdToMdl ? "MDL" : "USD",
              initialValue1: inputValue,
              onValueChanged: (value) {
                setState(() {
                  inputValue = value;
                });
              },
            ),
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: 1,
                  color: Colors.grey[200],
                  width: double.infinity,
                ),
                GestureDetector(
                  onTap: toggleCurrency,
                  child: const Icon(
                    Icons.swap_vert_circle,
                    color: Color.fromARGB(255, 40, 13, 158),
                    size: 50,
                  ),
                ),
              ],
            ),
            ConverterComponent(
              iconName: 'Converted Amount',
              iconPath: isUsdToMdl ? "images/image2.webp" : "images/image1.png",
              currency: isUsdToMdl ? "USD" : "MDL",
              initialValue1: isUsdToMdl
                  ? inputValue / widget.currency
                  : inputValue * widget.currency,
              onValueChanged: (value) {},
            ),
          ],
        ),
      ),
    );
  }
}

class ConverterComponent extends StatefulWidget {
  final String iconName;
  final String iconPath;
  final String currency;
  final double initialValue1;
  final ValueChanged<double> onValueChanged;

  const ConverterComponent({
    super.key,
    required this.iconName,
    required this.iconPath,
    required this.currency,
    required this.initialValue1,
    required this.onValueChanged,
  });

  @override
  State<ConverterComponent> createState() => _ConverterComponentState();
}

class _ConverterComponentState extends State<ConverterComponent> {
  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    controller.text = widget.initialValue1.toStringAsFixed(2);
  }

  @override
  void didUpdateWidget(covariant ConverterComponent oldWidget) {
    super.didUpdateWidget(oldWidget);
    controller.text = widget.initialValue1.toStringAsFixed(2);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(1.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.iconName,
                  style: TextStyle(color: Colors.grey[500], fontSize: 16),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CircleAvatar(
                      radius: 25,
                      backgroundImage: AssetImage(widget.iconPath),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    AbsorbPointer(
                      absorbing: true,
                      child: DropdownButton(
                        underline: const SizedBox.shrink(),
                        icon: Icon(Icons.arrow_drop_down_sharp,
                            color: Colors.purple[900], size: 20),
                        items: [
                          DropdownMenuItem(
                            child: Text(
                              widget.currency,
                              style: TextStyle(
                                  color: Colors.purple[900], fontSize: 20),
                            ),
                          )
                        ],
                        onChanged: (value) => "",
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: SizedBox(
              height: 50.0,
              child: TextFormField(
                controller: controller,
                textAlign: TextAlign.right,
                keyboardType: TextInputType.number,
                style: const TextStyle(decoration: TextDecoration.none),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(7.0),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Colors.grey[200],
                ),
                onChanged: (value) {
                  widget.onValueChanged(double.tryParse(value) ?? 0.0);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
