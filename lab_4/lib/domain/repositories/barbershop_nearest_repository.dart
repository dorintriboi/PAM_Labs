import 'package:lab_2/domain/models/barbershop_nearest_model.dart';

abstract class BarbershopNearestRepository {
  Future<List<BarbershopNearestModel>> fetchBarbershopNearest(
      Map<String, dynamic> json);
}
