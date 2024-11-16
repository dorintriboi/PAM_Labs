import 'package:lab_2/domain/models/barbershop_most_recomanded_model.dart';
import 'package:lab_2/domain/repositories/barbershop_most_recomanded_repository.dart';

class BarbershopMostRecomandedModelSource
    implements BarbershopMostRecomandedRepository {
  @override
  Future<List<BarbershopMostRecomandedModel>> fetchBarbershopMostRecomanded(
      Map<String, dynamic> json) async {
    return (json['most_recommended'] as List)
        .map((item) => BarbershopMostRecomandedModel.fromJson(item))
        .toList();
  }
}
