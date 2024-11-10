import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lab_2/controller.dart';

void main() => runApp(const MaterialApp(home: Home()));

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final BarberShopController controller = Get.put(BarberShopController());
    controller.loadJsonData();

    return Scaffold(
      body: Container(
        color: Colors.white,
        child: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Obx(() {
                if (controller.barberShopData.value == null) {
                  return const Center(child: CircularProgressIndicator());
                }

                var barberShopData = controller.barberShopData.value!;
                var number = controller.count.value;

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.location_on,
                                      size: 30.0,
                                      color: Color.fromARGB(255, 40, 22, 112),
                                    ),
                                    const SizedBox(width: 5),
                                    Text(
                                      'Yogyakarta',
                                      style: TextStyle(
                                          fontSize: 17.0,
                                          color: Colors.grey[800]),
                                    ),
                                  ],
                                ),
                                const Text(
                                  "Joe Samanta",
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                            ClipOval(
                              child: Image.network(
                                barberShopData.banner.image,
                                width: 50.0,
                                height: 50.0,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                      width: double.infinity,
                      height: 250,
                      child: Stack(
                        children: [
                          Positioned.fill(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.network(
                                barberShopData.banner.image,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Positioned(
                            left: 15,
                            bottom: 10,
                            child: SizedBox(
                              width: 135,
                              height: 55,
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ButtonStyle(
                                  backgroundColor: WidgetStateProperty.all(
                                      const Color.fromARGB(255, 40, 22, 112)),
                                  shape: WidgetStateProperty.all<
                                      RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                ),
                                child: const Text(
                                  'Booking Now',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                            margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                            width: 304,
                            height: 70,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const SearchBarExample()),
                        const SizedBox(width: 20),
                        Container(
                          margin: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                          width: 57,
                          height: 55,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 40, 22, 112),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Icon(
                            Icons.checklist,
                            size: 50,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    const Text(
                      "Nearest Barbershop",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: number * 150, // Adjust height to fit your needs
                      child: ListView.builder(
                        itemCount: controller.count.value,
                        itemBuilder: (context, index) {
                          var barbershop = controller
                              .barberShopData.value!.nearestBarbershops[index];
                          return Column(
                            children: [
                              CustomImageWithText(
                                imageUrl: barbershop.image,
                                text1: barbershop.name,
                                text2: barbershop.locationWithDistance,
                                text3: barbershop.reviewRate.toString(),
                                isNetwork: false,
                              ),
                              const SizedBox(height: 15),
                            ],
                          );
                        },
                      ),
                    ),
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          if (number == 3) {
                            number = controller.barberShopData.value!
                                .nearestBarbershops.length;
                            controller.updateCount(controller.barberShopData
                                .value!.nearestBarbershops.length);
                          } else {
                            number = 3;
                            controller.updateCount(3);
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          side: const BorderSide(
                            color: Color.fromARGB(255, 40, 22, 112),
                            width: 2,
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 10),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          backgroundColor: Colors.white,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Text(
                              'See All',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 40, 22, 112),
                                  fontSize: 20),
                            ),
                            const SizedBox(width: 5),
                            Container(
                              padding: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: const Color.fromARGB(255, 40, 22, 112),
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const Icon(
                                Icons.arrow_outward,
                                color: Color.fromARGB(
                                  255,
                                  40,
                                  22,
                                  112,
                                ),
                                size: 15.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "Most recommended",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    MostRecommendedWidget(
                        recommendedItems:
                            controller.barberShopData.value!.mostRecomanded),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: number * 150, // Adjust height to fit your needs
                      child: ListView.builder(
                        itemCount: controller.count.value,
                        itemBuilder: (context, index) {
                          var barbershop =
                              controller.barberShopData.value!.list[index];
                          return Column(
                            children: [
                              CustomImageWithText(
                                imageUrl: barbershop.image,
                                text1: barbershop.name,
                                text2: barbershop.locationWithDistance,
                                text3: barbershop.reviewRate.toString(),
                                isNetwork: false,
                              ),
                              const SizedBox(height: 15),
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                );
              }),
            ),
          ),
        ),
      ),
    );
  }
}

class MostRecommendedWidget extends StatelessWidget {
  final List<Barbershop> recommendedItems;

  const MostRecommendedWidget({super.key, required this.recommendedItems});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350,
      child: PageView.builder(
        itemCount: recommendedItems.length,
        itemBuilder: (context, index) {
          final item = recommendedItems[index];
          return Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Imaginea
                    Container(
                      width: 450,
                      height: 250,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: AssetImage(item.image),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      item.name,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        const Icon(
                          Icons.location_on,
                          size: 16,
                          color: Color.fromARGB(148, 79, 48, 119),
                        ),
                        const SizedBox(width: 4),
                        Text(item.locationWithDistance,
                            style: const TextStyle(
                                color: Color.fromARGB(148, 79, 48, 119))),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        const Icon(Icons.star,
                            size: 16, color: Color.fromARGB(148, 79, 48, 119)),
                        const SizedBox(width: 4),
                        Text(item.reviewRate.toString(),
                            style: const TextStyle(
                                color: Color.fromARGB(148, 79, 48, 119))),
                      ],
                    ),
                  ],
                ),
                Positioned(
                  right: 0,
                  bottom: 100.5,
                  child: SizedBox(
                    width: 134,
                    height: 48,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10),
                          ),
                        ),
                        backgroundColor: const Color.fromARGB(255, 40, 22, 112),
                      ),
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Booking',
                            style: TextStyle(color: Colors.white),
                          ),
                          SizedBox(width: 4),
                          Icon(
                            Icons.wallet,
                            color: Colors.white,
                            size: 16,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class CustomImageWithText extends StatelessWidget {
  final String imageUrl;
  final String text1;
  final String text2;
  final String text3;
  final bool isNetwork;

  const CustomImageWithText(
      {super.key,
      required this.imageUrl,
      required this.text1,
      required this.text2,
      required this.text3,
      required this.isNetwork});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Imaginea cu border radius
        if (isNetwork)
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              imageUrl,
              width: 120,
              height: 125,
              fit: BoxFit.cover,
            ),
          ),
        if (!isNetwork)
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              imageUrl,
              width: 120,
              height: 125,
              fit: BoxFit.cover,
            ),
          ),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                text1,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                overflow: TextOverflow.visible,
                maxLines: 2,
              ),
              Row(
                children: [
                  const Icon(
                    Icons.location_on,
                    size: 16,
                    color: Color.fromARGB(148, 79, 48, 119),
                  ),
                  const SizedBox(width: 5),
                  Text(
                    text2,
                    style: const TextStyle(
                        fontSize: 16, color: Color.fromARGB(148, 79, 48, 119)),
                  ),
                ],
              ),
              Row(
                children: [
                  const Icon(Icons.star,
                      size: 16, color: Color.fromARGB(148, 79, 48, 119)),
                  const SizedBox(width: 5),
                  Text(
                    text3,
                    style: const TextStyle(
                        fontSize: 16, color: Color.fromARGB(148, 79, 48, 119)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class SearchBarExample extends StatefulWidget {
  const SearchBarExample({super.key});

  @override
  State<SearchBarExample> createState() => _SearchBarExampleState();
}

class _SearchBarExampleState extends State<SearchBarExample> {
  String searchText = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 236, 241, 246),
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: TextField(
            onChanged: (value) {
              setState(() {
                searchText = value;
              });
            },
            decoration: const InputDecoration(
              labelText: 'Search barber\'s haircut ser...',
              prefixIcon: Icon(Icons.search),
              border: InputBorder.none,
              contentPadding: EdgeInsets.all(8),
            ),
          ),
        ));
  }
}

