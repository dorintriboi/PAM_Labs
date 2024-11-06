import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map? data;

  @override
  build(BuildContext context) {
    data = ModalRoute.of(context)?.settings.arguments as Map;
    String image = data?['isDayTime'] ?? false
        ? "./lib/assets/imag6.jpg"
        : "./lib/assets/imag6.jpg";

    Color color1 = data?['isDayTime'] ?? false
        ? Colors.blue
        : const Color.fromARGB(255, 7, 42, 71);

    return Scaffold(
      backgroundColor: color1,
      body: SafeArea(
          child: Container(
        decoration: BoxDecoration(
            image:
                DecorationImage(image: AssetImage(image), fit: BoxFit.cover)),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextButton.icon(
                onPressed: () {
                  Navigator.pushNamed(context, '/location');
                },
                icon: Icon(Icons.edit_location, color: Colors.grey[300]),
                label: Text(
                  'Edit Location',
                  style: TextStyle(color: Colors.grey[300]),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    data?['location'] ?? "",
                    style: const TextStyle(
                        fontSize: 28, letterSpacing: 2, color: Colors.white),
                  )
                ],
              ),
              const SizedBox(height: 20),
              Text(data?['time'],
                  style: const TextStyle(
                      fontSize: 66, letterSpacing: 2, color: Colors.white))
            ],
          ),
        ),
      )),
    );
  }
}
