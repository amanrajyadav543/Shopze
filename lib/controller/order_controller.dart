import 'package:get/get.dart';
import 'package:shopzy_grocery_user/data/api/api_checker.dart';
import 'package:shopzy_grocery_user/data/model/response/activeOrder_model.dart';
import 'package:shopzy_grocery_user/data/repository/order_repo.dart';

class OrderController extends GetxController implements GetxService {
  final OrderRepo orderRepo;
  OrderController({ required this.orderRepo});

  List<Orders>? _activeOrders;


  List<Orders>? get activeOrder =>_activeOrders;
  Future<void> getRunningOrders(int offset) async {
    _activeOrders=null;
     Response response = await orderRepo.getActiveOrderList(offset);
      if (response.statusCode == 200) {
        _activeOrders = [];
        _activeOrders!.addAll(ActiveOrderModel.fromJson(response.body).orders!);

      } else {
        ApiChecker.checkApi(response);
      }
      update();
    }

  }

