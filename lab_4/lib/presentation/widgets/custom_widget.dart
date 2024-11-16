import 'package:flutter/material.dart';

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