class Banner {
  final String image;
  final String buttonTitle;

  Banner({required this.image, required this.buttonTitle});

  factory Banner.fromJson(Map<String, dynamic> json) {
    return Banner(
      image: json['image'],
      buttonTitle: json['button_title'],
    );
  }
}

class Barbershop {
  final String name;
  final String locationWithDistance;
  final String image;
  final double reviewRate;

  Barbershop({
    required this.name,
    required this.locationWithDistance,
    required this.image,
    required this.reviewRate,
  });

  factory Barbershop.fromJson(Map<String, dynamic> json) {
    return Barbershop(
      name: json['name'],
      locationWithDistance: json['location_with_distance'],
      image: json['image'],
      reviewRate: json['review_rate'].toDouble(),
    );
  }
}

class BarberShopData {
  final Banner banner;
  final List<Barbershop> nearestBarbershops;
  final List<Barbershop> list;
  final List<Barbershop> mostRecomanded;

  BarberShopData({
    required this.banner,
    required this.nearestBarbershops,
    required this.list,
    required this.mostRecomanded,
  });

  factory BarberShopData.fromJson(Map<String, dynamic> json) {
    return BarberShopData(
      banner: Banner.fromJson(json['banner']),
      nearestBarbershops: (json['nearest_barbershop'] as List)
          .map((item) => Barbershop.fromJson(item))
          .toList(),
      list: (json['list'] as List)
          .map((item) => Barbershop.fromJson(item))
          .toList(),
      mostRecomanded: (json['most_recommended'] as List)
          .map((item) => Barbershop.fromJson(item))
          .toList(),
    );
  }
}
