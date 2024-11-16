import 'package:lab_2/domain/models/barbershop_most_recomanded_model.dart';

abstract class BarbershopMostRecomandedRepository {
  Future<List<BarbershopMostRecomandedModel>> fetchBarbershopMostRecomanded(
      Map<String, dynamic> json);
}
