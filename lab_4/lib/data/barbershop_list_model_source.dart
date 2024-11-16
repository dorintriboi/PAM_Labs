import 'package:lab_2/domain/models/barbershop_list_model.dart';
import 'package:lab_2/domain/repositories/barbershop_list_repository.dart';

class BarbershopListModelSource implements BarbershopListRepository {
  @override
  Future<List<BarbershopListModel>> fetchBarbershopList(
      Map<String, dynamic> json) async {
    return (json['list'] as List)
        .map((item) => BarbershopListModel.fromJson(item))
        .toList();
  }
}
