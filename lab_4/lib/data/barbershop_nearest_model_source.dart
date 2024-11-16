import 'package:lab_2/domain/models/barbershop_nearest_model.dart';
import 'package:lab_2/domain/repositories/barbershop_nearest_repository.dart';

class BarbershopNearestModelSource implements BarbershopNearestRepository {
  @override
  Future<List<BarbershopNearestModel>> fetchBarbershopNearest(
      Map<String, dynamic> json) async {
    return (json['nearest_barbershop'] as List)
        .map((item) => BarbershopNearestModel.fromJson(item))
        .toList();
  }
}
