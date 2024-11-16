import 'package:flutter/material.dart';
import 'package:lab_2/domain/models/barbershop_most_recomanded_model.dart';

class MostRecommendedWidget extends StatelessWidget {
  final List<BarbershopMostRecomandedModel> recommendedItems;

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
