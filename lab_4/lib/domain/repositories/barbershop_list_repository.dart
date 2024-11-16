import 'package:lab_2/domain/models/barbershop_list_model.dart';

abstract class BarbershopListRepository {
  Future<List<BarbershopListModel>> fetchBarbershopList(
      Map<String, dynamic> json);
}
