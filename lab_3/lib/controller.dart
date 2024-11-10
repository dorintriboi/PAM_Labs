import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:lab_2/main.dart';

class BarberShopController extends GetxController {
  var barberShopData = Rxn<BarberShopData>();

  var count = 3.obs;

  void updateCount(int newCount) {
    count.value = newCount;
  }

  Future<void> loadJsonData() async {
    try {
      String jsonString = await rootBundle.loadString('assets/barber.json');
      var data = jsonDecode(jsonString);

      barberShopData.value = BarberShopData.fromJson(data);
    } catch (e) {
      print('Eroare la încărcarea datelor: $e');
    }
  }
}
