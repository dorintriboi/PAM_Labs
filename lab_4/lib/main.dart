import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lab_2/presentation/widgets/custom_widget.dart';
import 'package:lab_2/presentation/widgets/most_recomanded_barbershop.dart';
import 'package:lab_2/presentation/widgets/search_bar.dart';
import 'presentation/controllers/controller.dart';

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
